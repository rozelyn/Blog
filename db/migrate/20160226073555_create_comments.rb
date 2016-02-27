class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :author_name
      t.integer :article_id, index:true, foreign_key:true 
      t.timestamps
    end
  end
end
