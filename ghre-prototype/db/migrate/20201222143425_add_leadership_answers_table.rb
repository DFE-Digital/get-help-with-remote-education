class AddLeadershipAnswersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :leadership_answers do |t|
      t.column :question_one, :integer
      t.column :question_two, :integer
    end

    add_reference :leadership_answers, :answers, foreign_key: true
  end
end
