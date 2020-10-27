class Post < ApplicationRecord
  mount_uploader :movie, PostUploader
  belongs_to :teacher

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
