class AddDualLanguageSupport < ActiveRecord::Migration[6.0]
  def change
    rename_column :places, :name, :en_name
    rename_column :places, :description, :en_description
    add_column :places, :es_name, :string
    add_column :places, :es_description, :string
  end
end
