class AdminsBackoffice::SubjectsController < AdminsBackofficeController

    before_action :set_subject, only: [:edit, :update, :destroy]
    
    def index
      @subjects = Subject.all.order(:description).page(params[:page]).per(20)
    end
  
    def new
      @subject = Subject.new
    end
  
    def create
      @subject = Subject.create(subject_params)
      if(@subject.save)
        redirect_to subjects_backoffice_subjects_path, notice: "Dados cadastrados com sucesso."
      else
        render :new
      end
    end
  
    def edit
      
    end
  
    def update    
      if(@subject.update(subject_params))
        redirect_to admins_backoffice_subjects_path, notice: "Dados atualizados com sucesso."
      else
        render :edit
      end
    end
    
    def destroy
      if(@subject.destroy)
        redirect_to admins_backoffice_subjects_path, notice: "Cadastro deletado com sucesso."
      else
        render :index
      end
    
    end
  
    private 
    def set_subject
      @subject = Subject.find(params[:id])
    end
    
    def subject_params
      params.require(:subject).permit(:description)
    end
  
  end