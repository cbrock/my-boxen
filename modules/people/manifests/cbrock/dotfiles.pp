class people::cbrock::dotfiles {
  $dotfiles_dir = hiera('dotfiles_dir')

  repository { "${dotfiles_dir}":
    source => 'cbrock/dotfiles',
  }

  # TODO: create homebrew formula or something for the following

  file { "/Users/${::boxen_user}/bin" :
    ensure  => directory
  }

  file { "/Users/${::boxen_user}/bin/nw" :
    ensure  => link,
    target  => "/Users/${::boxen_user}/dotfiles/nw",
    require => [Repository["${dotfiles_dir}"],
                File["/Users/${::boxen_user}/bin"]]
  }
}
