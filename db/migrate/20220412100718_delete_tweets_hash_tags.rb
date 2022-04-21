class DeleteTweetsHashTags < ActiveRecord::Migration[7.0]
  def change
    drop_table :tweets_hash_tags
  end
end
