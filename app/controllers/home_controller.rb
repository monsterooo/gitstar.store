class HomeController < ApplicationController
  include ApplicationHelper

  def index
    @lang = params[:lang]
    @since = params[:since] || 'daily';
    @language = [['CSS', 'css'], ['HTML', 'html']]
    @trending = trending(@lang, @since)
  end
end
