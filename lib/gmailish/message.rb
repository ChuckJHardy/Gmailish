module Gmailish
  class Message
    RFC = 'RFC822'

    def initialize(account, uid)
      @account = account
      @uid = uid
    end

    def self.process(account, uid)
      new(account, uid).process
    end

    def process
      message
      actions
      message
    end

    private

    attr_reader :account, :uid

    def actions
      Labeler.new(account, uid).transfered
      Flagger.new(account, uid).unread
      Mover.new(account, uid).archive
    end

    def raw
      @raw ||= Array(account.uid_fetch(uid, RFC)).first
    end

    def body
      raw.attr[RFC] unless raw.nil?
    end

    def message
      @message ||= Mail.new(body)
    end
  end
end
