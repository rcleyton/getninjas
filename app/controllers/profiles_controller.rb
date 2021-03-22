class ProfilesController < ApplicationController
  before_action :authorize_professional!, except: %i[create]

  def show
    @profile = Profile.find(params[:id])
    if current_user.profile != @profile
      redirect_to root_path
    end
  end
  
  def new
    @profile = Profile.new
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:success] = "Perfil criado com sucesso"
      redirect_to @profile
    else  
      render :new
    end
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      redirect_to @profile
      flash[:notice] = 'Perfil atualizado com sucesso'
    else
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :phone, :city, :street, 
                                    :neighborhood, :zip_code, :state, :user_id)
  end

  def authorize_professional!
    if current_user.professional?
      redirect_to dashboard_path
      flash[:alert] = "Acesso não autorizado."
    end
  end
end