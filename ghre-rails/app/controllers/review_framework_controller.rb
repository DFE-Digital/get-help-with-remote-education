class ReviewFrameworkController < ApplicationController
  def index; end

  def start
    unless session[:answer_id]
      new_answer = Answer.new(reference_code: SecureRandom.uuid)
      new_answer.save!
      session[:answer_id] = new_answer.id
    end

    redirect_to questions_path(:start, questions[:start].first.to_s.dasherize)
  end

  def question; end

  private

    def questions
      {
        start: %i[
          which_educational_stage
        ]
      }
    end
end