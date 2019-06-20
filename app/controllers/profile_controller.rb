class ProfileController < ApplicationController
  include ApplicationHelper

  def star
    page = params[:page]
    getStar(page)
  end
end
