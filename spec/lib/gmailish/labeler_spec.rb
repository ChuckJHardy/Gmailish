require 'spec_helper'

module Gmailish
  describe Labeler do
    let(:instance) { Gmailish::Labeler.new(account, uid) }
    let(:uid) { 37 }
    let(:account) {
      fire_double(
        'Net::IMAP'
      )
    }

    let(:uid_copy) { stub }

    describe '#initialize' do
      it 'takes arguments' do
        instance
      end
    end

    describe '#transfered' do
      subject { instance.transfered }

      let(:label) { 'Transfered' }

      context 'label exists' do
        it 'returns response' do
          account.should_receive(:uid_copy).
            with(uid, label)

          subject
        end
      end

      context 'label does not exist' do
        let(:msg) { "Manually create `#{label}' label." }

        it 'raise error' do
          account.should_receive(:uid_copy).
            with(uid, label).
            and_raise

          expect { subject }.to raise_error(Error::NoLabelError, msg)
        end
      end
    end

    describe '#all_mail' do
      subject { instance.all_mail }

      let(:label) { '[Gmail]/All Mail' }

      context 'label exists' do
        it 'returns response' do
          account.should_receive(:uid_copy).
            with(uid, label)

          subject
        end
      end

      context 'label does not exist' do
        let(:msg) { "Manually create `#{label}' label." }

        it 'raise error' do
          account.should_receive(:uid_copy).
            with(uid, label).
            and_raise

          expect { subject }.to raise_error(Error::NoLabelError, msg)
        end
      end
    end
  end
end
