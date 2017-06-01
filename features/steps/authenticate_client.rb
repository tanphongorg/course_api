class Spinach::Features::AuthenticateClient < Spinach::FeatureSteps
  step 'I get JWT token' do
    expect(JsonWebToken.decode(parsed_body[:data])[:client_id]).to eql(@client.id)
  end

  step 'I authenticate with wrong credentials' do
    post authenticate_clients_url, wrong_authenticate_client_params
  end

  private

  def authenticate_client_params
    {
      data: {
        name: @client.name,
        password: @client.password
      }
    }
  end

  def wrong_authenticate_client_params
    {
      data: {
        name: 'test',
        password: 'testsecret'
      }
    }
  end
end
