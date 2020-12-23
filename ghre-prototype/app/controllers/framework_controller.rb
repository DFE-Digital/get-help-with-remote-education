class FrameworkController < ApplicationController
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

  def question; end

  def submit_answer
    success = current_user.submit_answer(
      section: params[:section],
      question: params[:question],
      answer: params[:score_id].to_i,
    )

    if success
      if questions[params[:section].to_sym].last.to_s == params[:question]
        redirect_to framework_results_path
      else
        redirect_to framework_section_questions_path(params[:section], Leadership.new.questions.last)
      end
    end
  end

private

  def questions
    {
      leadership: %i[
        question_one
        question_two
      ],
    }
  end
end
