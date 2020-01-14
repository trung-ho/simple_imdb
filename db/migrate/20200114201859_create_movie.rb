class CreateMovie < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.float :average_rate
      t.timestamps null: false
    end
  end
end
