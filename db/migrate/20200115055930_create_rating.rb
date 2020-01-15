class CreateRating < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.belongs_to :user, null: false
      t.belongs_to :movie, null: false
      t.timestamps null: false
    end
  end
end
