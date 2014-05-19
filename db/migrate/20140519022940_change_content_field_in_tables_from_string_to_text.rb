class ChangeContentFieldInTablesFromStringToText < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.change :content, :text
    end

    change_table :answers do |t|
      t.change :content, :text
    end

    change_table :comments do |t|
      t.change :content, :text
    end
  end
end
