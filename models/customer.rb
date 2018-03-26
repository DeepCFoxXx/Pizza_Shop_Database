require_relative('../db/sql_runner.rb')
require_relative('./pizza_order.rb')

class Customer

  attr_reader(:id)
  attr_accessor(:name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def pizza_orders()
    sql = "SELECT * FROM pizza_orders
    WHERE customer_id = $1"
    values = [@id]
    order_hashes = SqlRunner.run(sql, values)
    order_objects = order_hashes.map { |order_hash| PizzaOrder.new(order_hash) }
    return order_objects
  end

end   
