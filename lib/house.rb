class House
    attr_reader :price, :address, :rooms

    def initialize(price, address)
        @price = price.delete("$").to_i
        @address = address
        @rooms = []
    end

    def add_room(room)
        @rooms << room
    end

    def above_market_average?
        if price > 500000
            true
        else
            false
        end
    end

    def rooms_from_category(category)
        @rooms.find_all {
            |room| room.category == category }
    end

    def area
        areas_array = []
        @rooms.each do |room|
            areas_array << room.area
        end
        areas_array.sum
    end

    def details
        {
            "price" => price,
            "address" => address
        }
    end


end