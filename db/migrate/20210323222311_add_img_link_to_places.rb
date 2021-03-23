class AddImgLinkToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :remote_img, :string
  end
end
