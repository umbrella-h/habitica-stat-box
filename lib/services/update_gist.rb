require 'net/http'
require 'json'
require 'openssl'
require 'uri'
require 'oj'
require 'base64'

module Services
  class UpdateGist
    def perform(gist_id:, filename:, description:, content:)
      uri = URI("https://api.github.com/gists/#{gist_id}")
      req = Net::HTTP::Patch.new(uri)
      req['Accept'] = 'application/vnd.github+json'
      req['Authorization'] = "Bearer #{ENV['GH_PAT']}"
      req['X-GitHub-Api-Version'] ='2022-11-28'
      Oj.mimic_JSON
      req.body = Oj.generate(
        {
        "description": description,
        "files": {
              "#{filename}": {
                "content":  content,
              },
            },
          },
        )
      begin
        Timeout.timeout(60) do
          Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
            http.request(req)
          end
        end
      rescue Timeout::Error
        raise 'Timeout (> 60 sec)'
      rescue StandardError => e
        raise e
      end
    end
  end
end
