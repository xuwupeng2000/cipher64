# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cipher64/version'

Gem::Specification.new do |spec|
  spec.name          = "cipher64"
  spec.version       = Cipher64::VERSION
  spec.authors       = ["Jack Wu"]
  spec.email         = ["xuwupeng2000@gmail.com"]
  spec.summary       = %q{Blowfish encryption and decryption of strings}
  spec.description   = %q{Blowfish encryption and decryption of strings}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
