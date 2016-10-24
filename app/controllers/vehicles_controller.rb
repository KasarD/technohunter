class VehiclesController < ApplicationController
    before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

    def all_vehicles
        # Заглушка для наследования контроллеров
    end
    def index
        # Получаем все объекты вызванной нами модели
        @vehicles = all_vehicles
    end

    def show
    end

    def new
        # Создаем новый экземпляр класса без параметров
        @vehicle = new_vehicle (nil)
    end

    def edit
    end

    def create
        # Создаем новый экземпляр класса с параметрами, взятыми из формы
        @vehicle = new_vehicle(vehicle_params)
        respond_to do |format|
            # Если сохранение успешно, то переходим в созданное объявление
            if @vehicle.save
                format.html { redirect_to @vehicle, notice: 'Successfully create this offer!'}
            else
            # Если же нет, то рендерим заново вьюху и передаем ошибки
                format.html { render :new }
            end
        end
    end

    def update
        respond_to do |format|
            # Аналогично методу create
            if @vehicle.update(vehicle_params)
                format.html { redirect_to @vehicle, notice: "Vehicle successfully updated." }
            else
                format.html { redirect_to :edit }
            end
        end
    end

    def destroy
        @vehicle.destroy
        # Переходим на главную страницу
        redirect_to :home
    end

private
    # Вызываем колбэком
    def set_vehicle
        # Т.к. id у всех разные, данный метод является универсальным
        @vehicle = Vehicle.find(params[:id])
    end
    
end
