class people::cbrock::node {

  # node versions
  # previously managed via manifests/site.pp
  # nodejs::version { '0.6': }
  # nodejs::version { '0.8': }
  # nodejs::version { '0.10': }
  nodejs::version { '0.12.17': }
  nodejs::version { '4.6.1': }
  nodejs::version { '6.9.1': }

  # See all available versions with `nodenv install --list'
  # If the version you need is missing, try upgrading node-build:
  # `cd /opt/boxen/node-build && git pull && cd -`
  class { 'nodejs::global':
    version => '4.6.1'
  }

  npm_module { "npm for all installed node versions":
    module       => 'npm',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }

  npm_module { "bower for all installed node versions":
    module       => 'bower',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }

  npm_module { "phantomjs for installed node versions":
    module       => 'phantomjs-prebuilt',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }

  # installation of ember-cli for node version 5.x.x seems to fail,
  # so only install for default global node version
  npm_module { "ember-cli for ${nodejs::global::version}":
    module       => 'ember-cli',
    ensure       => 'present',
    # version      => '2.6.2',
    node_version => "${nodejs::global::version}"
  }

  npm_module { "jshint for all installed node versions":
    module       => 'jshint',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }
}
