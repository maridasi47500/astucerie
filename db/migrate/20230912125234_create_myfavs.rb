class CreateMyfavs < ActiveRecord::Migration[7.0]
  def change
    create_table :myfavs do |t|
      t.integer :user_id
      t.integer :tip_id

      t.timestamps
    end
  end
end
