class EquipsController < VehiclesController

    def all_vehicles
        @equips = Equip.where(moderate: true).order("created_at DESC")
    end

end
