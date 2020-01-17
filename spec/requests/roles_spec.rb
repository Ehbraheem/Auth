# frozen_string_literal: true

def roles_attr
  %i[name uuid description]
end

RSpec.describe Roles, type: :request do
  context 'caller request all Roles' do
    context 'roles in DB' do
      let!(:resources) { create_list :role, 5 }
      let(:payload) { parsed_body }

      before(:example) do
        get '/roles'
      end

      it 'success with appropriate content type' do
        expect(last_response.content_type).to eq 'application/json'
      end

      it 'success with appropriate status code' do
        expect(last_response.status).to be 200
      end

      it 'returns all Roles in the DB' do
        expect(payload.count).to eq resources.count

        expect(payload.map { |f| f['name'] }).to eq(resources.map { |f| f[:name] })
        roles_attr.each do |attr|
          expect(payload.map { |e| e[attr.to_s] }).to match_array(resources.map { |e| e[attr] })
        end
      end

      it 'returns exact Roles that are in the DB' do
        expect(payload.map { |f| f['name'] }).to eq(resources.map { |f| f[:name] })
        roles_attr.each do |attr|
          expect(payload.map { |e| e[attr.to_s] }).to match_array(resources.map { |e| e[attr] })
        end
      end
    end

    context 'no roles in the DB' do
      let(:payload) { parsed_body }

      before(:example) do
        get '/roles'
      end

      it 'success with appropriate content type' do
        expect(last_response.content_type).to eq 'application/json'
      end

      it 'success with appropriate status code' do
        expect(last_response.status).to be 200
      end

      it 'returns empty array when no Roles in the DB' do
        expect(payload).to be_empty
      end
    end
  end

  context 'specific role' do
    let(:role) { create :role }

    let(:payload) { parsed_body }

    it 'returns Role when given correct ID' do
      get "/roles/#{role.id}"

      expect(last_response.status).to be 200

      expect(payload).to_not be_empty
      roles_attr.each do |key|
        expect(payload).to have_key key.to_s
        expect(payload[key.to_s]).to eq role[key]
      end
    end
    it 'returns not found when given incorrect ID' do
      get '/roles/5553223'

      expect(last_response.status).to be 404
      check_error
    end
  end
end
