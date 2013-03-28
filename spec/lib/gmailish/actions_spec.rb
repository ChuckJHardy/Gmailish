require 'spec_helper'

module Gmailish
  describe Actions do
    let(:instance) { Gmailish::Actions.new(account, username, password) }
    let(:username) { 'venkmanapp' }
    let(:password) { 'ABC123456' }
    let(:account) {
      fire_double(
        'Net::IMAP'
      )
    }

    let(:message) {
      fire_double(
        'Gmailish::Message'
      )
    }

    let(:response) {
      fire_double(
        'Net::IMAP::TaggedResponse',
        :name => 'OK'
      )
    }

    describe '#initialize' do
      it 'take arguments' do
        instance
      end
    end

    describe '#process' do
      context 'called with message' do
        subject { instance.process { message } }

        it 'calls actions in order' do
          instance.should_receive(:login)
          instance.should_receive(:inbox)
          instance.should_receive(:logout)

          subject
        end

        context 'login' do
          before do
            instance.stub(:inbox)
            instance.stub(:logout)
          end

          it 'sets logged_in to true' do
            account.should_receive(:login).
              with(username, password).
              and_return(response)

            subject

            expect(instance.logged_in).to be_true
          end
        end

        context 'inbox' do
          before do
            instance.stub(:login)
            instance.stub(:logout)
          end

          let(:inbox) { 'inbox' }

          it 'selects inbox' do
            account.should_receive(:select).
              with(inbox)

            subject
          end
        end

        context 'logout' do
          let(:response) { nil }

          before do
            instance.stub(:login)
            instance.stub(:inbox)
          end

          it 'sets logged_in to false' do
            account.should_receive(:logout).
              and_return(response)

            subject

            expect(instance.logged_in).to be_false
          end
        end
      end

      context 'called without message' do
        subject { instance.process }

        let(:msg) { "Messages must be passed within a block." }

        it 'raises error' do
          expect { subject }.to raise_error(Error::NoMessageError, msg)
        end
      end
    end

    describe '#logged_in?' do
      subject { instance.logged_in? }

      it 'returns false' do
        expect(subject).to be_false
      end
    end
  end
end
