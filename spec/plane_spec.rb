require 'plane'

describe Plane do
  let(:plane) { described_class.new }
  it 'responds to land_plane method' do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  describe '#land_plane' do
    it 'change plane status from flying to landed' do
      airport = Airport.new
      plane.land_plane(airport)
      expect(plane.current_airport).to eq airport
    end
  end

end
