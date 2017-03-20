class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :min_year
      t.integer :max_year
      t.string :genre
      t.string :director
      t.string :actor

      t.timestamps
    end
  end
end
