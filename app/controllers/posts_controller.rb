require 'uri'
require 'net/http'
require 'json'

class PostsController < ApplicationController
  def index
    if(post_params_sort)
      if(post_params_sort == 'id' ||post_params_sort == 'reads' ||post_params_sort == 'likes'|| post_params_sort == 'popularity' )
        uri = URI('https://api.hatchways.io/assessment/blog/posts?tag=' + post_params )
        res = Net::HTTP.get_response(uri)
        data = JSON.parse(res.body)

        if(post_params_direction == 'desc')
          arr = sort_result_desc(data)
        else
          arr = sort_result(data)
        end
        json_response(arr)
      else
        render json: {error:  "sortBy parameter is invalid"}
      end
    else
      uri = URI('https://api.hatchways.io/assessment/blog/posts?tag=' + post_params )
      res = Net::HTTP.get_response(uri)
      json_response(res.body)
    end
  end

  def sort_result(array)
    arr = array['posts'].sort_by {|_key, value| _key['likes']}
    return arr
  end
  def sort_result_desc(array)
    arr = array['posts'].sort_by {|_key, value| _key['likes']}.reverse
    return arr
  end

 private
  def post_params
    params[:tag]
  end
  def post_params_sort
    params[:sortBy]
  end
  def post_params_direction
    params[:direction]
  end 



  
end