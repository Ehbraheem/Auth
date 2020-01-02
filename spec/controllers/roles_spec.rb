# frozen_string_literal: true

def roles_attr
  %i[name uuid description]
end

def check_error
  payload = parsed_body

  expect(payload).to have_key 'error'
  expect(payload['error']).to eq 'NOT FOUND'
end

RSpec.describe Roles, type: :controller do
  context 'GET #index' do
    let(:roles) { build_stubbed_list(:role, 5) }

    it 'success and renders all roles' do
      allow(Role).to receive(:all).and_return(roles)

      get '/roles'

      payload = parsed_body

      expect(payload).to respond_to :length
      expect(payload.length).to eq 5
      expect(payload.map { |f| f['name'] }).to eq(roles.map { |f| f[:name] })
      roles_attr.each do |attr|
        expect(payload.map { |e| e[attr.to_s] }).to match_array(roles.map { |e| e[attr] })
      end
    end

    it 'success but no roles is in system' do
      allow(Role).to receive(:all).and_return([])

      get '/roles'

      payload = parsed_body

      expect(payload).to respond_to :length
      expect(payload.length).to eq 0
    end
  end

  context 'GET #show' do
    let(:role) { build_stubbed(:role) }

    before(:example) do
      allow(Role).to receive(:find).with(role.id).and_return(role)
      allow(Role).to receive(:find).with('xx').and_raise(
        Mongoid::Errors::DocumentNotFound.new(Role, 'xx')
      )
    end

    it 'success and renders role' do
      get "/roles/#{role.id}"

      payload = parsed_body

      roles_attr.each do |key|
        expect(payload).to have_key key.to_s
        expect(payload[key.to_s]).to eq role[key]
      end
    end

    it 'fails because no role is associated with id' do
      get '/roles/xx'

      check_error
    end
  end

  context 'POST #create' do
    it 'creates a new role' do
      params = attributes_for :role
      stubbed = build_stubbed(:role, params)

      allow(Role).to receive(:create).with(params).and_return(stubbed)

      post '/roles', params.to_json, 'CONTENT_TYPE' => 'application/json'

      payload = parsed_body
      roles_attr.each do |key|
        expect(payload).to have_key key.to_s
        expect(payload[key.to_s]).to eq stubbed[key]
      end
    end
  end

  context 'PUT #update' do
    let(:role) { build_stubbed(:role) }
    let(:params) { attributes_for(:role).stringify_keys }

    before(:example) do
      allow(Role).to receive(:find).with(role.id) { role }
      allow(role).to receive(:update).with(params) do
        role.assign_attributes(params)
        role
      end
      allow(Role).to receive(:find).with('xx').and_raise(
        Mongoid::Errors::DocumentNotFound.new(Role, 'xx')
      )
    end

    it 'updated role info' do
      put "/roles/#{role.id}", params.to_json, 'CONTENT_TYPE' => 'application/json'

      payload = parsed_body

      params.each do |key, value|
        expect(payload).to have_key key.to_s
        expect(payload[key.to_s]).to_not be_nil
        expect(payload[key.to_s]).to eq value
      end
    end

    it 'fails because no role is associated with id' do
      put '/roles/xx', params.to_json, 'CONTENT_TYPE' => 'application/json'

      check_error
    end
  end

  context 'DELETE #destroy' do
    let(:role) { build_stubbed(:role) }

    before(:example) do
      allow(Role).to receive(:find).with(role.id) { role }
      allow(role).to receive(:destroy)
      allow(Role).to receive(:find).with('xx').and_raise(
        Mongoid::Errors::DocumentNotFound.new(Role, 'xx')
      )
    end

    it 'deleted role' do
      delete "/roles/#{role.id}"
      expect(last_response.status).to eq 204
    end

    it 'fails because no role is associated with id' do
      delete '/roles/xx'

      check_error
    end
  end
end
