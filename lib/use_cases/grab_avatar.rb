require 'grabzit'
require_relative './crop_image.rb'

module UseCases
  class GrabAvatar
    AVATAR_WIDTH = 140
    AVATAR_HEIGHT = 147
    BLEED = 50

    def perform(filepath:)
      # TODO: timeout
      client.url_to_image(avatar_url, options)
      client.save_to(filepath)

      # Sorry that I have to crop the watermark for layouts.
      # I'll design another section to give credit to GrabzIt in my final layout.
      CropImage.new.perform(filepath: filepath, width: AVATAR_WIDTH, height: AVATAR_HEIGHT)
    end

    private

    def options
      @options ||=
        image_options = GrabzIt::ImageOptions.new
        set_browser_size(options: image_options, height: AVATAR_HEIGHT + BLEED, width: AVATAR_WIDTH)
        image_options
    end

    def set_browser_size(options:, height:, width:)
      options.browserHeight = height
      options.browserWidth = width
    end

    def client
      @client ||= GrabzIt::Client.new(ENV['GRABZIT_APP_KEY'], ENV['GRABZIT_APP_SECRET'])
    end

    def avatar_url
      "https://crookedneighbor.github.io/habitica-avatar/avatar.html##{ENV['HABITICA_USER_ID']}"
    end
  end
end
