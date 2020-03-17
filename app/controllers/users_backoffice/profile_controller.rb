class UsersBackoffice::ProfileController < UsersBackofficeController

  before_action :set_user, only: [:edit, :update]
  before_action :verify_password, only: [:update]

  def edit   
  end

  def update
    if(@user.update(user_params))
      sign_in(@user, bypass: true)
      redirect_to users_backoffice_profile_path, notice: "Dados atualizados com sucesso."
    else
      render :edit
    end
  end


  private
  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def verify_password
    if(params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
      params[:user].extract!(:password, :password_confirmation)
    end
  end

end
