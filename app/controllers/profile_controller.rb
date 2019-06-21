class ProfileController < ApplicationController
  include ApplicationHelper
  before_action :authen_user!

  def star
    page = params[:page]
    getStar(page)
  end
end
