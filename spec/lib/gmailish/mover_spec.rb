require 'spec_helper'

module Gmailish
  describe Mover do
    let(:instance) { Mover.new(account, uid) }
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

    describe '#archive' do
      subject { instance.archive }

      let(:labeler) {
        fire_double(
          'Gmailish::Labeler',
          :all_mail => true
        )
      }

      let(:flagger) {
        fire_double(
          'Gmailish::Flagger',
          :delete => true
        )
      }

      it 'calls off to Labeler and Flagger' do
        Labeler.should_receive(:new).
          with(account, uid).
          and_return(labeler)

        Flagger.should_receive(:new).
          with(account, uid).
          and_return(flagger)

        subject
      end
    end
  end
end
