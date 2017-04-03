class AddLinkYtToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :link_yt, :string
  end
end
