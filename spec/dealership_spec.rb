require('rspec')
require('pry')
require('dealership')

describe(Dealership) do

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
      test_dealership = Dealership.new("Bob's Cars")
      expect(test_dealership.all()).to(eq([]))
    end
  end
end
