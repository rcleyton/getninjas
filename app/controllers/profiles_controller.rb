class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
    if current_user.profile != @profile
      redirect_to root_path
    end
  end
  
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
    else  
      render :new
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :phone, :city, :street, 
                                    :neighborhood, :zip_code, :state, :user_id)
  end
end