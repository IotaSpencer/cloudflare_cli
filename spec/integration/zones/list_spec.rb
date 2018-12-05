RSpec.describe "`cloudflare_cli zones list` command", type: :cli do
  it "executes `cloudflare_cli zones help list` command successfully" do
    output = `cloudflare_cli zones help list`
    expected_output = <<-OUT
Usage:
  cloudflare_cli list

Options:
  -h, [--help], [--no-help]  # Display usage information

Command description...
    OUT

    expect(output).to eq(expected_output)
  end
end
