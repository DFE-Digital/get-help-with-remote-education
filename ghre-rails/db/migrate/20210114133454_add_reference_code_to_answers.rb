class AddReferenceCodeToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :reference_code, :string
    add_index :answers, [:reference_code], unique: true
  end
end
