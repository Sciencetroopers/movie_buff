class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :about, :text
    add_column :users, :age, :decimal
  end
end
