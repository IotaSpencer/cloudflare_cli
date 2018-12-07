2018-11-28  Ken Spencer <me@iotaspencer.me>

	* ChangeLog: upload ChangeLog

2018-11-28  Ken Spencer <me@iotaspencer.me>

	* lib/cloudflare_cli/version.rb: Bump cloudflare_cli to 0.0.2

2018-11-28  Ken Spencer <me@iotaspencer.me>

	* lib/cloudflare_cli/tree/zones.rb: implement /zones

2018-11-28  Ken Spencer <me@iotaspencer.me>

	* lib/cloudflare_cli/tree/ips.rb: implement /ips

2018-11-28  Ken Spencer <me@iotaspencer.me>

	* lib/cloudflare_cli/tree.rb: use tree as a middle module to
	incorporate endpoints as we make them

2018-11-28  Ken Spencer <me@iotaspencer.me>

	* lib/cloudflare_cli/app.rb: change up app and add a long desc and
	get couple of the commands working

2018-11-28  Ken Spencer <me@iotaspencer.me>

	* lib/cloudflare_cli.rb: allow state initialization without a class
	having to be made and saved

2018-11-28  Ken Spencer <me@iotaspencer.me>

	* Gemfile: use rubyflare and use my cloned version

2018-11-26  Ken Spencer <me@iotaspencer.me>

	* lib/cloudflare_cli/tree/ips.rb: add rubyflare and remove httparty,
	though we're going to bring it back

2018-11-26  Ken Spencer <me@iotaspencer.me>

	* lib/cloudflare_cli/app.rb: fix up the app file and put it in the
	gem namespace

2018-11-26  Ken Spencer <me@iotaspencer.me>

	* lib/cloudflare_cli/api_tree.rb, lib/cloudflare_cli/tree.rb: rename
	api_tree.rb -> tree.rb

2018-11-26  Ken Spencer <me@iotaspencer.me>

	* bin/cloudflare_cli: add the .run(ARGV) call back into the file

2018-11-26  Ken Spencer <me@iotaspencer.me>

	* README.rdoc: convert md to rdoc

2018-11-26  Ken Spencer <me@iotaspencer.me>

	* doc/App.html, doc/CloudflareCli.html,
	doc/CloudflareCli/APITree.html, doc/CloudflareCli/APITree/IPs.html,
	doc/_index.html, doc/class_list.html, doc/css/common.css,
	doc/css/full_list.css, doc/css/style.css, doc/file.README.html,
	doc/file_list.html, doc/frames.html, doc/index.html, doc/js/app.js,
	doc/js/full_list.js, doc/js/jquery.js, doc/method_list.html,
	doc/top-level-namespace.html: remove 'doc' folder in favor of 'docs'

2018-11-26  Ken Spencer <me@iotaspencer.me>

	* .yardopts, README.md => README.rdoc, cloudflare_cli.md =>
	cloudflare_cli.rdoc, docs/App.html, docs/CloudflareCli.html,
	docs/CloudflareCli/APITree.html,
	docs/CloudflareCli/APITree/IPs.html, docs/_index.html,
	docs/class_list.html, docs/css/common.css, docs/css/full_list.css,
	docs/css/style.css, docs/file.README.html, docs/file_list.html,
	docs/frames.html, docs/index.html, docs/js/app.js,
	docs/js/full_list.js, docs/js/jquery.js, docs/method_list.html,
	docs/top-level-namespace.html: upload docs

2018-11-26  Ken Spencer <me@iotaspencer.me>

	* .yardoc/checksums, .yardoc/complete, cloudflare_cli.gemspec,
	doc/App.html, doc/CloudflareCli.html,
	doc/CloudflareCli/APITree.html, doc/CloudflareCli/APITree/IPs.html,
	doc/_index.html, doc/class_list.html, doc/css/common.css,
	doc/css/full_list.css, doc/css/style.css, doc/file.README.html,
	doc/file_list.html, doc/frames.html, doc/index.html, doc/js/app.js,
	doc/js/full_list.js, doc/js/jquery.js, doc/method_list.html,
	doc/top-level-namespace.html: more changes

2018-11-26  Ken Spencer <me@iotaspencer.me>

	* Initial Commit

