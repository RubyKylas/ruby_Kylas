load "service.rb"
products = []
cart = []


while 1
  display_menu()
  print "Your option: "
  user_input = gets.chomp.to_i
  puts "Mocked."
  case user_input
    when 0
      break
    when 1
      display_products(products)
    when 2
      print "Enter the name: "
      name = gets.chomp.downcase
      print "Enter the price: "
      price = gets.chomp.to_i
      add_product(products, name, price)
    when 3
      print "Enter the name: "
      name = gets.chomp.downcase
      print "Enter the quantity: "
      quantity = gets.chomp.to_i
      add_to_cart(products, cart, name, quantity)
    when 4 
      display_cart(cart)
    when 5
      print "Enter referal code: "
      code = gets.chomp
      generate_bill(cart, code)
    when 6
      print "Enter the name of product you want to delete: "
      name = gets.chomp.downcase
      delete_from_cart(cart, name)
    else
      puts "Plese enter valid input."
  end
end