class AddColumnToIntroductions < ActiveRecord::Migration[5.1]
  def change
    add_column :introductions, :age, :string
    add_column :introductions, :area, :string
  end
end
