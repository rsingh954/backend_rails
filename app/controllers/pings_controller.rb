class PingsController < ApplicationController
  def index
    json_response({ success: true}, 200)
  end
end