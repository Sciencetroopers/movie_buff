class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :synopsis
      t.string :director
      t.string :actors
      t.string :rating
      t.integer :year
      t.string :month
      t.string :genre
      t.string :length
      t.string :language
      t.string :link_rt
      t.string :link_w
      t.string :link_fb

      t.timestamps
    end
  end
end
