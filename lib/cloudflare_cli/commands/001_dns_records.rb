module CloudflareCli
  class App
    extend GLI::App

    desc "DNS Record Management"
    command "dns-record" do |c|
      c.desc "add a record"
      c.command :add do |dnsadd|
        dnsadd.action do |global_options, options, args|

          # Your command logic here

          # If you have any errors, just raise them
          # raise "that command made no sense"

          puts "dns-record add command ran"
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
