# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{formatter-san}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Manfred Stienstra"]
  s.date = %q{2009-03-05}
  s.description = %q{Simple plugin to generate a formatter decorator for ActiveRecord attributes.}
  s.email = %q{manfred@fngtps.com}
  s.files = ["lib/formatter_san.rb", "lib/formatter_san/rubypants.rb", "lib/formatter_san/formatters/simple.rb", "lib/formatter_san/formatters/textile.rb", "rails/init.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/Manfred/formatter-san}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{When included in a class, Formatter-san allows you to easily define a formatter decorator around an attribute.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
