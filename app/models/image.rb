class Image < ActiveRecord::Base
  attr_accessible :name, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :album_id
  belongs_to :albums
  
    has_attached_file :photo,
      :styles => {
      :thumb  => "100x100",
      :medium => "200x200",
      :large => "600x400"
  },
  :storage => :s3,
  :s3_credentials => { :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
                       :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'] },
  :path => ":attachment/:id/:style.:extension",
  :bucket => 'photocloud-jw'
  
end
