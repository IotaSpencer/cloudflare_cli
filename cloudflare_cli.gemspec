# Ensure we require the local version and not one we might have installed already
require 'pathname'
require Pathname.new(__FILE__).dirname.realdirpath.join('lib', 'cloudflare_cli', 'version.rb').to_s
#=begin
spec = Gem::Specification.new do |s|
  s.name = 'cloudflare_cli'
  s.version = CloudflareCli::VERSION
  s.author = 'Ken Spencer'
  s.email = 'me+cloudflare_cli@iotaspencer.me'
  s.license = 'MIT'
  s.licenses = ['MIT']
  s.homepage = 'https://iotaspencer.me/projects/cloudflare_cli'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A CLI encapsulating /hopefully/ all of cloudflare\'s numerous endpoints (as soon as its fully finished)'
  s.files = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md", "*.rdoc"]
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.executables << 'cloudflare_cli'
  s.add_development_dependency('rake', '~> 12.3.2')
  s.add_development_dependency('rdoc', '~> 6.1.0')
  s.add_development_dependency('minitest-reporters', '1.3.5')
  s.add_development_dependency('pry', '~> 0.11.3')
  s.add_development_dependency 'orb'

  s.add_runtime_dependency('app_configuration')
  s.add_runtime_dependency('awesome_print')
  s.add_runtime_dependency('chronic', '~> 0.10.2')
  s.add_runtime_dependency('cloud_party')
  s.add_runtime_dependency('gli','2.18.0')
  s.add_runtime_dependency('httparty', '0.16.2')
  s.add_runtime_dependency('paint')
  s.add_runtime_dependency('recursive-open-struct', '~> 1.1.0')
  s.add_runtime_dependency('rubyflare', '~> 0.2.0')
  s.add_runtime_dependency('table_print', '~> 1.5.6')
  s.add_runtime_dependency('terminal-table', '~> 1.8.0')
  s.add_runtime_dependency('vine')
end
#=end