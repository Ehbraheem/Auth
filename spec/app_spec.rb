RSpec.describe "Auth Api" do
  before(:each) { get "/" }

  it 'successfully pings app\'s root' do
    expect(last_response).to be_ok
  end

  it "returns correct response body" do
    payload = parsed_body

    expect(payload).to have_key "welcome"
    expect(payload["welcome"]).to_not be_nil
    expect(payload["welcome"]).to eq "This is an authn/authz service."
  end
end
