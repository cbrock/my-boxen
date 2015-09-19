class people::cbrock::apps {
  package { 'iterm2'          : provider => 'brewcask' }
  package { 'alfred'          : provider => 'brewcask' }
  package { '1password'       : provider => 'brewcask' }
  package { 'the-unarchiver'  : provider => 'brewcask' }
  package { 'evernote'        : provider => 'brewcask' }

  # brew cask versions tap
  homebrew::tap { 'caskroom/versions': }
  
  package { 'sublime-text3'        : provider => 'brewcask' }
  package { 'firefox-nightly'      : provider => 'brewcask' }
  package { 'google-chrome-canary' : provider => 'brewcask' }
  
  # chrome extensions
  chrome::canary::extension { '1Password':
    id      => 'aomjjhallfgjeglblehebfpbcfeobpgk',
    require => Package['google-chrome-canary']
  }

  chrome::canary::extension { 'Ember Inspector':
    id      => 'bmdblncegkenkacieihfhpjfppoconhi',
    require => Package['google-chrome-canary']
  }

  chrome::canary::extension { 'Adblock':
    id      => 'gighmmpiobklfepjocnamgkkbiglidom',
    require => Package['google-chrome-canary']
  }
  
  # TODO add sublime settings, packages, possibly from copying dotfiles via:
  # http://garylarizza.com/blog/2013/02/15/puppet-plus-github-equals-laptop-love/
}