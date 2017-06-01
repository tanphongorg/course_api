class TestController < ApplicationController
  def perform
    respond_with params[:test]
  end
end
