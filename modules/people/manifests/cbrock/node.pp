class people::cbrock::node {

  # node versions
  # previously managed via manifests/site.pp
  # nodejs::version { '0.6': }
  # nodejs::version { '0.8': }
  # nodejs::version { '0.10': }
  # nodejs::version { '0.12.17': }
  nodejs::version { '4.8.4': }
  nodejs::version { '6.11.3': }
  nodejs::version { '8.5.0': }

  # See all available versions with `nodenv install --list'
  # If the version you need is missing, try upgrading node-build:
  # `cd /opt/boxen/node-build && git pull && cd -`
  class { 'nodejs::global':
    version => '6.11.3'
  }

  npm_module { "npm for node v${nodejs::global::version}":
    module       => 'npm',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }

  npm_module { "bower for node v${nodejs::global::version}":
    module       => 'bower',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }

  npm_module { "phantomjs for node v${nodejs::global::version}":
    module       => 'phantomjs-prebuilt',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }

  # installation of ember-cli for node version 5.x.x seems to fail,
  # so only install for default global node version
  npm_module { "ember-cli for node v${nodejs::global::version}":
    module       => 'ember-cli',
    ensure       => 'present',
    # version      => '2.6.2',
    node_version => "${nodejs::global::version}"
  }

  npm_module { "jshint for node v${nodejs::global::version}":
    module       => 'jshint',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }

  npm_module { "jscs for node v${nodejs::global::version}":
    module       => 'jscs',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }
}
