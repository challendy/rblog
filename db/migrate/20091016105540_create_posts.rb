class CreatePosts < ActiveRecord::Migration
    def self.up
        create_table :posts do |t|
            t.string :permalink
            t.string :title  
            t.references :category
            t.references :author
            t.integer :comments_count, :default => 0
            t.integer :rating, :default => 0

            t.integer :content_id
            t.string :content_type

            t.boolean :user_commentable, :null => false, :default => true
            t.boolean :guest_commentable, :null => false, :default => true

            t.boolean :draft, :null => false, :default => true
            t.datetime :published_at
            t.timestamps
        end

        add_index :posts, :permalink, :unique => true
        add_index :posts, :category_id
        add_index :posts, :author_id
        add_index :posts, :rating
        add_index :posts, :published_at
    end

    def self.down
        remove_index :posts, :permalink
        remove_index :posts, :category_id
        remove_index :posts, :author_id
        remove_index :posts, :rating
        remove_index :posts, :published_at

        drop_table :posts
    end
end
