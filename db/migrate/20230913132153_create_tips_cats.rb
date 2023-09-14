class CreateTipsCats < ActiveRecord::Migration[7.0]
  def change
    create_table :tips_cats do |t|
      t.integer :tip_id
      t.integer :cat_id

      t.timestamps
    end
  end
end
