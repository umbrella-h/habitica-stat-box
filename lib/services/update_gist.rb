require 'net/http'
require 'json'
require 'openssl'
require 'uri'
require 'oj'
require 'base64'

module Services
  class UpdateGist
    def perform(filepath:)
      # TODO: debug

      # file_string = File.read(filepath)
      # base64_file_string = Base64.encode64(file_string)
      # encoded_file_string = Base64.decode64(base64_file_string).force_encoding('utf-8')
      # uri = URI("https://api.github.com/gists/#{ENV['GIST_ID']}")
      # req = Net::HTTP::Patch.new(uri)
      # req['Accept'] = 'application/vnd.github+json'
      # req['Authorization'] = "Bearer #{ENV['GH_PAT']}"
      # req['X-GitHub-Api-Version'] ='2022-11-28'
      # req.body = Oj.generate(
      #   {
      #   "description":"try to update image via ruby",
      #   "files": {
      #         "avatar.jpg": {
      #           "content": base64_file_string,
      #           "encoding": 'base64',
      #         },
      #       },
      #     },
      #   )
      # begin
      #   Timeout.timeout(60) do
      #     Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      #       http.request(req)
      #     end
      #   end
      # rescue Timeout::Error
      #   @res_object = Ecpay::ApiResponse.new('{"TransCode":"0","TransMsg":"Time limit exceeded"}')
      # rescue StandardError => e
      #   puts e
      # end
    end
  end
end
