RSpec.describe "`cloudflare_cli config` command", type: :cli do
  it "executes `cloudflare_cli help config` command successfully" do
    output = `cloudflare_cli help config`
    expected_output = <<-OUT
Commands:
  cloudflare_cli config help [COMMAND]  # Describe subcommands or one specific subcommand
  cloudflare_cli config set NAME VALUE  # Set configuration options

    OUT

    expect(output).to eq(expected_output)
  end
end
