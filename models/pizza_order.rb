require_relative('../db/sql_runner.rb')
require_relative('./customer.rb')

class PizzaOrder

  attr_reader :id
  attr_accessor :topping, :quantity

  def initialize(options)
    @topping = options['topping']
    @quantity = options['quantity'].to_i
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
  end

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run(sql, values)
    customer_hash = results[0]
    customer = Customer.new(customer_hash)
    return customer
  end

end   
