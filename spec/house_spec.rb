require './lib/room'
require './lib/house'

RSpec.describe do
    before(:each) do
        @house = House.new("$400000", "123 sugar lane")
        @room_1 = Room.new(:bedroom, 10, '13')
        @room_2 = Room.new(:bedroom, 11, '15')
        @room_3 = Room.new(:living_room, 25, '15')
        @room_4 = Room.new(:basement, 30, '41')
    end

    it "exists" do
        expect(@house).to be_an_instance_of(House)
    end

    it "can return the price attribute to an integer when called" do
        expect(@house.price).to eq(400000)
    end

    it "has an address" do
        expect(@house.address).to eq("123 sugar lane")
    end

    it "has an empty rooms array by default" do
        expect(@house.rooms).to eq([])
    end

    it "can add rooms to the house" do
        @house.add_room(@room_1)
        @house.add_room(@room_2)

        expect(@house.rooms).to eq([@room_1, @room_2])
    end

    it "can compare price to market average" do
        expect(@house.above_market_average?).to eq(false)
    end

    it "can return rooms from a specific category" do
        @house.add_room(@room_1)
        @house.add_room(@room_2)
        @house.add_room(@room_3)
        @house.add_room(@room_4)

        expect(@house.rooms_from_category(:bedroom)).to eq([@room_1, @room_2])
        expect(@house.rooms_from_category(:basement)).to eq([@room_4])
    end

    it "can find the area" do
        @house.add_room(@room_1)
        @house.add_room(@room_2)
        @house.add_room(@room_3)
        @house.add_room(@room_4)

        expect(@house.area).to eq(1900)
    end

    it "can return details to a hash" do

        expect(@house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end

end