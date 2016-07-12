class people::cbrock::brew {
  exec { 'disable_homebrew_analytics':
    command => 'brew analytics off',
    # ensure homebrew is installed via arbitrary homebrew package
    require => Package['vim']
  }

  package { 'vim'      : provider => 'homebrew' }
  package { 'tree'     : provider => 'homebrew' }
  package { 'watchman' : provider => 'homebrew' }
  package { 'httpie'   : provider => 'homebrew' }
}
