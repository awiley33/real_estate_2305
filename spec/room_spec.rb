require './lib/room'

RSpec.describe Room do
  describe "Iteration 1" do
    it "exists" do
      room = Room.new(:bedroom, 10, '13')
      expect(room).to be_a Room
    end

    it "it has a category" do
      room = Room.new(:bedroom, 10, '13')

      expect(room.category).to eq(:bedroom)
    end

    it "can get area" do
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:living_room, 15, '12')

      expect(room_1.area).to eq(130)
      expect(room_2.area).to eq(180)
    end

    it "can is unpainted by default" do
      room = Room.new(:bedroom, 10, '13')

      expect(room.is_painted?).to eq(false)
    end

    it "can be painted" do
      room = Room.new(:bedroom, 10, '13')
      room.paint

      expect(room.is_painted?).to eq(true)
    end
  end
end
