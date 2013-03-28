module Gmailish
  class Mover
    def initialize(account, uid)
      @account = account
      @uid = uid
    end

    def archive
      all_mail
      delete
    end

    private

    attr_reader :account, :uid

    def all_mail
      Labeler.new(account, uid).all_mail
    end

    def delete
      Flagger.new(account, uid).delete
    end
  end
end
