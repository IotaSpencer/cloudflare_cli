require 'cloudflare_cli/commands/dns/records'

RSpec.describe CloudflareCli::Commands::DnsRecords do
  it "executes `dns-records` command successfully" do
    output = StringIO.new
    options = {}
    command = CloudflareCli::Commands::DnsRecords.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
