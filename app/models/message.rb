class Message < OpenStruct

  def self.service
    @service ||= GoogleService.new
  end

  def self.all
    service.messages.map { |msg| new(msg) }
  end

  def self.find(id)
    Message.new(service.message(id))
  end
end
