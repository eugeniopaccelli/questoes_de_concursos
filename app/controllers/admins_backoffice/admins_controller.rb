class AdminsBackoffice::AdminsController < AdminsBackofficeController
  
  def index
    @admins = Admin.all
  end
  def edit
    @admin = Admin.find(params[:id])
  end

  def update
  @admin = Admin.find(params[:id])
    if(@admin.update(admin_params))
      redirect_to admins_backoffice_admins_path, notice: "Dados atualizados com sucesso."
    else
      render :edit
    end
  end 

  private
  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end

end