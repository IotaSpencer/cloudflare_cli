RSpec.describe "`cloudflare_cli ips` command", type: :cli do
  it "executes `cloudflare_cli help ips` command successfully" do
    output = `cloudflare_cli help ips`
    expected_output = <<-OUT
Usage:
  cloudflare_cli ips

Options:
  -h, [--help], [--no-help]  # Display usage information

Return Cloudflare IPs
    OUT

    expect(output).to eq(expected_output)
  end
end
