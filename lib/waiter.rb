class Waiter

    attr_accessor :name, :years

    @@all = []

    def initialize(name, years)
        @name = name
        @years = years
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip = 0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|w| w.waiter == self}
    end

    def best_tipper
        best_customer_tipper = meals.max {|meal1, meal2| meal1.tip <=> meal2.tip}
        best_customer_tipper.customer
    end
end