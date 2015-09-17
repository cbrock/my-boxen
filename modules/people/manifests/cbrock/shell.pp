class people::cbrock::shell {
  include zsh
  include ohmyzsh

  $home = "/Users/${::boxen_user}"
  $dotfiles_dir = "${boxen::config::srcdir}/dotfiles"

  repository { $dotfiles_dir:
    source => "cbrock/dotfiles"
  }

  file { "${home}/.oh-my-zsh/custom/themes":
    ensure  => directory
  }

  repository { "${home}/.oh-my-zsh/custom/themes/sugar-free":
    source => "cbrock/sugar-free"
  }

  file { "${home}/.zshrc":
    ensure  => link,
    target  => "${dotfiles_dir}/.zshrc",
    require => Repository[$dotfiles_dir]
  }
}