# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "data_migrate_end/version"

Gem::Specification.new do |s|
  s.name        = "data_migrate_end"
  s.version     = DataMigrateEnd::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Andrew J Vargo", "Oleg Pudeyev"]
  s.email       = ["oleg@bsdpower.com"]
  s.homepage    = "http://bsdpower.com"
  s.summary     = %q{Rake tasks to migrate data after schema changes.}
  s.description = %q{Rake tasks to migrate data after schema changes.}

  s.rubyforge_project = "data_migrate_end"

  s.add_dependency('rails', '>= 3.1.0')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
