Gem::Specification.new do |s|
  s.name                      = "user"
  s.version                   = "0.1.0"

  s.required_rubygems_version = ">= 1.3.6"
  s.authors                   = ["Chang Sau Sheong"]
  s.date                      = "2010-09-14"
  s.email                     = ["sausheong@gmail.com"]
  s.files                     = Dir['lib/**/*.rb']
  s.summary                   = "A DataMapper-based model of a user"

  s.add_runtime_dependency "dm-core"
end
