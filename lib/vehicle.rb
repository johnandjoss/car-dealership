class Vehicle
  @@vehicles_list = []

  define_method(:initialize) do |make, model, year|
    @make = make
    @model = model
    @year = year
    # @id = @@vehicles_list.length().+(1)
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


end
