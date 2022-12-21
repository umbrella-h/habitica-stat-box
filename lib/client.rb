require_relative './use_cases/grab_avatar.rb'
require_relative './use_cases/upload_image.rb'

filepath = './avatar.jpg'
UseCases::GrabAvatar.new.perform(filepath: filepath)
UseCases::UploadImage.new.perform(filepath: filepath, public_id: 'my_avatar')
