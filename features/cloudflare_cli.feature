Feature: My bootstrapped app kinda works
  In order to get going on coding my awesome app
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  Scenario: App just runs
    When I get help for "cloudflare_cli"
    Then the exit status should be 0
  Scenario: All Help runs
    When I get help for "cloudflare_cli zones"
    Then the exit status should be 0
    When I get help for "cloudflare_cli dns-record"
    Then the exit status should be 0
