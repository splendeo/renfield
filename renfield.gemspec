Gem::Specification.new do |s|
  s.name = %q{renfield}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Enrique Garcia Cota", "Francisco de Juan"]
  s.date = %q{2010-07-22}
  s.description = %q{Adds several interesting methods and tasks to vlad the deployer}
  s.email = %q{github@splendeo.es}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    "README.textile",
    "renfield.gemspec",
    "lib/renfield.rb"
  ]
  s.homepage = %q{http://github.com/splendeo/renfield}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Adds several methods and tasks to vlad the deployer}
  
  s.add_dependency("vlad", ">= 2.0.0")

end

