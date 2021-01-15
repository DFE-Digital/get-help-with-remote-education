class RemoveSchoolTypeFromAnswers < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :school_type
  end
end
