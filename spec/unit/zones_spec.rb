require 'cloudflare_cli/commands/zones'

RSpec.describe CloudflareCli::Commands::Zones do
  it "executes `zones` command successfully" do
    output = StringIO.new
    options = {}
    command = CloudflareCli::Commands::Zones.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
