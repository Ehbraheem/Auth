# frozen_string_literal: true

$LOAD_PATH << 'auth'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

ENV['ROOT_PATH'] = __dir__

require_relative 'config/environment'
