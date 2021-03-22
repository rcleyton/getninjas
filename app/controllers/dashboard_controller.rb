class DashboardController < ApplicationController

  def index 
    if current_user.professional?
      @orders = Order.all
    else
      user = current_user.profile
      @orders = Order.where(profile_id: user)
    end
  end

end