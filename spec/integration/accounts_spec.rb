RSpec.describe "`cloudflare_cli accounts` command", type: :cli do
  it "executes `cloudflare_cli help accounts` command successfully" do
    output = `cloudflare_cli help accounts`
    expected_output = <<-OUT
Usage:
  cloudflare_cli accounts

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
