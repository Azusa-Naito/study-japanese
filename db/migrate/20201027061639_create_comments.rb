class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text,          null: false
      t.references :tweet,   null: false, foreign_key: true
      t.references :teacher, null: true #, foreign_key: true
      t.references :student, null: true #, foreign_key: true
      t.timestamps
    end
  end
end
