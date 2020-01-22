class Site::WelcomeController < SiteController
  def index
    @questions = Question.includes(:answers).order(created_at: :desc).page(params[:page]).per(5)
  end
end
