# frozen_string_literal: true

RSpec.describe Role, type: :model do
  context 'Basic CRUD' do
    let(:roles) { FactoryBot.create_list :role, 10 }
    let(:object) { FactoryBot.attributes_for :role }

    it 'can create valid Role' do
      obj = FactoryBot.create :role
      expect(obj).to be_persisted
    end

    it 'update existing Role' do
      roles
      obj = Role.first
      expect(obj.update(object)).to be true
    end

    it 'can read existing Role' do
      obj = Role.first
      expect(Role.all).to_not be_empty
      expect(Role.find(obj.id)).to be_a_kind_of Role
    end

    it 'can delete valid Role' do
      obj = Role.first
      expect(Role.find(obj.id)).to be_a_kind_of Role
      Role.destroy(obj.id)
      expect do
        Role.find(obj.id)
      end    .to raise_exception Mongoid::Errors::DocumentNotFound
    end
  end
end
