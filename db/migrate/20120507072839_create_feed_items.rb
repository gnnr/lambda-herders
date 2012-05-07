class CreateFeedItems < ActiveRecord::Migration
  def change
    create_table :feed_items do |t|
      t.text :text
      t.string :category

      t.timestamps
    end
  end
end
