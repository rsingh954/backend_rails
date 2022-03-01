require 'uri'
require 'net/http'
require 'json'

class PostsController < ApplicationController
  def index
    if(post_params_sort)
      uri = URI('https://api.hatchways.io/assessment/blog/posts?tag=' + post_params )
      res = Net::HTTP.get_response(uri)
      data = JSON.parse(res.body)
      data.each { |d| puts json_response(d[1][0]["likes"]) }
    else
      uri = URI('https://api.hatchways.io/assessment/blog/posts?tag=' + post_params )
      res = Net::HTTP.get_response(uri)
      json_response(res.body)
    end
  end

 private
  def post_params
    params[:tag]
  end
  def post_params_sort
    params[:sortBy]
  end

  
end