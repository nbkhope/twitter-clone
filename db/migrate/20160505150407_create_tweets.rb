class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :content, null: false
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
