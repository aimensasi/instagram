class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
    	t.belongs_to :user, :index => true
    	t.string :media, :null => false
    	t.string :caption

      t.timestamps
    end
    add_foreign_key :posts, :users
  end
end
