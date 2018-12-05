require 'cloudflare_cli/commands/accounts'

RSpec.describe CloudflareCli::Commands::Accounts do
  it "executes `accounts` command successfully" do
    output = StringIO.new
    options = {}
    command = CloudflareCli::Commands::Accounts.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
