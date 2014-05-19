class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.references :votable, polymorphic: true
      t.integer :value
    end
  end
end
