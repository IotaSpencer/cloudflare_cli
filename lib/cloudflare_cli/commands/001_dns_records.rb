require 'gli'
module CloudflareCli
  # Cloudflare CLI App class
  class App
    extend GLI::App

    desc 'DNS Record Management'
    command 'dns-record' do |c|
      c.desc 'add a record'

      c.command :add do |dnsadd|
        dnsadd.flag :type, default_value: 'A', must_match: %w[A AAAA CNAME SOA PTR NS MX LOC SRV SPF TXT CAA CERT DNSKEY DS NAPTR SSHFP TLSA URI SMIMEA], desc: 'Record Type'
        dnsadd.flag :zone, desc: 'DNS Zone ID or Zone Name'
        dnsadd.action do |global_options, options, args|
          puts "dns-record add command ran with #{options}"
        end
      end

      c.desc 'remove a record'
      c.command [:rem, :del, :delete] do |dnsrem|
        dnsrem.action do |global_options, options, args|
          puts 'dns-record rem ran'
        end
      end

      c.desc 'update a record'
      c.command [:update, :modify] do |dnsmod|
        dnsmod.action do |global_options, options, args|
          puts 'dns-record update ran'
        end
      end

      c.desc 'get a record'
      c.command [:show] do |dnsshow|
        dnsshow.action do |global_options, options, args|
          puts 'dns-record show ran'
        end
      end
    end
  end
end
