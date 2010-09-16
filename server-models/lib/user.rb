require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, 'mysql://root:root@localhost/modular')

class User
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String
  property :email, String
end
