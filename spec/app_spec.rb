RSpec.describe "Auth Api" do
  it 'successfully pings app\'s root' do
    get "/"

    expect(last_response).to be_ok
  end
end
