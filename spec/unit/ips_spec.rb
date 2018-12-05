require 'cloudflare_cli/commands/ips'

RSpec.describe CloudflareCli::Commands::Ips do
  it "executes `ips` command successfully" do
    output = StringIO.new
    options = {}
    command = CloudflareCli::Commands::Ips.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
