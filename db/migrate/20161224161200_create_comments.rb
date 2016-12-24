class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.belongs_to :post, :index => true
    	t.text :text, :null => false
      t.timestamps
    end
    add_foreign_key :comments, :posts
  end
end
