class Message < OpenStruct

  def self.service
    @service ||= GoogleService.new
  end

  def self.all
    service.messages.map { |msg| new(msg) }
  end

  def self.format
    all.map {|msg| msg.id}
  end

  def self.inbox
    format.map {|id| service.message(id)}.slice(0..5)
    # binding.pry
  end

  # def senders_email
  #   ["payload"]["headers"][15].fetch("value").match("(<[^>]+>)")[1].gsub("<","").gsub(">","")
  # end

  def from(message)
      message["payload"]["headers"][15].fetch("value").match("(<[^>]+>)")[1].gsub("<","").gsub(">","")
  end

  # def time_recieved
  #   ["payload"]["headers"][7].fetch("value").split(";")[1]
  # end

  def time
    inbox.map do |message|
       message["payload"]["headers"][7].fetch("value").split(";")[1]
     end
  end

  # def subject
  #   # ["payload"]["headers"][17]#.fetch("value").split(";")[1]
  #   ["payload"]["headers"].keep_if do |header|
  #     header["name"] == "Subject"
  #   end.first["value"]
  # end

  def about
    inbox.map do |message|
        message["payload"]["headers"].keep_if do |header|
          header["name"] == "Subject"
      end.first["value"]
    end
  end

  # def list
  #   payload["headers"]#.fetch("value").split(";")[1]
  # end

  def self.find(id)
    Message.new(service.message(id))
  end
end
# binding.pry
