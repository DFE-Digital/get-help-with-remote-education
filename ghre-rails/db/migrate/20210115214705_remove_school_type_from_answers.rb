class RemoveSchoolTypeFromAnswers < ActiveRecord::Migration[6.0]
  def up
    remove_column :answers, :school_type
  end

  def down
    add_column :answers, :school_type, :string
  end
end
