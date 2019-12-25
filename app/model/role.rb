# frozen_string_literal: true

# #
class Role
  include Mongoid::Document
  Mongoid::QueryCache.enabled = true

  field :name, type: String
  field :description, type: String
  field :uuid, type: String
  field :parent, type: BSON::ObjectId

  before_save do |doc|
    self.parent = self.parent.id if self.parent?
  end
end
