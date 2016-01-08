
require_relative "../lib/warmup"

describe "warmup tests"  do 
    
    let( :warmup ) { Warmup.new }

    let(:fake_array) do 
      double( size: 3 )
    end

    describe "#get_shout" do

        it "takes a string and returns uppercase" do
            allow(warmup).to receive(:gets).and_return("shout")
            expect { warmup.gets_shout }.to output("SHOUT\n").to_stdout
            # expect(warmup.gets_shout).to eq("SHOUT")
        end

    end


    describe "#triple_size" do

      it "takes in a double that accepts size method" do
        expect(warmup.triple_size(fake_array)).to eq(9)
      end

    end
end

