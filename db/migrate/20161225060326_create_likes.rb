class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
    	t.belongs_to :user, :null => false
    	t.belongs_to :post, :null => false, :index => true

      t.timestamps
    end

    add_foreign_key :likes, :users
    add_foreign_key :likes, :posts
  end
end
