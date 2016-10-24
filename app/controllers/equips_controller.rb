class EquipsController < VehiclesController

    def index
        @equips = Equip.where(moderate: true).order("created_at DESC")
    end
    def new_vehicle
        @equip = Equip.new
    end

private
    def vehicle_params
        params.require(:equip).permit(
            :vehicle_type, :description, :status, :price, :vin_code, :year, :h_of_use
        )
    end
end
