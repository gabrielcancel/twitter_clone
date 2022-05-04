class CreateHashTagsTweet < ActiveRecord::Migration[7.0]
  def change
    create_table :hash_tags_tweets do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :hash_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
