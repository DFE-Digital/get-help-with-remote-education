class AddSchoolTypeToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :school_type, :string
  end
end
