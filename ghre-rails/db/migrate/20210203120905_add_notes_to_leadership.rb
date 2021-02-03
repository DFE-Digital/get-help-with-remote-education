class AddNotesToLeadership < ActiveRecord::Migration[6.0]
  def change
    change_table :leaderships, bulk: true do |t|
      t.column :remote_education_plan_notes, :text
      t.column :communication_notes, :text
      t.column :monitoring_and_evaluating_notes, :text
    end
  end
end
