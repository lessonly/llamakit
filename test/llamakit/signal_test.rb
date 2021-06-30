# frozen_string_literal: true

require "test_helper"

class LlamakitSignalTest < Minitest::Test
  class LlamakitSignalReadyTest < Minitest::Test
    def test_that_it_validates_signatures
      Llamakit.config.stub :lly_secret, "cocoabreadkonqueso" do
        signal = Llamakit::Signal.new(name: "signal_name",
                                      signature: "10621b2767ab453e4bca50f4d345ad7cf60684eda302829794d4808fa7bf1440",
                                      body: '{"swagger": "wagon"}')
        assert signal.valid?
      end
    end

    def test_that_it_invalidates_signatures
      Llamakit.config.stub :lly_secret, "cocoabreadkonqueso" do
        signal = Llamakit::Signal.new(name: "signal_name",
                                      signature: "FREE_YOUR_MIND_YOUR_BODY_AND_YOUR_SOUL",
                                      body: '{"swagger": "wagon"}')
        refute signal.valid?
      end
    end
  end

  class LlamakitSignalFromRequestTest < Minitest::Test
    # rubocop:disable Metrics/MethodLength
    def test_that_it_creates_an_instance_from_a_request
      request = make_request(
        Rack::MockRequest.env_for("http://gettingsome.coffee/signal/receive",
                                  { input: "lemonade was a popular drink and it still is" })
      ) do |req|
        req.set_header "HTTP_X_DEMUX_SIGNAL", "yacht_rock"
        req.set_header "HTTP_X_DEMUX_SIGNATURE", "$up3r_$3cR3t"
      end

      signal = Llamakit::Signal.from_request request
      assert_equal signal.name, "yacht_rock"
      assert_equal signal.signature, "$up3r_$3cR3t"
      assert_equal signal.body, "lemonade was a popular drink and it still is"
    end
  end
  # rubocop:enable Metrics/MethodLength
end
