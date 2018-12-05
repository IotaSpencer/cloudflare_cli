require 'cloudflare_cli/commands/zones/list'

RSpec.describe CloudflareCli::Commands::Zones::List do
  it "executes `zones list` command successfully" do
    output = StringIO.new
    options = {}
    command = CloudflareCli::Commands::Zones::List.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
