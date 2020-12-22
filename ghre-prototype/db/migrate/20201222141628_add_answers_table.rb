class AddAnswersTable < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :reference_code
      t.string :school_type
    end
  end
end
