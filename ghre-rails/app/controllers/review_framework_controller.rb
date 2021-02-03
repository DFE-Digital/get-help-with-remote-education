require 'notifications/client'
class ReviewFrameworkController < ApplicationController
  def index; end

  def start
    unless session[:answer_id]
      new_answer = Answer.new(reference_code: SecureRandom.uuid, login_code: SecureRandom.uuid)
      new_answer.save!
      session[:answer_id] = new_answer.id
    end

    redirect_to review_framework_task_list_path
  end

  def input_email; end

  def send_email
    client = Notifications::Client.new(ENV['GOV_NOTIFY_API_KEY'])
    emailresponse = client.send_email(
      email_address: params[:email],
      template_id: "f3059d74-3b51-48e2-bcd3-19613bd010e5",
      personalisation: {
        login_code: current_user.login_code
      }
    )

    render 'review_framework/email_success'
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
    @answers = current_user.answers_to_hash
  end

  def submit_answer
    section = params[:section].to_sym
    question = params[:question].underscore.to_sym

    current_user.submit_answer(
      section: section,
      question: question,
      answer: params[:score_id].to_i,
      notes: params[:notes]
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
