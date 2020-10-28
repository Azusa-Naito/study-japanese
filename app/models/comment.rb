class Comment < ApplicationRecord
  belongs_to :teacher, required: false
  belongs_to :student, required: false
  has_one :tweet
  
  # どちらかidが入っていないと登録できないようなバリデーション
end
