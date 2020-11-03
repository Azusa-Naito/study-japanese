class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text   :difficult
      t.text   :text,        null: false
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.references :post,    foreign_key: true
      t.timestamps
    end
  end
end
