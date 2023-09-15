class AddSubtitleToTips < ActiveRecord::Migration[7.0]
  def change
    add_column :tips, :subtitle, :text
  end
end
