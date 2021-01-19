class ReviewFrameworkController < ApplicationController
  def index; end

  def start
    unless session[:answer_id]
      new_answer = Answer.new(reference_code: SecureRandom.uuid)
      new_answer.save!
      session[:answer_id] = new_answer.id
    end

    redirect_to questions_path(:leadership, questions[:leadership].first.to_s.dasherize)
  end

  def question; end

  def results; end

  def submit_answer
    success = current_user.submit_answer(
      section: params[:section],
      question: params[:question].underscore,
      answer: params[:score_id].to_i,
    )

    current_user.save!

    redirect_to results_path
  end

private

  def questions
    {
      details: %i[
        which_educational_stage
      ],
      leadership: %i[
        remote_education_plan
      ]
    }
  end
end
