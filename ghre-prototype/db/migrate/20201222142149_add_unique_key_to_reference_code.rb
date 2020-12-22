class AddUniqueKeyToReferenceCode < ActiveRecord::Migration[6.0]
  def change
    add_index :answers, [:reference_code], :unique => true
  end
end
