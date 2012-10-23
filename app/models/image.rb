class Image < ActiveRecord::Base
  attr_accessible :name, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :album_id, :user_id
  belongs_to :album
  belongs_to :user
  
    has_attached_file :photo,
      :styles => {
      :thumb  => "100x100",
      :medium => "200x200",
      :large => "600x400"
  },
  :storage => :s3,
  :s3_credentials => { :access_key_id     => ENV['S3_KEY'],
                       :secret_access_key => ENV['S3_SECRET'] },
  :path => ":attachment/:id/:style.:extension",
  :bucket => 'photocloud-jw'
  
end
