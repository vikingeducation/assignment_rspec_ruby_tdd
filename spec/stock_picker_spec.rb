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

   it 'tests a simple array' do
    expect( s.stock_picker( [0,1] )).to eq( [0,1] )
   end

   it 'an array of constant increments' do
    expect( s.stock_picker( [10, 20, 30, 40] )).to eq( [0,3] )
   end

   it 'checks random values' do
    expect( s.stock_picker( [10, 20, 5, 10] )).to eq( [0,1] )
   end

   it 'checks a really big array of inputs' do
    expect( s.stock_picker( [44, 30, 24, 32, 35, 30, 40, 38, 15] )).to eq( [2,6] )
   end


  end

end