class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :sent_name
      t.string :sent_user
      t.integer :sent_id
      t.string :message
      t.belongs_to :user

      t.timestamps
    end
  end
end
