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
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('minitest-reporters')
  s.add_development_dependency('pry', '~> 0.11.3')
  s.add_runtime_dependency('gli','2.18.0')
  s.add_runtime_dependency('httparty', '0.16.2')
  s.add_runtime_dependency('table_print')
  s.add_runtime_dependency('terminal-table')
  s.add_runtime_dependency('rubyflare')
  s.add_runtime_dependency('recursive-open-struct')
  s.add_runtime_dependency('chronic')
  s.add_runtime_dependency('ruby-units')
end
#=end