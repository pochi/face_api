require "./lib/faceapi"
require "json"
require "pry"

params = {
  url: ARGV[0]
}.to_json

response = Faceapi::Face::detect(params)
binding.pry
