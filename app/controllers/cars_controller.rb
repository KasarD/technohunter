class CarsController < VehiclesController

    def all_vehicles
        @cars = Car.where(moderate: true).order("created_at DESC")
    end

end
