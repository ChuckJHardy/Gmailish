require 'spec_helper'
require_relative 'support/data'

module Gmailish
  describe Gmailish do
    let(:instance) { Gmailish::Account.new(username, password) }
    let(:username) { 'venkmanapp' }
    let(:password) { 'ABC123456' }

    let(:account) {
      fire_double(
        'Net::IMAP'
      )
    }

    let(:tagged_response) {
      fire_double(
        'Net::IMAP::TaggedResponse',
        :name => 'OK'
      )
    }

    let(:fetch_data) {
      fire_double(
        'Net::IMAP::FetchData',
        :attr => Gmailish::SupportData.fake_fetch_data_response
      )
    }

    context 'invalid' do
      subject { instance.process }

      it 'raises error' do
        expect { subject }.to raise_error(Net::IMAP::NoResponseError)
      end
    end

    context 'valid' do
      subject { instance.process }

      let(:address) { 'imap.gmail.com' }
      let(:port) { 993 }

      let(:mailbox) { 'inbox' }
      let(:read_label) { :Seen }
      let(:unread_label) { 'UNSEEN' }
      let(:delete_label) { :Deleted }
      let(:transfered_label) { 'Transfered' }
      let(:archive_label) { "[Gmail]/All Mail" }
      let(:uid) { 110 }
      let(:rfc) { 'RFC822' }

      let(:mail_subject) {
        "Fwd: Raising and Rescuing Custom Errors in Rails | We Are Stac"
      }

      let(:mail_to) {
        ["venkmanapp+40f7f061c2f7254b1b50f699d9eac16a@gmail.com"]
      }

      let(:mail_from) {
        ["chuckjhardy@gmail.com"]
      }

      it 'returns messages' do
        # Create connection
        Net::IMAP.should_receive(:new).
          with(address, port, true, nil, false).
          and_return(account)

        # Login to account
        account.should_receive(:login).
          with(username, password).
          and_return(tagged_response)

        # Select Inbox
        account.should_receive(:select).
          with(mailbox).
          and_return(tagged_response)

        # Find unread messages
        account.should_receive(:uid_search).
          with([unread_label]).
          and_return([uid])

        # Get unread messages
        account.should_receive(:uid_fetch).
          with(uid, rfc).
          and_return(fetch_data)

        # Add 'Transfered' label to messages
        account.should_receive(:uid_copy).
          with(uid, transfered_label).
          and_return(tagged_response)

        # Make messages as read
        account.should_receive(:uid_store).
          with(uid, "+FLAGS", [read_label]).
          and_return(tagged_response)

        # Archive messages
        account.should_receive(:uid_copy).
          with(uid, archive_label).
          and_return(tagged_response)

        # Delete messages from inbox
        account.should_receive(:uid_store).
          with(uid, "+FLAGS", [delete_label]).
          and_return(tagged_response)

        # Logout of account
        account.should_receive(:logout).
          and_return(tagged_response)

        # Always returns an array
        expect(subject.messages).to be_an_instance_of(Array)

        # Array contains Mail objects
        expect(subject.messages.first).to be_an_instance_of(Mail::Message)

        # Message has a subject
        expect(subject.messages.first.subject).to eq(mail_subject)

        # Message has a to field
        expect(subject.messages.first.to).to eq(mail_to)

        # Message has a from field
        expect(subject.messages.first.from).to eq(mail_from)

        # Message has a body field
        expect(subject.messages.first.body).to be_an_instance_of(Mail::Body)
      end
    end
  end
end
