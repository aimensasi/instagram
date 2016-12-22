class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :name, :null => false
    	t.string :username, :null => false
    	t.text :bio
    	t.string :website
    	t.string :email
    	t.string :gender
    	t.string :phone_number
    	t.string :password_digest

      t.timestamps
    end
    add_index :users, :username
  end
end
