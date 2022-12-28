class Error 
  attr_reader :message

    def initialize(data)
      @message = data[:error]
    end
end