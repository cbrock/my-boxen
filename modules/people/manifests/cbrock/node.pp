class people::cbrock::node {

  # node versions
  # previously managed via manifests/site.pp
  # nodejs::version { '0.6': }
  # nodejs::version { '0.8': }
  # nodejs::version { '0.10': }
  nodejs::version { '0.12.7': }
  nodejs::version { '4.2.2': }
  nodejs::version { '5.1.0': }

  class { 'nodejs::global':
    version => '4.2.2'
  }

  npm_module { "npm for ${nodejs::global::version}":
    module       => 'npm',
    ensure       => 'present',
    node_version => '*'
  }

  npm_module { "bower for ${nodejs::global::version}":
    module       => 'bower',
    ensure       => 'present',
    node_version => '*'
  }

  npm_module { "phantomjs for ${nodejs::global::version}":
    module       => 'phantomjs',
    ensure       => 'present',
    node_version => '*'
  }

  npm_module { "ember-cli for ${nodejs::global::version}":
    module       => 'ember-cli',
    ensure       => 'present',
    node_version => '*'
  }
}
