class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end
end
