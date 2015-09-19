# This code from xdissent's pull request https://github.com/boxen/puppet-chrome/pull/14

# Public: Install Chrome extension
#
# Examples
#
#   chrome::extension { 'Reddit Enhancement Suite':
#     id => 'kbmfpngjjgdllneeigpgjifpgocmfgmb',
#   }
define chrome::extension(
  $id,
  $source = 'https://clients2.google.com/service/update2/crx',
  $path = "/Users/${::boxen_user}/Library/Application Support/Google/Chrome/External Extensions",
) {
  exec { "chrome-ext-dir-${title}":
    command => "/bin/mkdir -p '${path}'",
    creates => $path,
  }
  ->
  file { "chrome-ext-${title}":
    ensure  => present,
    path    => "${path}/${id}.json",
    mode    => '0644',
    content => "{\"external_update_url\": \"${source}\"}",
  }
}

# Public: Install Chrome Canary extension
#
# Examples
#
#   chrome::canary::extension { 'Reddit Enhancement Suite':
#     id => 'kbmfpngjjgdllneeigpgjifpgocmfgmb',
#   }
define chrome::canary::extension(
  $id,
  $source = undef,
  $path = "/Users/${::boxen_user}/Library/Application Support/Google/Chrome Canary/External Extensions",
) {
  chrome::extension { "${title}-canary":
    id      => $id,
    source  => $source,
    path    => $path,
  }
}