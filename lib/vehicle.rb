class Vehicle
  @@vehicles_list = []

  define_method(:initialize) do |make, model, year|
    @make = make
    @model = model
    @year = year
    @id = @@vehicles_list.length().+(1)
  end

  define_method(:make) do
    @make
  end

  define_method(:model) do
    @model
  end

  define_method(:year) do
    @year
  end

  define_method(:save) do
    @@vehicles_list.push(self)
  end

  define_singleton_method(:all) do
    @@vehicles_list
  end

  define_singleton_method(:clear) do
    @@vehicles_list = []
  end

  define_method(:age) do
    current_year = Time.new().year()
    age = current_year.-(@year)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |ident|
    found_vehicle = nil
    @@vehicles_list.each() do |item|
      if item.id().eql?(ident.to_i())
        found_vehicle = item
      end
    end
  found_vehicle
  end

end
