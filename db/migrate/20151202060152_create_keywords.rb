class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :word
      t.integer :count, :default => 0
    end
  end
end
