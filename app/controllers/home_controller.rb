class HomeController < ApplicationController
  include ApplicationHelper

  def index
    @lang = params[:lang]
    @language = [['CSS', 'css'], ['HTML', 'html']]
    @trending = trending(@lang)
  end
end
