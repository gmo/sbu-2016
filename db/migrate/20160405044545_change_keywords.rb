class ChangeKeywords < ActiveRecord::Migration
  def change
    change_table :keywords do |t|
      t.string :language
    end
  end
end
