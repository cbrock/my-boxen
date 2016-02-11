class people::cbrock::dotfiles {
  $dotfiles_dir = hiera('dotfiles_dir')

  repository { "${dotfiles_dir}":
    source => 'cbrock/dotfiles',
  }

  file { "/Users/${::boxen_user}/.vimrc":
    ensure  => link,
    target  => "${dotfiles_dir}/.vimrc",
    require => [
      Repository[$dotfiles_dir]
    ]
  }

  file { ["/Users/${::boxen_user}/.vim",
          "/Users/${::boxen_user}/.vim/bundle"] :
    ensure  => directory
  }

  # TODO
  # need to install plugins, via `vim +PluginInstall +qall`, after this.
  # wrap in `exec`?
  #
  # also, the following iTerm2 setting needs to be enabled:
  # Preferences -> Profiles -> Terminal -> Terminal Emulation -> Report Terminal Type: xterm-256color
  # maybe add iTerm2 prefs file to dotfiles?
  repository { "/Users/${::boxen_user}/.vim/bundle/Vundle.vim":
    source => 'VundleVim/Vundle.vim',
    require => [
      File["/Users/${::boxen_user}/.vim/bundle"]
    ]
  }

  file { "/Users/${::boxen_user}/.spacemacs":
    ensure  => link,
    target  => "${dotfiles_dir}/.spacemacs",
    require => [
      Repository[$dotfiles_dir]
    ]
  }

  # TODO: create homebrew formula or something for the following

  file { "/Users/${::boxen_user}/bin" :
    ensure  => directory
  }

  file { "/Users/${::boxen_user}/bin/nw" :
    ensure  => link,
    target  => "${dotfiles_dir}/nw",
    require => [Repository["${dotfiles_dir}"],
                File["/Users/${::boxen_user}/bin"]]
  }
}
