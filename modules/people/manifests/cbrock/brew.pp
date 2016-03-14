class people::cbrock::brew {
  package { 'vim'      : provider => 'homebrew' }
  package { 'tree'     : provider => 'homebrew' }
  package { 'watchman' : provider => 'homebrew' }
  package { 'httpie'   : provider => 'homebrew' }
}
