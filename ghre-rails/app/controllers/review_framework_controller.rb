class ReviewFrameworkController < ApplicationController
  def index; end

  def start
    redirect_to question_path(:start, questions[:start].first)
  end

  private

    def questions
      {
        start: %i[
          which_educational_stage
        ]
      }
    end
end