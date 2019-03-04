class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :info
      t.belongs_to :user

      t.timestamps
    end
  end
end
