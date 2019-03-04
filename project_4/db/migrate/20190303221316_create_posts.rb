class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :info
      t.integer :number_of_likes
      t.string :view
      t.string :author
      t.belongs_to :user

      t.timestamps
    end
  end
end
