class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :mail, :email
  end
end
