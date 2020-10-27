class Tweet < ApplicationRecord
  belongs_to :teacher
  belongs_to :student

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
