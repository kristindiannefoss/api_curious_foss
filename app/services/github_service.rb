class GithubService
  attr_reader :connection

  def initialize
    @connection = Faraday::Client.new(url: 'https://github.com')
  end

  

end
