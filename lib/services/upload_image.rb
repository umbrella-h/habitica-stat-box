require 'cloudinary'

module Services
  class UploadImage
    def perform(filepath:, public_id:  'my_avatar', folder: 'habitica-stat-box/')
      result = Cloudinary::Uploader.upload(
        filepath,
        folder: folder,
        public_id: public_id,
        overwrite: true,
        resource_type: 'image',
        cloud_name: ENV['CLOUDINARY_CLOUD_NAME'],
        api_key: ENV['CLOUDINARY_API_KEY'],
        api_secret: ENV['CLOUDINARY_API_SECRET'],
      )
      result['url']
    end
  end
end
