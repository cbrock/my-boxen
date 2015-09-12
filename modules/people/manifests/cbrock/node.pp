class people::cbrock::node {

  $version = hiera('node_global_version')

  class { 'nodejs::global':
    version => $version
  }

  npm_module { "bower for ${nodejs::global::version}":
    module       => 'bower',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }

  npm_module { "phantomjs for ${nodejs::global::version}":
    module       => 'phantomjs',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }

  npm_module { "ember-cli for ${nodejs::global::version}":
    module       => 'ember-cli',
    ensure       => 'present',
    node_version => "${nodejs::global::version}"
  }
}