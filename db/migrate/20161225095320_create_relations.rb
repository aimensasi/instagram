class CreateRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :relations do |t|
    	t.integer 'following_id', :null => false, :index => true
    	t.integer 'follower_id', :null => false, :index => true

      t.timestamps
    end
    add_index :relations, [:following_id, :follower_id], :unique => true
    # add_foreign_key :likes, :users
  end
end
