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

  chrome::canary::extension { 'uBlock Origin':
    id      => 'cjpalhdlnbpafiamejdnhcphjbkeiagm',
    require => Package['google-chrome-canary']
  }

  # iterm2
  exec { 'disable_iterm2_quit_prompt':
    command => 'defaults write com.googlecode.iterm2 PromptOnQuit -bool false',
    require => Package['iterm2']
  }

  exec { 'hide_iterm2_title_bars':
    command => 'defaults write com.googlecode.iterm2 HideTab -bool true',
    require => Package['iterm2']
  }

  # sublime text
  ## We're installing via brew cask, but using sublime_text_3::package to install packages
  $dotfiles_dir = hiera('dotfiles_dir')

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
    require => Package['sublime-text3']
  }

  ## settings
  file { "${user_packages_dir}/Preferences.sublime-settings" :
    ensure  => link,
    mode    => '0644',
    target  => "/Users/${::boxen_user}/dotfiles/Preferences.sublime-settings",
    require => [Repository["${dotfiles_dir}"],
                File[$user_packages_dir]]
  }

  ## packages

  include sublime_text_3::package_control

  sublime_text_3::package { 'EditorConfig':
    source  => 'sindresorhus/editorconfig-sublime',
    require => Package['sublime-text3']
  }

  sublime_text_3::package { 'Emmet':
    source => 'sergeche/emmet-sublime',
    require => Package['sublime-text3']
  }

  sublime_text_3::package { 'SublimePuppet':
    source => 'russCloak/SublimePuppet',
    require => Package['sublime-text3']
  }

  ## theme

  sublime_text_3::package { 'zenburn' :
    source => 'https://github.com/colinta/zenburn',
    require => Package['sublime-text3']
  }
}
