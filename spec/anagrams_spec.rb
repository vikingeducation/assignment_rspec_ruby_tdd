require 'anagrams'

describe "#anagrams" do 

  it "raises an error if no arguments are provided" do 
    expect { anagrams }.to raise_error(ArgumentError)
  end

  it "raises an error if more than one arguments is provided" do 
    expect { anagrams("word", 1) }.to raise_error(ArgumentError)
  end

  it "raises an error if argument is not a string" do 
    expect do
      anagrams(1) 
    end.to raise_error(RuntimeError)
  end

  it "successfully finds anagrams" do 
    str = "looter"
    arr =  %w(spooky retool rootle tooler toddler)
    result = ["RETOOL", "ROOTLE", "TOOLER"]
    expect(IO).to receive(:readlines).and_return(arr)
    expect(anagrams(str)).to eq(result)
  end

end