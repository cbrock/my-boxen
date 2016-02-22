class people::cbrock::apps {
  package { 'iterm2-beta'     : provider => 'brewcask' }
  package { 'alfred'          : provider => 'brewcask' }
  package { '1password'       : provider => 'brewcask' }
  package { 'the-unarchiver'  : provider => 'brewcask' }
  package { 'evernote'        : provider => 'brewcask' }
  package { 'shiftit'         : provider => 'brewcask' }

  # brew cask versions tap
  homebrew::tap { 'caskroom/versions': }

  package { 'sublime-text3'        : provider => 'brewcask' }
  package { 'firefox'              : provider => 'brewcask' }
  package { 'google-chrome-canary' : provider => 'brewcask' }
  package { 'java'                 : provider => 'brewcask' }
  package { 'hipchat'              : provider => 'brewcask' }
  package { 'charles'              : provider => 'brewcask' }
  package { 'vmware-fusion'        : provider => 'brewcask' }
  # OSX El Capitan issues installing vagrant via brew cask
  # More info: https://github.com/boxen/puppet-brewcask/issues/45
  # Installing via https://github.com/boxen/puppet-vagrant in Puppetfile for now
  # package { 'vagrant'            : provider => 'brewcask' }
  include vagrant
  vagrant::plugin { 'vmware-fusion': }
  # TODO: GPG Keychain
  # https://github.com/caskroom/homebrew-cask/blob/master/Casks/gpgtools.rb

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
    require => Package['iterm2-beta']
  }

  exec { 'hide_iterm2_title_bars':
    command => 'defaults write com.googlecode.iterm2 HideTab -bool true',
    require => Package['iterm2-beta']
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
    target  => "${dotfiles_dir}/Preferences.sublime-settings",
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
