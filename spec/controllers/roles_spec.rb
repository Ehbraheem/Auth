RSpec.describe Roles, type: :controller do

  context 'GET #index' do
    it 'success and renders all roles'
    it 'success but no roles is in system'
  end

  context 'GET #show' do
    it 'success and renders role'
    it 'fails because no role is associated with id'
  end

  context 'POST #create' do
    it 'creates a new role'
  end

  context 'PUT #update' do
    it 'updated role info'
    it 'fails because no role is associated with id'
  end

  context 'DELETE #destroy' do
    it 'deleted role'
    it 'fails because no role is associated with id'
  end
end