module Gmailish
  class Flagger
    DELETED = :Deleted
    UNREAD = :Seen

    def initialize(account, uid)
      @account = account
      @uid = uid
    end

    def delete
      flag(DELETED)
    end

    def unread
      flag(UNREAD)
    end

    private

    attr_reader :account, :uid

    def flag(name)
      account.uid_store(uid, "+FLAGS", [name])
    end
  end
end
