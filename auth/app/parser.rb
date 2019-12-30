# frozen_string_literal: true

require 'multi_json'
require 'oj'

module Auth
  class App
    # This module doesn't do anything much other than it's a wrapper arround MultiJson
    # It is useful in sense of if I will need to change the JSON parse lib.
    # I will only have to do that one place
    class Parser
      def self.load(value)
        json.load value
      end

      def self.dump(value)
        json.dump value
      end

      def self.json
        MultiJson.use :oj
        @json ||= MultiJson
      end
    end
  end
end
