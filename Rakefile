require_relative './lib/services/grab_avatar'
require_relative './lib/services/grab_user_profile'
require_relative './lib/services/update_gist'
require_relative './lib/view_models/stat_export'

task :dev_avatar do
  require 'dotenv/load'
  Rake::Task['stat_box_avatar'].execute
end

task :dev_stats do
  require 'dotenv/load'
  Rake::Task['stat_box'].execute
end

task :stat_box_avatar do
  filepath = './avatar.jpg'
  Services::GrabAvatar.new.perform(filepath: filepath)
  # Then, update gist via git command in workflows

  puts 'stat_box_avatar complete.'
end

task :stat_box do
  user_profile = Services::GrabUserProfile.new.perform
  gist_content = ViewModels::StatExport.new.build(user_profile: user_profile)
  gist_filename = 'habitica_stats.md'
  gist_descriptoin = 'Habitica stats'
  Services::UpdateGist.new.perform(gist_id: ENV['STATS_GIST_ID'], filename: gist_filename, content: gist_content, description: gist_descriptoin)

  puts 'stat_box complete.'
end

