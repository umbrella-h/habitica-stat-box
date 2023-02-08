require_relative './lib/services/grab_avatar'

task :dev do
  require 'dotenv/load'
  Rake::Task['stat_box'].execute
end

task :stat_box do
  filepath = './avatar.jpg'
  Services::GrabAvatar.new.perform(filepath: filepath)

  puts 'stat_box complete.'
end
