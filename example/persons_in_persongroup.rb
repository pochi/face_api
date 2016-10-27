require "./lib/faceapi"
require "json"
require "pry"

response = Faceapi::PersonGroup::Person::get(ARGV[0])
binding.pry
