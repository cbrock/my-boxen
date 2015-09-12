class people::cbrock::brew {
  package { 'tree'     : provider => 'homebrew' }
  package { 'watchman' : provider => 'homebrew' }
}