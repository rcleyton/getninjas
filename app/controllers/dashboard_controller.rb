class DashboardController < ApplicationController

  def index 
    if current_user.professional?
      @orders = Order.all.order(created_at: :desc)
    else
      user = current_user.profile
      @orders = Order.where(profile_id: user)
    end
  end

end