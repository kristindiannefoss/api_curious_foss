require 'faraday'
require 'json'

class GoogleService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://www.googleapis.com")
    @connection.headers["Authorization"] = "Bearer ya29.CjHuAgrCMm1Cvo2hcCJv69JjcC4-cJl5n4gZ5pTa2geKgoV5EuguEAQ3L3YWf0tyHoZT"
  end


  def google
    GoogleService.new
  end
  #
  # labelIds: "UNREAD"
  # labelIds: "INBOXap"
  #
  # "#{message_details.first}"

  def messages

   JSON.parse(google.connection.get("/gmail/v1/users/kris.foss@gmail.com/messages").body)["messages"] #a nested array of hashes with thredid and id, adding on the key kets you the array of the messages

    # JSON.parse(GoogleService.new.connection.get("https://www.googleapis.com/gmail/v1/users/kris.foss@gmail.com/messages").body)["messages"] #a nested array of hashes with thredid and id, adding on the key kets you the array of the messages
  end

  def message(id)
    JSON.parse(google.connection.get("/gmail/v1/users/kris.foss@gmail.com/messages/#{id}").body)
  end

  # 154eaacf3d7b6dc4

  # def message_details
  #   messages.map { |message| message["id"] }
  #   # iterate through each one and grab google.connection.get
  # end

  private

      # def parse(response)
      #   JSON.parse(response.body, symbolize_names: true)
      # end
  end
# https://www.googleapis.com/gmail/v1/users/userId/messages
# 109256579759284266887
