class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :is_admin
      t.integer :post_id
      t.text :bio
      t.string :website

      t.timestamps
    end
  end
end
