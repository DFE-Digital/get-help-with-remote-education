class ReviewFrameworkController < ApplicationController
  def index; end

  def start
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