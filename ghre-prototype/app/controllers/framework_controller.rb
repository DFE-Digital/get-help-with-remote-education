class FrameworkController < ApplicationController
  class Leadership
    def questions
      [
        :remote_education_plan,
        :communication,
        :monitoring_and_evaluating
      ]
    end
  end

  def index; end

  def section
    redirect_to framework_section_questions_path(params[:section], Leadership.new.questions.first)
  end

  def question

  end
end

