class AddLeadershipAnswersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :leaderships do |t|
      t.belongs_to :answer, foreign_key: true
      t.column :remote_education_plan, :integer
      t.timestamps
    end
  end
end
