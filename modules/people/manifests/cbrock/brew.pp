class people::cbrock::brew {
  # brew cask versions tap
  homebrew::tap { 'caskroom/versions': }

  exec { 'disable_homebrew_analytics':
    command => 'brew analytics off',
    # ensure homebrew is installed via arbitrary homebrew package
    require => Package['vim']
  }

  package { 'vim'          : provider => 'homebrew' }
  package { 'tree'         : provider => 'homebrew' }
  package { 'watchman'     : provider => 'homebrew' }
  package { 'leiningen'    : provider => 'homebrew' }
  # Install postgresql v9.4 specifically
  package { 'postgresql94' : provider => 'homebrew' }
  package { 'todo-txt'     : provider => 'homebrew' }
  package { 'jq'           : provider => 'homebrew' }
  package { 'httpie'       : provider => 'homebrew' }
  package { 'ag'           : provider => 'homebrew' }
  package { 'maven'        : provider => 'homebrew' }
  package { 'gettext'      : provider => 'homebrew' }
 
  # gettext is keg-only and so not symlinked
  exec { 'brew_link_gettext':
    command => 'brew link gettext --force',
    require => Package['gettext']
  }
}
