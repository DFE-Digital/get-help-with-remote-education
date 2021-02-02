class AddAnswerRefToDetails < ActiveRecord::Migration[6.0]
  def change
    add_reference :details, :answer, foreign_key: true
  end
end
