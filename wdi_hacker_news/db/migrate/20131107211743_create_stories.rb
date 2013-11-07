class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :url
      t.string :body
      t.integer :up_votes, default: 0
      t.belongs_to :user
      t.timestamps
    end
  end
end
