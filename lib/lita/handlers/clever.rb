require 'lita'
require 'cleverbot'

module Lita
  module Handlers
    class Clever < Handler
      route(%r{^([\w .-_]+)$}i, :clever, command: true, help: {
        'clever' => 'Initializes clever.'
      })

      def self.default_config(handler_config)
      end

      def clever(response)
        @@client ||= Cleverbot::Client.new
        response.reply @@client.write(response.matches[0][0])
      end
    end

    Lita.register_handler(Clever)
  end
end
