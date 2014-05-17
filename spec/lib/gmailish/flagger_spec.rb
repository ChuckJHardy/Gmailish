require 'spec_helper'

module Gmailish
  describe Flagger do
    let(:instance) { Gmailish::Flagger.new(account, uid) }
    let(:uid) { 37 }
    let(:account) {
      instance_double(
        'Net::IMAP'
      )
    }

    describe '#initialize' do
      it 'take arguments' do
        instance
      end
    end

    describe '#delete' do
      subject { instance.delete }

      let(:label) { :Deleted }

      it 'calls uid_store with expected arguments' do
        account.should_receive(:uid_store).
          with(uid, "+FLAGS", [label])

        subject
      end
    end

    describe '#unread' do
      subject { instance.unread }

      let(:label) { :Seen }

      it 'calls uid_store with expected arguments' do
        account.should_receive(:uid_store).
          with(uid, "+FLAGS", [label])

        subject
      end
    end
  end
end
