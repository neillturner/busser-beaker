# <a name="title"></a> Busser::RunnerPlugin::Beaker

[![Gem Version](https://badge.fury.io/rb/busser-beaker.png)](http://rubygems.org/gems/busser-beaker)
[![Build Status](https://travis-ci.org/neillturner/busser-beaker.png)](https://travis-ci.org/neillturner/busser-beaker)

DEPRECATED by [neillturner/kitchen-verifier-serverspec](https://github.com/neillturner/kitchen-verifier-serverspec)

A Busser runner plugin for Beaker format acceptance tests for test kitchen.

This enables testing using the beaker format. The serverspec tests are specified with the modules in the puppet repository.

See [joshbeard/puppet-module-test](https://gitlab.com/joshbeard/puppet-module-test)

## <a name="installation"></a> Installation and Setup

Please read the Busser [plugin usage][plugin_usage] page for more details.

## <a name="usage"></a> Usage

### Directory

In the puppet repository specify:

the spec files with the modules.

the spec_helper in the spec folder and a there is a dummy test/integration folder.

a dummy test/integration/<suite>/beaker/localhost/<suite>_spec.rb containing just a dummy comment.

See example [https://github.com/neillturner/puppet_beaker_repo](https://github.com/neillturner/puppet_beaker_repo)

```

in each module:
.
+-- spec
¦   +-- acceptance
¦   ¦   +-- nodesets
¦   ¦   +-- sample_test_spec.rb
¦   ¦   +-- unsuported_spec.rb
¦   ¦   ¦   +-- main.yml
¦   ¦   +-- templates
¦   ¦       +-- mariadb.repo
¦   +-- classes
¦   ¦   +-- sample_test_spec.rb
¦   +-- fixtures
¦   +-- spec_helper.rb
¦   +-- spec_helper_acceptance.rb

+-- test
    +-- integration
        +-- default      # name of test-kitchen suite
            +-- beaker
                +-- localhost
                    +-- default_spec.rb   # <suite>_spec.rb
```

## <a name="note"></a> Note

### <a name="spec"></a> File Matching

Globbing pattern to match files is `"serverspec/*/*_spec.rb"`.
You need to use `"_spec.rb"` (underscore), not `"-spec.rb"` (minus).


## <a name="spec_helper"></a> spec_helper

```
require 'rubygems'
require 'bundler/setup'

require 'serverspec'
require 'pathname'

RSpec.configure do |config|
  set :backend, :exec
end
```

## <a name="config.yml"></a> config.yml

This goes in directory test/integration/default/beaker  where default is the name of test-kitchen suite

```
---
-
  kitchen_path: '/tmp/kitchen'
  module_path: 'modules'
  module: mycompany_base
  spec_prefix: base
```

### <a name="serverspec1"></a> Specify ServerSpec version

If you have to specify serverspec version, you can use Gemfile. Example Gemfile:

```Gemfile
source 'https://rubygems.org'
gem 'serverspec', '< 2.0'
```

### <a name="backend"></a> Serverspec backend

It runs on a target server for testing after ssh log in it.
So you need to specify `set :backend, :exec` not `set :backend, :ssh` (Serverspec v2).
If you use Serverspec v1, you need to specify `include SpecInfra::Helper::Exec` not `include SpecInfra::Helper::Ssh`.


## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors

Original busser-serverspec created and maintained by [HIGUCHI Daisuke][author] (<d-higuchi@creationline.com>)

modified by [Neill Turner][author] (<neillwturner@gmail.com>)

## <a name="license"></a> License

Apache 2.0 (see [LICENSE][license])


[author]:           https://github.com/neillturner
[issues]:           https://github.com/test-kitchen/busser-beaker/issues
[license]:          https://github.com/test-kitchen/busser-beaker/blob/master/LICENSE
[repo]:             https://github.com/test-kitchen/busser-beaker
[plugin_usage]:     http://docs.kitchen-ci.org/busser/plugin-usage
