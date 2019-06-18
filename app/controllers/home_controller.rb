class HomeController < ApplicationController
  include ApplicationHelper

  def index
    @trending = trending('javascript')
  end
end
