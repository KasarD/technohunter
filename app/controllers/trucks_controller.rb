# Контроллер для работы с объявлениями грузового транспорта
class TrucksController < VehiclesController
  def index
    @trucks = Truck.where(moderate: true)
  end

  def new_vehicle(params)
    @truck = Truck.new(params)
  end

  private

  def vehicle_params
    params.require(:truck).permit(
      :vehicle_type, :vin_code, :year, :engine, :engine_cap,
      :h_of_use, :status, :description, :price, :mileage,
      :region_id, :city_id, :brand_id, :model_id
    )
  end
end
