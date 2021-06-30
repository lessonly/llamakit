# frozen_string_literal: true

require_relative "llamakit/version"
require_relative "llamakit/signal"

# Llamakit does a bunch of cool stuff
#
# It can create Demux signals for you!
#
# @example creating a Demux signal from a rack request
#   request = get_request_somehow()
#   signal = Llamakit::Signal.from_request request
#   signal.name #=> "lesson_available"
module Llamakit
  class Error < StandardError; end

  # Access the current configuration
  def configuration
    @configuration ||= Configuration.new
  end
  module_function :configuration

  # Alias so that we can refer to configuration as config
  def config
    configuration
  end
  module_function :config

  # Configure the library
  #
  # @yieldparam [Llamakit::Configuration] current_configuration
  #
  # @example
  #   Llamakit.configure do |config|
  #     config.lly_secret = ENV["LLY_SECRET"]
  #   end
  #
  # @yieldreturn [Llamakit::Configuration]
  def configure
    yield configuration
  end
  module_function :configure

  # Configuration holds the current configuration for the Degreed
  # and provides defaults
  class Configuration
    attr_accessor :lly_secret

    def initialize(args = {})
      @lly_secret = args.fetch(:lly_secret, "")
    end
  end
end
