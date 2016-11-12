# Контроллер для работы с объявлениями техники
class EquipsController < VehiclesController
  def index
    @equips = Equip.where(moderate: true).order('created_at DESC')
  end

  def new_vehicle(params)
    @equip = Equip.new params
  end

  private

  def vehicle_params
    params.require(:equip).permit(
      :vehicle_type, :description, :status, :price, :vin_code, :year, :h_of_use,
      :region_id, :city_id, :brand_id, :model_id
    )
  end
end
