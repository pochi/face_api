require "./lib/faceapi"
require "json"
require "pry"

params = {
  personGroupId: ARGV[0],
  faceIds: [ARGV[1]],
  maxNumOfCandidatesReturned: 1,
  confidenceThreshold: 0.5
}.to_json

response = Faceapi::Face::instance::identify(params)
binding.pry
