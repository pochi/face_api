require "./lib/faceapi"
require "json"
require "pry"

params = {
  url: ARGV[2]
}.to_json

response = Faceapi::PersonGroup::Person.post(ARGV[0], ARGV[1], params)
binding.pry
