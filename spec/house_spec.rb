require './lib/room'
require './lib/house'

RSpec.describe do
    before(:each) do
        @house = House.new("$400000", "123 sugar lane")
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


end