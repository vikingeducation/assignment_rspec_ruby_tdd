RSpec.describe DiceThrower::Computer do
  describe '#initialize' do
    let(:computer) { DiceThrower::Computer.new }
    it 'inherits from player' do
      expect(computer).to be_a DiceThrower::Player
    end

    it 'has a random name' do
      allow_any_instance_of(DiceThrower::Computer).to receive(:set_random_name).and_return('QW3450')
      expect(computer.name).to eq 'QW3450'
    end
  end
end
