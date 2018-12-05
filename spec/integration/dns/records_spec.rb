RSpec.describe "`cloudflare_cli dns-records` command", type: :cli do
  it "executes `cloudflare_cli help dns-records` command successfully" do
    output = `cloudflare_cli help dns-records`
    expected_output = <<-OUT
Usage:
  cloudflare_cli dns-records

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
