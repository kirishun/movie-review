class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body,        null: false
      t.references :movie, foreign_key: true
      t.references :user,  foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:movie_id, :user_id], unique: true
  end
end
