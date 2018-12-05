RSpec.describe "`cloudflare_cli config set` command", type: :cli do
  it "executes `cloudflare_cli config help set` command successfully" do
    output = `cloudflare_cli config help set`
    expected_output = <<-OUT
Usage:
  cloudflare_cli config set NAME VALUE

Options:
  -h, [--help], [--no-help]  # Display usage information

Set configuration options
    OUT

    expect(output).to eq(expected_output)
  end
end
