# frozen_string_literal: true

# #
class Role
  include Mongoid::Document

  field :_id,  type: String, default: -> { id }
	field :id, type: String
  field :name, type: String
  field :description, type: String
  field :uuid, type: String
  field :parent, type: self.class
end
