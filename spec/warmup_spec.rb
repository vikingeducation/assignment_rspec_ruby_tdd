
require_relative "../lib/warmup"

describe "warmup tests"  do 
    
    let( :warmup ) { Warmup.new }
    describe "#get_shout" do

        it "takes a string and returns uppercase" do
            allow(warmup).to receive(:gets).and_return("shout")
            expect { warmup.gets_shout }.to output("SHOUT\n").to_stdout
            # expect(warmup.gets_shout).to eq("SHOUT")
        end



    end

end

