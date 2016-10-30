class Car < Vehicle
    validates :engine_cap, length: { in: 1..3 }, numericality: true
    validates :body, :engine, :kpp, presence: true
    validates :drive, presence: true
end
