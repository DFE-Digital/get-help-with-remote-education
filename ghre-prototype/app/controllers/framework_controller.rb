class FrameworkController < ApplicationController
  class Leadership
    def questions
      %i[
        question_one
        question_two
      ]
    end
  end

  def index 
    unless session[:answers_id]
      new_answers = Answers.new(reference_code: SecureRandom.uuid)
      new_answers.save!
      session[:answers_id] = new_answers.id
    end
  end

  def section
    redirect_to framework_section_questions_path(params[:section], Leadership.new.questions.first)
  end

  def question

  end

  def submit_answer
  end
end
