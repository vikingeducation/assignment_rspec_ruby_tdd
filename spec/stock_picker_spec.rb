require_relative '../lib/stock_picker'
require 'spec_helper'

describe 'StockPicker' do

  let(:s){StockPicker.new}

  describe '#stock_picker' do

    it 'raises an error if no arguments are entered' do
      expect{s.stock_picker}.to raise_error(ArgumentError)
    end

     it 'raises an error if argument is not array' do
      string = "this is string not array"

      expect{s.stock_picker(string)}.to raise_error(ArgumentError)

    end

    it 'raises an error if array is empty' do
      expect{s.stock_picker([])}.to raise_error(ArgumentError)
    end

   it '[0,1] returns [0,1]' do
    expect( s.stock_picker( [0,1] )).to eq( [0,1] )
   end

   it '[10, 20, 30, 40]' do
    expect( s.stock_picker( [10, 20, 30, 40] )).to eq( [0,3] )
   end


  end

end