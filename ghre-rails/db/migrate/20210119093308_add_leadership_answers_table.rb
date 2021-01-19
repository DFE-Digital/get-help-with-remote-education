class AddLeadershipAnswersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :leadership_answers do |t|
      t.column :remote_education_plan, :integer
    end

    add_reference :leadership_answers, :answers, foreign_key: true
  end
end
