module Common
  module ResponseHelper
    include Spinach::DSL

    Then 'response is 200 Ok' do
      expect(http_status).to eql 200
    end

    Then 'response is 201 Created' do
      expect(http_status).to eql 201
    end

    Then 'response is 204 No Content' do
      expect(http_status).to eql 204
      expect(json_body).to be_empty
    end

    def result_count
      parsed_body.count
    end
  end
end