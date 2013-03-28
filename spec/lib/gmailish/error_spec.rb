require 'spec_helper'

module Gmailish
  describe Error do
    let(:dummy_class) { Class.new { include Gmailish::Error }.new }

    describe Error::NoMessageError do
      it 'raises error' do
        expect { raise Error::NoMessageError }.to raise_error
      end
    end

    describe Error::NoLabelError do
      it 'raises error' do
        expect { raise Error::NoLabelError }.to raise_error
      end
    end
  end
end
