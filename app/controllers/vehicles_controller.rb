class VehiclesController < ApplicationController

    def all_vehicles
        # Заглушка для наследования контроллеров
    end
    def index
        # Получаем все объекты вызванной нами модели
        @vehicles = all_vehicles
        # instance_variable_set("@#{controller_name}", all_vehicles)
    end
    
end
