class Truck < Vehicle
    validates :engine_cap, length: { in: 1..3 }, numericality: true
    validates :engine, presence: true
end
