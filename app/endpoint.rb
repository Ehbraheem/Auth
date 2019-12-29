# frozen_string_literal: true

require_relative 'base'

module Auth
  class App
    class Endpoint < Base
      set(:prefix) { "/#{name[/[^:]+$/].downcase}" }
    end
  end
end

require_relative 'endpoint/home'
require_relative 'endpoint/roles'
