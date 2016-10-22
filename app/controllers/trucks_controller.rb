class TrucksController < VehiclesController

    def all_vehicles
        @trucks = Truck.where(moderate: true).order("created_at DESC")
    end

end
