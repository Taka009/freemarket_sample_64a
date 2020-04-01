class Image < ApplicationRecord
  belongs_to :animal, option: true
  mount_uploader :image_url Imageuploader
end
