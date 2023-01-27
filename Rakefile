require_relative './lib/services/grab_avatar.rb'
require_relative './lib/services/upload_image.rb'

task :dev do
    require 'dotenv/load'
    Rake::Task['stat_box'].execute
end

task :stat_box do
    filepath = './avatar.jpg'
    Services::GrabAvatar.new.perform(filepath: filepath)
    url = Services::UploadImage.new.perform(filepath: filepath)

    puts 'stat_box complete.'
    puts "avatar.jpg  url: #{url}"
end