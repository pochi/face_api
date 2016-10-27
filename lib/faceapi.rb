require "faceapi/version"
require "httparty"

module Faceapi
  DEFAULT_HEADER = { 'Content-Type' => 'application/json',
                     'Ocp-Apim-Subscription-Key' => ENV["MS_FACEAPI_KEY"] }
  DEFAULT_URI = "https://api.projectoxford.ai/face/v1.0"

  class Face
    class << self
      def identify(body)
        ::HTTParty.post(::Faceapi::DEFAULT_URI + "/identify",
                        body: body,
                        headers: ::Faceapi::DEFAULT_HEADER)
      end
    end
  end
end
