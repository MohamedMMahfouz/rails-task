class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.references :user, foreig_key: true
      t.timestamps
    end
  end
end
