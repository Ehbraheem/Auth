# frozen_string_literal: true

# #
class Role
  include Mongoid::Document
  Mongoid::QueryCache.enabled = true

  field :name, type: String
  field :description, type: String
  field :uuid, type: String
  field :parent, type: Role
end
