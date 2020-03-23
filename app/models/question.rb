class Question < ApplicationRecord
  belongs_to :subject, inverse_of: :questions, counter_cache: true
  has_many :answers
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  after_create :set_statistic

  # Kaminari
  paginates_per 5

  scope :_search, ->(page, term) {
          Question.includes(:answers).where("lower(description) LIKE ?", "%#{term.downcase}%").page(page)
        }

  scope :last_questions, ->(page) {
          Question.includes(:answers).order("created_at desc").page(page).per(5)
        }

  scope :_search_subject, ->(page, subject) {
          Question.includes(:answers, :subject).where(subject_id: subject).page(page)
        }

  private

  def set_statistic
    AdminStatistic.set_event(AdminStatistic::EVENTS[:total_questions])
  end
end
