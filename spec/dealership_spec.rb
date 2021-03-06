require('rspec')
require('pry')
require('dealership')
require('vehicle')

describe(Dealership) do
  before() do
    Dealership.clear()
  end

  describe('#name') do
    it("returns the name of a delearship") do
    test_dealership = Dealership.new("Bob's Cars")
    expect(test_dealership.name()).to(eq("Bob's Cars"))
    end
  end

  describe('#id') do
    it("returns the id of a delearship") do
      test_dealership = Dealership.new("Bob's Cars")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it("returns an empty array of cars for the dealership") do
      test_dealership = Dealership.new("Bob's Cars")
      expect(test_dealership.cars()).to(eq([]))
    end
  end

  describe('.all') do
    it("returns the class variable dealerships array") do
      expect(Dealership.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a dealership into the dealerships array") do
      test_dealership = Dealership.new("Bob's Cars")
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe('.clear') do
    it("empties the dealerships array") do
      test_dealership = Dealership.new("Bob's Cars").save()
      test_dealership.clear()
      expect(Dealership.clear()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a dealership by its id number") do
      test_dealership = Dealership.new("Bob's Cars")
      test_dealership.save()
      test_dealership2 = Dealership.new("Ned's Cars")
      test_dealership2.save()
      expect(Dealership.find(test_dealership.id())).to(eq(test_dealership))
    end
  end

  describe("#add_vehicle") do
    it("adds a new vehicle to a dealership") do
      test_dealership = Dealership.new("Bob's Cars")
      test_vehicle = Vehicle.new("Mini", "Cooper", 2000)
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end
end
