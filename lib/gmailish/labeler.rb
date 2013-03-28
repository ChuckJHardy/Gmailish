module Gmailish
  class Labeler
    TRANSFERED = 'Transfered'
    ARCHIVE = '[Gmail]/All Mail'

    def initialize(account, uid)
      @account = account
      @uid = uid
    end

    def transfered
      label(TRANSFERED)
    end

    def all_mail
      label(ARCHIVE)
    end

    private

    attr_reader :account, :uid

    def label(name)
      account.uid_copy(uid, name)
    rescue
      raise Error::NoLabelError, "Manually create `#{name}' label."
    end
  end
end
