require 'rails_helper'

describe JsonWebToken do
  it 'encodes' do
    payload = {x: 1}
    jwt = JsonWebToken.encode(payload)
    expect(JsonWebToken.decode(jwt)[:x]).to eql(1)
  end
end