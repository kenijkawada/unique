class RenameTitreColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :title, :category
  end
end
