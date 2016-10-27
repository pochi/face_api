require "faceapi/version"
require "httparty"
require "singleton"

module Faceapi
  DEFAULT_HEADER = { 'Content-Type' => 'application/json',
                     'Ocp-Apim-Subscription-Key' => ENV["MS_FACEAPI_KEY"] }
  DEFAULT_URI = "https://api.projectoxford.ai/face/v1.0"

  module Face
    class << self
      def identify(body)
        ::HTTParty.post(::Faceapi::DEFAULT_URI + "/identify",
                        body: body,
                        headers: ::Faceapi::DEFAULT_HEADER)
      end

      def detect(body)
        query = {
          returnFaceId: "true",
          returnFaceLandmarks: "false",
          returnFaceAttributes: ["age", "gender", "headPose", "smile", "facialHair", "glasses"].join(",")
        }
        ::HTTParty.post(::Faceapi::DEFAULT_URI + "/detect",
                        body: body,
                        query: query,
                        headers: ::Faceapi::DEFAULT_HEADER)
      end
    end
  end

  module PersonGroup
    class <<self
      def train(id)
        ::HTTParty.post(::Faceapi::DEFAULT_URI + "/persongroups/" + id.to_s + "/train",
                        headers: ::Faceapi::DEFAULT_HEADER)
      end
    end

    module Person
      class << self
        def get(id)
          ::HTTParty.get(::Faceapi::DEFAULT_URI + "/persongroups/" + id.to_s + "/persons",
                          headers: ::Faceapi::DEFAULT_HEADER)
        end

        def post(group_id, id, body)
          ::HTTParty.post(::Faceapi::DEFAULT_URI + "/persongroups/" + group_id + "/persons/" + id + "/persistedFaces",
                         body: body,
                         headers: ::Faceapi::DEFAULT_HEADER)

        end
      end
    end
  end
end
