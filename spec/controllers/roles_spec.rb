# frozen_string_literal: true

RSpec.describe Roles, type: :controller do
  context 'GET #index' do
    let(:roles) { build_stubbed_list(:role, 5) }

    it 'success and renders all roles' do
      allow(Role).to receive(:all).and_return(roles)

      get '/roles'

      payload = parsed_body

      expect(payload).to respond_to :length
      expect(payload.length).to eq 5
      expect(payload).to match_array roles
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

    before(:each) do
      allow(Role).to receive(:find).with(role.id).and_return(role)
      allow(Role).to receive(:find).with('sdvsvsADGFsbCvs').and_return(nil)
    end

    it 'success and renders role' do
      get "/roles/#{role.id}"

      payload = parsed_body

      role.each do |key, value|
        expect(payload).to have_key key
        expect(payload[key]).to_not be_nil
        expect(payload[key]).to eq value
      end
    end

    it 'fails because no role is associated with id' do
      get '/roles/sdvsvsADGFsbCvs'

      payload = parsed_body

      expect(payload).to be_nil
    end
  end

  context 'POST #create' do
    it 'creates a new role' do
      params = attributes_for :role
      stubbed = params.merge(id: 'q3q2e')

      allow(Role).to receive(:create).with(params).and_return(stubbed)

      expect(post('/roles', params: { role: params })).to eq stubbed
    end
  end

  context 'PUT #update' do
    let(:role) { build_stubbed(:role) }
    let(:params) { attributes_for(:role) }

    before(:each) do
      # Role.stub_chain(:find, :update).with(role.id)
      # .with(params).and_return(role.merge(params))
      allow(Role).to receive(:find).with(role.id)
                                   .and_return(role)
      allow(Role).to receive(:find).with('sdvsvsADGFsbCvs')
                                   .and_return(nil)
      allow(role).to receive(:update).with(params)
                                     .and_return(role.merge(params))
    end

    it 'updated role info' do
      put "/roles/#{role.id}", params: { role: params }

      payload = parsed_body

      params.each do |key, value|
        expect(payload).to have_key key
        expect(payload[key]).to_not be_nil
        expect(payload[key]).to eq value
      end
    end

    it 'fails because no role is associated with id' do
      put '/roles/sdvsvsADGFsbCvs', params: { role: params }

      payload = parsed_body

      expect(payload).to be_nil
    end
  end

  xcontext 'DELETE #destroy' do
    let(:role) { build_stubbed(:role) }

    before(:each) do
      # Role.stub_chain(:find, :update).with(role.id)
      # .with(params).and_return(role.merge(params))
      allow(Role).to receive(:find).with(role.id)
                                   .and_return(role)
      allow(Role).to receive(:find).with('sdvsvsADGFsbCvs')
                                   .and_return(nil)
      allow(role).to receive(:destroy)
        .and_return(role.merge(nil))
    end

    it 'deleted role' do
      delete "/roles/#{role.id}"
    end
    it 'fails because no role is associated with id'
  end
end
