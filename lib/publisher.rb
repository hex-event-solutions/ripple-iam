# frozen_string_literal: true

class Publisher
  class << self
    def publish(body:, headers:)
      exchange.publish(body.to_json, headers: headers)
    end

    private

    def bunny
      @bunny ||= Bunny.new(
        hostname: ENV.fetch('RABBIT_HOSTNAME'),
        port: ENV.fetch('RABBIT_PORT'),
        user: ENV.fetch('RABBIT_USER'),
        password: ENV.fetch('RABBIT_PASSWORD')
      ).tap(&:start)
    end

    def channel
      @channel ||= bunny.create_channel
    end

    def exchange
      @exchange ||= channel.headers(ENV.fetch('RABBIT_EXCHANGE'), durable: true)
    end
  end
end
