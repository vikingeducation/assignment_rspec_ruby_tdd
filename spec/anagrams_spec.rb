require 'anagrams'

describe '#anagrams' do
  describe 'input' do
    it 'takes a string as an argument' do
      expect do
        anagrams("hello")
      end.not_to raise_error
    end
    it 'does not take an integer as an argument' do
      expect do
        anagrams(5)
      end.to raise_error
    end
  end

  dictionary = ["OPTS", "POST", "POTS", "SPOT", "TOPS", "PEST", "SEPT", "STEP", "OPT", "POT", "SOP", "OPS", "TOP", "PET", "STEEP", "STEPS", "PESTS", "SEPTS"]

  describe 'output' do
    it 'returns an array' do
      expect(anagrams("stop")).to be_a_kind_of Array
    end

    # it 'returns only words of the same length' do
    #   expect(anagrams("stop").all? { |word| word.length == 4 }).to be_true
    #   expect(anagrams("pot").all? { |word| word.length == 3 }).to be_true
    # end

    it 'does not return words with the same letters in different quantities'
    # expect(anagrams(steps).include? "STEEP").to be_false

    it 'does not return the argument in the response'
  end
end

describe '#are_these_anagrams?' do
  
end