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

  def senders_email
    payload["headers"][15].fetch("value").match("(<[^>]+>)")[1].gsub("<","").gsub(">","")
  end

  def time_recieved
    payload["headers"][7].fetch("value").split(";")[1]
  end

  def subject
    # payload["headers"][17]#.fetch("value").split(";")[1]
    payload["headers"].keep_if do |header|
      header["name"] == "Subject"
    end.first["value"]

  end

  def list
    payload["headers"]#.fetch("value").split(";")[1]
  end

  def self.find(id)
    Message.new(service.message(id))
  end
end
