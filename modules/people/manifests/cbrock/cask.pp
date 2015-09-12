class people::cbrock::cask {
  package { 'iterm2'          : provider => 'brewcask' }
  package { 'alfred'          : provider => 'brewcask' }
  package { '1password'       : provider => 'brewcask' }
  package { 'the-unarchiver'  : provider => 'brewcask' }
  package { 'evernote'        : provider => 'brewcask' }
  # TODO chrome-canary + extensions

  # brew cask versions tap
  homebrew::tap { 'caskroom/versions': }
  
  package { 'sublime-text3'   : provider => 'brewcask' }
  package { 'firefox-nightly' : provider => 'brewcask' }
  # TODO add sublime settings, packages, possibly from copying dotfiles via:
  # http://garylarizza.com/blog/2013/02/15/puppet-plus-github-equals-laptop-love/
}