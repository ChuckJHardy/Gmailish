module Gmailish
  class Account
    ADDRESS = 'imap.gmail.com'
    PORT = 993
    UNREAD = 'UNSEEN'

    def initialize(username, password)
      @username = username
      @password = password
    end

    def self.process(username, password)
      new(username, password).process
    end

    def process
      actions.process { messages }
      self
    end

    def messages
      @messages ||= account.uid_search([UNREAD]).map do |uid|
        Message.process(account, uid)
      end
    end

    private

    attr_reader :username, :password

    def account
      @account ||= Net::IMAP.new(ADDRESS, PORT, true, nil, false)
    end

    def actions
      @actions ||= Actions.new(account, username, password)
    end
  end
end


