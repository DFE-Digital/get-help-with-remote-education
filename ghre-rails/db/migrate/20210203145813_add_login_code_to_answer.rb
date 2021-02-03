class AddLoginCodeToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :login_code, :string
  end
end
