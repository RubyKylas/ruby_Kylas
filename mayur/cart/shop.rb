class Shop
  def initialize(products, codes)
    @cart = {}
    @products = products
    @codes = codes
  end

  def display_cart()
    puts @cart
  end

  def add_to_cart(name = nil,need = nil)
    return nil if (name.nil? || need.nil?)
    index = @products.find_index { |p| p[:name] == name }
    if !index.nil?
      product = @products[index]
      return nil if need <= 0
      if need > product[:quantity]
        need = product[:quantity]
        @products.delete_at(index)
      else
        @products.map do |x|
          x[:quantity] - need if x[:name] == name
        end
      end
      item = @cart.find{ |item_name, item_data|
        name == item_name
      }
      if(item)
        @cart[name][1] += need
      else
        @cart[name] = [product[:price], need]
      end
      puts @cart
    else
      puts @cart
    end
  end

  def checkout(code = nil)
    total = 0
    puts @cart
    @cart.each do |name, data|
      puts "#{name} : #{data[0]} : #{data[1]}"
      total += data[0] * data[1]
      puts total
    end
    if code
      @codes.each do |x|
        total -= total * x[:discount] / 100 if code == x[:code]
      end
    end
    total
  end
end
