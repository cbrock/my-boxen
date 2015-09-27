class people::cbrock::dotfiles {
  $dotfiles_dir = hiera('dotfiles_dir')

  repository { "${dotfiles_dir}":
    source => 'cbrock/dotfiles',
  }
}