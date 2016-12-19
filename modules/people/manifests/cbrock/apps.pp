class people::cbrock::apps {
  $dotfiles_dir = hiera('dotfiles_dir')

  package { 'iterm2'         : provider => 'brewcask' }
  package { 'alfred'         : provider => 'brewcask' }
  package { '1password'      : provider => 'brewcask' }
  package { 'the-unarchiver' : provider => 'brewcask' }
  package { 'evernote'       : provider => 'brewcask' }
  package { 'shiftit'        : provider => 'brewcask' }

  # brew cask versions tap
  homebrew::tap { 'caskroom/versions': }

  package { 'sublime-text' : provider => 'brewcask' }
  package { 'firefox'      : provider => 'brewcask' }

  # iterm2
  file { "/Users/${::boxen_user}/com.googlecode.iterm2.plist" :
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles_dir}/com.googlecode.iterm2.plist",
    require => [Repository["${dotfiles_dir}"],
                Package['iterm2']]
  }

  exec { 'iterm2_load_prefs':
    command => 'defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true',
    require => File["/Users/${::boxen_user}/com.googlecode.iterm2.plist"]
  }

  exec { 'iterm2_prefs_custom_folder':
    command => "defaults write com.googlecode.iterm2 PrefsCustomFolder -string /Users/${::boxen_user}/",
    require => Exec['iterm2_load_prefs']
  }

  # sublime text
  ## We're installing via brew cask, but using sublime_text_3::package to install packages

  # taken from https://github.com/jozefizso/puppet-sublime_text_3/blob/master/manifests/config.pp
  $dir = "/Users/${::boxen_user}/Library/Application Support/Sublime Text 3"
  $packages_dir = "${dir}/Packages"
  $user_packages_dir = "${packages_dir}/User"
  $installed_packages_dir = "${dir}/Installed Packages"

  file { [
    $dir,
    $packages_dir,
    $user_packages_dir,
    $installed_packages_dir
  ]:
    ensure  => directory,
    require => Package['sublime-text']
  }

  ## settings
  file { "${user_packages_dir}/Preferences.sublime-settings" :
    ensure  => link,
    mode    => '0644',
    target  => "${dotfiles_dir}/Preferences.sublime-settings",
    require => [Repository["${dotfiles_dir}"],
                File[$user_packages_dir]]
  }

  ## packages

  include sublime_text_3::package_control

  sublime_text_3::package { 'EditorConfig':
    source  => 'sindresorhus/editorconfig-sublime',
    require => Package['sublime-text']
  }

  sublime_text_3::package { 'Emmet':
    source => 'sergeche/emmet-sublime',
    require => Package['sublime-text']
  }

  sublime_text_3::package { 'SublimePuppet':
    source => 'russCloak/SublimePuppet',
    require => Package['sublime-text']
  }

  ## theme

  sublime_text_3::package { 'zenburn' :
    source => 'https://github.com/colinta/zenburn',
    require => Package['sublime-text']
  }
}
