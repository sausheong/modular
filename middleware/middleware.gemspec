Gem::Specification.new do |s|
  s.name                      = "middleware"
  s.version                   = "0.1.0"

  s.required_rubygems_version = ">= 1.3.6"
  s.authors                   = ["Chang Sau Sheong"]
  s.date                      = "2010-09-14"
  s.email                     = ["sausheong@gmail.com"]
  s.files                     = Dir['lib/**/*.rb'] + Dir['views/**/*.haml']
  s.summary                   = "A Sinatra based Rack middleware"

  s.add_runtime_dependency "sinatra"
  s.add_runtime_dependency "haml"

end
