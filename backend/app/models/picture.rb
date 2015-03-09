class Picture < ActiveRecord::Base
	mount_uploader :pictures, ImageUploader
end
