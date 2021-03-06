require 'lita'
require 'clever-api'
require 'htmlentities'

module Lita
  module Handlers
    class Clever < Handler
      route(/.+/, :clever, command: true, help: {
        'clever' => 'Initializes clever.'
      })

      def self.default_config(handler_config)
      end

      def clever(response)
        puts "Ask cleverbot for #{response.matches[0]}"
        @@client ||= ::CleverBot.new
        response.reply HTMLEntities.new.decode(@@client.think(response.matches[0]))
      end
    end

    Lita.register_handler(Clever)
  end
end
