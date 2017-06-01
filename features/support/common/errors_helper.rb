module Common
  module ErrorsHelper
    include Spinach::DSL

    Then 'I get 400 error' do
      assert_error(400)
    end

    Then 'I get 422 error' do
      assert_error(422)
    end

    Then 'I get 404 error' do
      assert_error(404)
    end

    Then 'I get 401 error' do
      assert_error(401)
    end

    Then 'I get 403 error' do
      assert_error(403)
    end

    def assert_error(status)
      expect(http_status).to eql status
    end
  end
end