require 'spec_helper'

module Gmailish
  describe Account do
    let(:instance) { Gmailish::Account.new(username, password) }
    let(:username) { 'venkmanapp' }
    let(:password) { 'ABC123456' }

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

    describe '.process' do
      subject { described_class.process(username, password) }

      it 'calls off to process' do
        described_class.any_instance.should_receive(:process)

        subject
      end
    end

    describe '#process' do
      subject { instance.process }

      let(:actions) {
        instance_double(
          'Gmailish::Actions'
        )
      }

      let(:messages) { lambda{} }

      let(:address) { 'imap.gmail.com' }
      let(:port) { 993 }

      before { instance.stub(:messages => messages) }

      it 'calls off to actions and return self' do
        Net::IMAP.should_receive(:new).
          with(address, port, true, nil, false).
          and_return(account)

        Actions.should_receive(:new).
          with(account, username, password).
          and_return(actions)

        actions.should_receive(:process)

        expect(subject).to be_an_instance_of(Gmailish::Account)
      end
    end

    describe '#messages' do
      subject { instance.messages }

      let(:label) { 'UNSEEN' }
      let(:uid) { 37 }
      let(:uids) { [ uid ] }
      let(:message) {
        instance_double(
          'Gmailish::Message'
        )
      }

      before { instance.stub(:account => account) }

      it 'returns array of message objects' do
        account.should_receive(:uid_search).
          with([label]).
          and_return(uids)

        Message.should_receive(:process).
          with(account, uid).
          and_return(message)

        expect(subject).to eq([message])
      end
    end
  end
end
