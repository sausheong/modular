require 'dm-core'
require 'dm-migrations'
require 'user'

DataMapper.setup(:default, 'mysql://root:root@localhost/modular')

class Order
  include DataMapper::Resource
  
  property :id, Serial
  property :created_on, DateTime
  property :order_no, String
  
  belongs_to :user  
end
