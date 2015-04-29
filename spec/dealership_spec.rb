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

end
