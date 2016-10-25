class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :release_date
      t.string :genre
      t.string :cast
      t.text :summary
      t.text :poster
      t.string :runtime

      t.timestamps
    end
  end
end
