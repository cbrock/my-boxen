class people::cbrock::node {

  # node versions
  # previously managed via manifests/site.pp
  # nodejs::version { '0.6': }
  # nodejs::version { '0.8': }
  # nodejs::version { '0.10': }
  nodejs::version { '0.12.7': }
  nodejs::version { '4.2.4': }
  nodejs::version { '5.3.0': }

  class { 'nodejs::global':
    version => '4.2.4'
  }

  npm_module { "npm for all installed node versions":
    module       => 'npm',
    ensure       => 'present',
    node_version => '*'
  }

  npm_module { "bower for all installed node versions":
    module       => 'bower',
    ensure       => 'present',
    node_version => '*'
  }

  npm_module { "phantomjs for installed node versions":
    module       => 'phantomjs',
    ensure       => 'present',
    node_version => '*'
  }

  # installation of ember-cli for node version 5.x.x seems to fail,
  # so only install for default node version 4.2.4
  npm_module { "ember-cli for ${nodejs::global::version}":
    module       => 'ember-cli',
    ensure       => 'present',
    version      => '1.13.13',
    node_version => "${nodejs::global::version}"
  }
}
