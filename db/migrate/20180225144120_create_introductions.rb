class CreateIntroductions < ActiveRecord::Migration[5.1]
  def change
    create_table :introductions do |t|
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
