require_relative '../lib/anagram'

describe "anagram" do
    let(:anag){Anagram.new("Looter")}
    let(:notfind){Anagram.new("notfind")}
    let(:dict){["RETOOL", "ROOtlE", "TooLER", "NoT", "RELATED","TO", "123", "000", "Looter"]}
    
        it "sort every words and make them lowcases" do
            anag.formalizself
            expect(anag.words).to eq("eloort")
        end
        
        it "collect every same words in the library after formalize" do
            anag.formalizself
            anag.collect(dict)
            expect(anag.dictSelect).to eq(["RETOOL", "ROOtlE", "TooLER", "Looter"])
        end
        
        it "collect nothing when no words match" do
            notfind.formalizself
            notfind.collect(dict)
            expect(notfind.dictSelect).to eq([])
        end
        
end