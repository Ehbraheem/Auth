# frozen_string_literal: true

module Auth
  class App
    class Base < Sinatra::Base
      before do
        content_type 'application/json'
      end
    end
  end
end
