require 'net/http'
require 'json'
require 'openssl'
require 'uri'

module Services
  class GrabUserProfile
    def perform
      uri = URI('https://habitica.com/api/v3/user?userFields')
      req = Net::HTTP::Get.new(uri)
      req['x-api-user'] = ENV['HABITICA_USER_ID']
      req['x-api-key'] = ENV['HABITICA_API_KEY']
      begin
        res = Timeout.timeout(60) do
          Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
            http.request(req)
          end
        end
        result = JSON.parse(res.body)
        map_user_profile(result: result)
      rescue Timeout::Error
        raise 'Timeout (> 60 sec)'
      rescue StandardError => e
        raise e
      end
    end

    private

    def map_user_profile(result:)
      stats = result['data']['stats']
      {
        username: result['data']['auth']['local']['username'],
        class: stats['class'].capitalize,
        level: stats['lvl'],
        stats: stats.slice('hp', 'mp', 'exp').transform_keys(&:to_sym),
        max_stats: {
          max_hp: stats['maxHealth'],
          max_exp:  stats['toNextLevel'],
          max_mp: stats['maxMP'],
        }
      }
    end
  end
end
