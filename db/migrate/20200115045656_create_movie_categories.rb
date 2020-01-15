class CreateMovieCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_categories do |t|
      t.belongs_to :category, null: false
      t.belongs_to :movie, null: false
      t.timestamps null: false
    end
  end
end
