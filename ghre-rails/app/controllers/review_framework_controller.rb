class ReviewFrameworkController < ApplicationController
  def index; end

  def start
    unless session[:answer_id]
      new_answer = Answer.new(reference_code: SecureRandom.uuid)
      new_answer.save!
      session[:answer_id] = new_answer.id
    end

    redirect_to questions_path(:details, questions[:details].first.to_s.dasherize)
  end

  def question; end

  def submit_answer
    success = current_user.save_answer(
      section: params[:section],
      question: params[:question],
      answer: params[:score_id].to_i
    )

    redirect_to results_path
  end

  private

    def questions
      {
        details: %i[
          which_educational_stage
        ]
      }
    end
end