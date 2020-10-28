class Tweet < ApplicationRecord
  belongs_to :teacher, required: false
  belongs_to :student, required: false
  has_many :comments

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
