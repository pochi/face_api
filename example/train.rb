require "./lib/faceapi"
require "json"
require "pry"

response = Faceapi::PersonGroup::train(ARGV[0])
binding.pry
