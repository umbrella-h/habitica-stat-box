require 'grabzit'

module UseCases
  class GrabAvatar
    def perform
      # TODO: timeout
      client.url_to_image(avatar_url, options)
      client.save_to(filepath)
    end

    private

    def options
      @options ||=
        image_options = GrabzIt::ImageOptions.new
        set_browser_size(options: image_options, height: 147 + 50, width: 140)
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

    def filepath
      './avatar.jpg'
    end
  end
end
