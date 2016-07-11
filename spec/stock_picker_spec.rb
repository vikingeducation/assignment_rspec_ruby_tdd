require_relative '../lib/stock_picker'
require 'spec_helper'

describe 'StockPicker' do

  let(:s){StockPicker.new}

  describe '#stock_picker' do

    it 'raises an error if no arguments are entered' do
      expect(s.stock_picker).to raise_error(ArgumentError)
    end




  end

end