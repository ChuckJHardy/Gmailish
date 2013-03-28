module Gmailish
  class Actions
    attr_accessor :logged_in

    INBOX = 'inbox'

    def initialize(account, username, password)
      @account = account
      @username = username
      @password = password
      @logged_in = false
    end

    def process(&block)
      if block_given?
        login
        inbox
        yield
        logout
      else
        raise Error::NoMessageError, "Messages must be passed within a block."
      end
    end

    def logged_in?
      logged_in
    end

    private

    attr_reader :account, :username, :password

    def login
      account.login(username, password).tap do |response|
        @logged_in = true if ok?(response)
      end
    end

    def logout
      account.logout.tap do |response|
        @logged_in = false if ok?(response)
      end
    end

    def inbox
      account.select(INBOX)
    end

    def ok?(response)
      response && response.name == 'OK'
    end
  end
end
