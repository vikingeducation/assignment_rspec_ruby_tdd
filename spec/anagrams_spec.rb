require "anagrams"

describe "#anagrams" do

	before do
		@anagrams_dic = []
		File.open('enable.txt', 'r') do |f1|  
  			while line = f1.gets  
    			@anagrams_dic << line.chomp.upcase
  			end  
		end  
	end

	it "returns anagrams of looter" do
		expect(anagrams("looter",@anagrams_dic)).to eq(["LOOTER", "LOOTER", "TOOLER", "TOOLER", "RETOOL", "RETOOL"])
	end

	it "returns anagrams of zygote" do
		expect(anagrams("zygote",@anagrams_dic)).to eq(["ZYGOTE"])
	end

	it "returns anagrams of cat" do
		expect(anagrams("cat",@anagrams_dic)).to eq(["CAT", "ACT"])
	end
end