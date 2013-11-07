class CreateComments < ActiveRecord::Migration
  def change
  create_table :comments do |t|
    t.string :body
    t.integer :up_votes, default: 0
    t.belongs_to :user
    t.belongs_to :story
    t.timestamps
  end
  end
end
