class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :movie,   null: false
      t.string     :title,   null: false
      t.text       :text,    null: false
      t.references :teacher, null: false
      t.timestamps
    end
  end
end
