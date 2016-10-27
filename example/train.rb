require "./lib/faceapi"
require "json"
require "pry"

response = Faceapi::PersonGroup::instance::train(ARGV[0])
binding.pry
