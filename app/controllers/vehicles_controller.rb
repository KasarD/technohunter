# Общий контроллер объявлений, от которого наследуются остальные
# три: [Car, Truck, Equip]controller
class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :right_vehicle, only: [:show, :edit]

  def index
    # Выводим объявления независимо от их типа.
    @vehicles = Vehicle.where(moderate: true)
  end

  def show
    @photos = @vehicle.vehicle_images.all
  end

  def new
    # Создаем новый экземпляр класса без параметров
    @vehicle = new_vehicle nil
    # Получаем все марки текущего класса объявлений
    @brands = Brand.get_brands(controller_name.classify)
  end

  def edit
    # Получаем все марки текущего класса объявлений
    @brands = Brand.get_brands(controller_name.classify)
  end

  def create
    # Создаем новый экземпляр класса с параметрами, взятыми из формы
    @vehicle = new_vehicle(vehicle_params)
    respond_to do |format|
      if @vehicle.save
        # Если сохранение успешно, тогда сохраняем и приложенные фото при их наличии
        save_photos(params[:photos])
        # Переходим в созданное объявление
        format.html { redirect_to @vehicle, notice: 'Successfully created this offer!' }
      else
        # Если же нет, то рендерим заново вьюху и передаем ошибки
        @brands = Brand.get_brands(controller_name.classify)
        format.html { render controller: controller_name, action: :new, local: @brands }
      end
    end
  end

  def update
    respond_to do |format|
      # Аналогично методу create
      if @vehicle.update(vehicle_params)
        save_photos(params[:photos])
        format.html { redirect_to @vehicle, notice: 'Vehicle successfully updated.' }
      else
        @brands = Brand.get_brands(controller_name.classify)
        format.html { render controller: controller_name, action: :edit, local: @brands }
      end
    end
  end

  def destroy
    @vehicle.destroy
    # Переходим на главную страницу соответствующего типа объявлений
    redirect_to controller: controller_name, action: :index
  end

  #------- AJAX - запросы -------#
  def update_models
    @models = Model.where(brand_id: params[:brand_id])
    # Определяем тип обратившейся модели
    @type = params[:type].chomp('s')
  end

  def update_cities
    @cities = City.where(region_id: params[:region_id])
    @type = params[:type].chomp('s')
  end
  #----------- Конец ------------#

  protected

  def save_photos(photos)
    return unless photos
    # Удаляем старые фото
    @vehicle.erase_photos
    photos.each { |photo| @vehicle.vehicle_images.create(photo: photo) }
  end

  private

  # Вызываем колбэком
  def set_vehicle
    # Т.к. id у всех разные, данный метод является универсальным
    @vehicle = Vehicle.find(params[:id])
  end

  # Проверяем, верно ли составлен GET запрос из сети.
  # Т.к. у нас используется STI, возможно поялвение логической ошибки, когда одна модель использует
  # контроллер другой. В таком случае необходимо удостовериться, что названия модели и контроллера
  # соответствуют друг-другу.
  def right_vehicle
    not_found if @vehicle.type != controller_name.classify
  end
end
