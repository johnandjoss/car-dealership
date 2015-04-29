require("rspec")
require("vehicle")


describe(Vehicle) do
  before() do
    Vehicle.clear()
  end

  describe("#make") do
    it("returns the make of a vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      expect(test_vehicle.make()).to(eq("Toyota"))
    end
  end

  describe("#model") do
    it("returns the model of a vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      expect(test_vehicle.model()).to(eq("Prius"))
    end
  end

  describe("#year") do
    it("returns the model of a vehicle") do
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle.save()
      expect(test_vehicle.year()).to(eq(2000))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("clears the vehicles_list array") do
      Vehicle.new("Mini", "Cooper", 1990)
      Vehicle.clear()
      expect(Vehicle.all()).to(eq([]))
    end
  end

  describe("#age") do
    it("returns the current age of the vehicle") do
    test_vehicle = Vehicle.new("Mini", "Cooper", 2000)
    expect(test_vehicle.age()).to(eq(15))
    end
  end

  describe("#id") do
    it("returns the id of the vehicle") do
      test_vehicle = Vehicle.new("Mini", "Cooper", 2000)
      test_vehicle.save()
      test_vehicle2 = Vehicle.new("Toyota", "Prius", 2000)
      test_vehicle2.save()
      expect(test_vehicle.id()).to(eq(1))
    end
  end

end
