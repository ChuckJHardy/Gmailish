require 'spec_helper'

module Gmailish
  describe Message do
    let(:instance) { Gmailish::Message.new(account, uid) }
    let(:uid) { 37 }
    let(:account) {
      fire_double(
        'Net::IMAP'
      )
    }

    describe '#initialize' do
      it 'takes arguments' do
        instance
      end
    end

    describe '.process' do
      subject { described_class.process(account, uid) }

      it 'calls off to process' do
        described_class.any_instance.should_receive(:message).twice
        described_class.any_instance.should_receive(:actions)

        subject
      end
    end

    describe '#process' do
      subject { instance.process }

      let(:rfc) { 'RFC822' }

      let(:labeler) {
        fire_double(
          'Gmailish::Labeler',
          :transfered => true
        )
      }

      let(:flagger) {
        fire_double(
          'Gmailish::Flagger',
          :unread => true
        )
      }

      let(:mover) {
        fire_double(
          'Gmailish::Mover',
          :archive => true
        )
      }

      context 'actions' do
        before { instance.stub(:message) }

        it 'runs' do
          Labeler.should_receive(:new).
            with(account, uid).
            and_return(labeler)

          Flagger.should_receive(:new).
            with(account, uid).
            and_return(flagger)

          Mover.should_receive(:new).
            with(account, uid).
            and_return(mover)

          subject
        end
      end

      context 'message' do
        before { instance.stub(:actions) }

        let(:messages) { [ message ] }
        let(:message) {
          fire_double(
            'Net::IMAP::FetchData',
            :attr => attr
          )
        }

        let(:mail) {
          fire_double(
            'Mail'
          )
        }

        let(:attr) {
          {
            "UID" => 105,
            "RFC822" => body
          }
        }

        let(:body) {
          "Delivered-To: venkmanapp+9eac16a@gmail.com"
        }

        context 'none' do
          it 'return Mail object' do
            account.should_receive(:uid_fetch).
              with(uid, rfc).
              and_return(nil)

            message.should_not_receive(:attr)

            subject
          end
        end

        context 'single' do
          it 'return Mail object' do
            account.should_receive(:uid_fetch).
              with(uid, rfc).
              and_return(message)

            Mail.should_receive(:new).
              with(body).
              and_return(mail)

            expect(subject).to_not be_nil
          end
        end

        context 'multiple' do
          it 'return Mail object' do
            account.should_receive(:uid_fetch).
              with(uid, rfc).
              and_return(messages)

            Mail.should_receive(:new).
              with(body).
              and_return(mail)

            expect(subject).to_not be_nil
          end
        end
      end
    end
  end
end
