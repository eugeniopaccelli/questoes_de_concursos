class Site::SearchController < SiteController
  def questions
    @questions = Question.search(params[:term])
  end

  def subject
    @questions = Question._search_subject(params[:page], params[:subject_id])
  end
end
