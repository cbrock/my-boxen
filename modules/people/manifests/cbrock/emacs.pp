class people::cbrock::emacs {
  homebrew::tap { 'railwaycat/homebrew-emacsmacport': }

  package { 'emacs-mac':
    install_options => [
      '--with-spacemacs-icon',
    ]
  }

  exec { 'brew_linkapps':
    command => 'brew linkapps',
    require => [
      Package['emacs-mac']
    ]
  }

  repository { "/Users/${::boxen_user}/.emacs.d":
    source => 'syl20bnr/spacemacs',
    require => [
      Exec['brew_linkapps']
    ]
  }

  # $emacs_plist_path = '/opt/homebrew-cask/Caskroom/emacs-mac/emacs-24.5-z-mac-5.15/Emacs.app/Contents/Info.plist'

  # exec { 'add_spacemacs_logo':
  #  command => "defaults write ${emacs_plist_path} CFBundleIconFilei path/to/icon.icns",
  #  require => [
  #    Repository["/Users/${::boxen_user}/.emacs.d"]
  #  ]
  # }

  # After you have completed the install process below,
  # it is also recommended to add the osx layer to your dotfile.
  # Install instructions are available in the osx layer documentation.
}
