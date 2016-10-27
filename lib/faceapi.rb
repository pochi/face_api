require "faceapi/version"
require "httparty"
require "singleton"

module Faceapi
  DEFAULT_HEADER = { 'Content-Type' => 'application/json',
                     'Ocp-Apim-Subscription-Key' => ENV["MS_FACEAPI_KEY"] }
  DEFAULT_URI = "https://api.projectoxford.ai/face/v1.0"

  class Face
    include Singleton
    def identify(body)
      ::HTTParty.post(::Faceapi::DEFAULT_URI + "/identify",
                      body: body,
                      headers: ::Faceapi::DEFAULT_HEADER)
    end
  end

  class PersonGroup
    include Singleton
    def train(id)
      ::HTTParty.post(::Faceapi::DEFAULT_URI + "/persongroups/" + id.to_s + "/train",
                      headers: ::Faceapi::DEFAULT_HEADER)
    end

    class Person
      include Singleton
      def get(id)
        ::HTTParty.get(::Faceapi::DEFAULT_URI + "/persongroups/" + id.to_s + "/persons",
                        headers: ::Faceapi::DEFAULT_HEADER)
      end
    end
  end
end
