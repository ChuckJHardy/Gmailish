[![Build Status](https://travis-ci.org/ChuckJHardy/Gmailish.png)](https://travis-ci.org/ChuckJHardy/Gmailish) [![Coverage Status](https://coveralls.io/repos/ChuckJHardy/Gmailish/badge.png?branch=master)](https://coveralls.io/r/ChuckJHardy/Gmailish) [![Gem Version](https://badge.fury.io/rb/gmailish.png)](https://rubygems.org/gems/gmailish)

# Gmailish

Grabs unread emails from Gmail, marks them as read, applies a `Transfered` label and archives them.

## Installation

Add this line to your application's Gemfile:

    gem 'gmailish', '~> 0.0.1'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gmailish

## Usage

See Mail documentation [here](http://github.com/mikel/mail).

	account = Gmailish::Account.new(username, password)
	#=> #<Gmailish::Account:0x007f89dcaa7950>
	
	account.process
	#=> #<Gmailish::Account:0x007ff175d69ed0>
	
	messages = account.messages
	#=> [#<Mail::Message:70337520506800>, #<Mail::Message:70337520506801>]
	
	message = messages.first

	message.envelope.from   #=> 'chuckjhardy@gmail.com'
	message.from.addresses  #=> ['chuckjhardy@gmail.com', 'venkmanapp@gmail.com']
	message.sender.address  #=> 'chuckjhardy@gmail.com'
	message.to              #=> 'chuckjhardy@gmail.com'
	message.cc              #=> 'chuckjhardy@gmail.com'
	message.subject         #=> "This is the subject"
	message.date.to_s       #=> '15 Aug 2013 09:55:06 -1100'
	message.message_id      #=> '<4D6AA7GB.8170198@xxx.xxx>'
	message.body.decoded    #=> 'This is the body of the email..
	
## Example

	GmailService.retrieve
	#=> [#<Mail::Message:70337520506800>, #<Mail::Message:70337520506801>]

	class GmailService
	  def self.retrieve
	    new.messages
	  end

	  def messages
	    @messages ||= mailer.messages
	  end

	  private

	  def mailer
	    Gmailish::Account.new(username, password).tap do |account|
	      account.process
	    end
	  end

	  def username
	    ENV['GMAIL_EMAIL']
	  end

	  def password
	    ENV['GMAIL_PASSWORD']
	  end
	end

## Requirements

* ruby > 1.9.x
* net/imap
* [Mail](http://rubygems.org/gems/mail)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
