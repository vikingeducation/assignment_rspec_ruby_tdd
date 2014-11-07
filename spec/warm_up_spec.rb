require 'warm_up'

describe "#stock_picker" do
	let(:stocks){[25, 30, 24, 32, 35, 30, 40, 38, 33]}
	it "should take an array as input" do
		expect{stock_picker(stocks)}.not_to raise_error
	end

	it "should raise an error if the input is not an array of numbers" do
		expect{stock_picker(["shoe"])}.to raise_error
	end

	it "should return an array" do
		expect(stock_picker(stocks)).to be_kind_of(Array)
	end

	it "should return two values" do
		expect(stock_picker(stocks).length).to eq(2)
	end

	it "should pick the widest interval between two stocks" do
		expect(stock_picker(stocks)).to eq([2,6])
	end

	it "should handle when the first value is the highest" do
		expect(stock_picker([100, 30, 24, 32, 35, 30, 40, 38, 33])).to eq([2,6])
	end

	it "should handle when the last value is the lowest" do
		expect(stock_picker([25, 30, 24, 32, 35, 30, 40, 38, 0])).to eq([2,6])
	end

	it 'should properly handle double numbers' do
		expect(stock_picker([25, 30, 24, 24, 35, 30, 40, 38, 38])).to eq([2,6])
	end

	specify "the first value is lower than the second" do
		result = stock_picker([1,4,3,6,7,8,4,0])
		expect(result[0]).to  be < result[1]
	end
end

# Write a method 'anagrams' which returns an array of anagrams
# that can be made with the specified string. Assume the input
# is only a single word. Load TWL06.txt into your method as your dictionary.

describe '#anagram' do

	let(:word){"looter"}

	it "takes a single word as input" do
		expect{anagram(word)}.not_to raise_error
	end
	it "raises an error if input is not a single word" do
		expect{anagram("Let us go now you and I")}.to raise_error
	end
	it "should load the file 'TWL06.txt'" do
		# this is so badass. I don't care if it's wrong, it feels so right.
		allow(File).to receive(:open).and_return(File.open('TWL06.txt'))
		expect(File).to receive(:open)
    anagram(word)
	end

	it "should return an array" do
		expect(anagram(word)).to be_kind_of(Array)
	end

	context "when there are anagrams" do

		it "should return an array of strings" do

			result = anagram(word)
			# ghetto, but it works
			expect(result.all?{ |x| x.kind_of?(String) }).to eq(true)
		end

		it "should return ALL valid anagrams" do
			expect(anagram(word)).to eq(["RETOOL", "ROOTLE", "TOOLER"])
		end
	end

	context "when there are no anagrams" do
		it "should return an empty array" do
			expect(anagram("paradoxical")).to eq([])
		end
	end

end