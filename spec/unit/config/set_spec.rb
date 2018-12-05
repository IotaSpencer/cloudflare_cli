require 'cloudflare_cli/commands/config/set'

RSpec.describe CloudflareCli::Commands::Config::Set do
  it "executes `config set` command successfully" do
    output = StringIO.new
    name = nil
    value = nil
    options = {}
    command = CloudflareCli::Commands::Config::Set.new(name, value, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
