class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.text :text
      t.string :category
      t.integer :token_id
      t.timestamps
    end
  end
end
