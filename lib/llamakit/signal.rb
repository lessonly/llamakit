# frozen_string_literal: true

require "openssl"

module Llamakit
  # Class representing a {https://github.com/lessonly/demux Demux signal}
  # as well as a helper valid? method to validate that the signature on a
  # signal matches the signature generated from the secret defined at LLY_SECRET
  class Signal
    attr_reader :name, :signature, :body

    class << self
      def from_request(request)
        signal_name = request.get_header("HTTP_X_DEMUX_SIGNAL")
        signal_signature = request.get_header("HTTP_X_DEMUX_SIGNATURE")
        signal_body = request.body.read
        new(name: signal_name, signature: signal_signature, body: signal_body)
      end
    end

    def initialize(name:, signature:, body:)
      @name = name
      @signature = signature
      @body = body
    end

    # Compare incoming Demux signature against secret for secure requests
    #
    # @return [Boolean]
    def valid?
      expected = OpenSSL::HMAC.hexdigest("SHA256", Llamakit.config.lly_secret, @body)
      expected.bytesize == @signature.bytesize && OpenSSL.fixed_length_secure_compare(expected, @signature)
    end
  end
end
