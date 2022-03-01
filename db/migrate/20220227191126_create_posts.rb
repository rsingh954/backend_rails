class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :author
      t.string :authorId
      t.string :likes
      t.string :popularity
      t.string :reads
      t.string :tags

      t.timestamps
    end
  end
end
