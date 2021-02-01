class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table(:answers, &:timestamps)
  end
end
