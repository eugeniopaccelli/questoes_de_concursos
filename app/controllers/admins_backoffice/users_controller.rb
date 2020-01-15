class AdminsBackoffice::UsersController < AdminsBackofficeController

    def index
      @users = User.all.order(:description).page(params[:page]).per(20)
    end

    
end