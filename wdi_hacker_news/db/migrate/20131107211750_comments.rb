class Comments < ActiveRecord::Migration
  def change
    t.body
    t.integer :up_votes, default: 0
    t.belongs_to :user
    t.belongs_to :story
    t.timestamps
  end
end
