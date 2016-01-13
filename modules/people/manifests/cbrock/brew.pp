class people::cbrock::brew {
  package { 'vim'      : provider => 'homebrew' }
  package { 'tree'     : provider => 'homebrew' }
  package { 'watchman' : provider => 'homebrew' }
  package { 'leiningen' : provider => 'homebrew' }
  package { 'postgres' : provider => 'homebrew' }
  package { 'todo-txt' : provider => 'homebrew' }
  package { 'ngrok' : provider => 'homebrew' }
}
