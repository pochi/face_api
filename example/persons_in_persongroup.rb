require "./lib/faceapi"
require "json"
require "pry"

response = Faceapi::PersonGroup::Person::instance::get(ARGV[0])
binding.pry
