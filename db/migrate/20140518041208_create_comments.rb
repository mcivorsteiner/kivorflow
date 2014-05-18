class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.string :content
      t.timestamps
    end
  end
end
