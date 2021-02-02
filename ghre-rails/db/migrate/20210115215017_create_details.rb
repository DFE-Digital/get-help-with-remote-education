class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.string :which_educational_stage

      t.timestamps
    end
  end
end
