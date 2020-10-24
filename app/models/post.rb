class Post < ApplicationRecord
  mount_uploader :movie, PostUploader
  belongs_to :teacher
end
