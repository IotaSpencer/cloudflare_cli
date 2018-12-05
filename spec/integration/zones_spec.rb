RSpec.describe "`cloudflare_cli zones` command", type: :cli do
  it "executes `cloudflare_cli help zones` command successfully" do
    output = `cloudflare_cli help zones`
    expected_output = <<-OUT
Usage:
  cloudflare_cli zones

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
