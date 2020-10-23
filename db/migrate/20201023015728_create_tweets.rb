class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :text,    null: false
      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true
      t.timestamps
    end
  end
end
