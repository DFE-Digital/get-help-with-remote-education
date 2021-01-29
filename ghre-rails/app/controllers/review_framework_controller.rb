class ReviewFrameworkController < ApplicationController
  def index; end

  def start
    unless session[:answer_id]
      new_answer = Answer.new(reference_code: SecureRandom.uuid)
      new_answer.save!
      session[:answer_id] = new_answer.id
    end

    redirect_to review_framework_task_list_path
  end

  def question
    @section = params[:section]
    @question = params[:question].underscore
  end

  def section
    target_section = params[:section].to_sym
    redirect_to questions_path(target_section, questions[target_section].first.to_s.dasherize)
  end

  def task_list; end

  def recommendations
    @answers = current_user
  end

  def submit_answer
    section = params[:section].to_sym
    question = params[:question].underscore.to_sym

    success = current_user.submit_answer(
      section: section,
      question: question,
      answer: params[:score_id].to_i,
    )

    current_user.save!

    cur_index = questions[section].index(question)
    next_question = questions[section].fetch(cur_index + 1, :end)

    if next_question == :end
      redirect_to review_framework_task_list_path
    else
      redirect_to questions_path(:leadership, next_question.to_s.dasherize)
    end
  end

private

  def questions
    {
      details: %i[
        which_educational_stage
      ],
      leadership: %i[
        remote_education_plan
        communication
        monitoring_and_evaluating
      ],
    }
  end
end
