class ChangeKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :language, :string
    add_column :keywords, :gcount, :integer
  end
end
