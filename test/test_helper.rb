# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "llamakit"

require "minitest/autorun"
require "minitest/pride"
require "byebug"
require "rack/mock"

def make_request(env)
  req = Rack::Request.new(env)
  yield(req) if block_given?
  req
end
