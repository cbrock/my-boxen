class people::cbrock {
  notify { "doing cbrock's bidding": }

  include people::cbrock::apps
  include people::cbrock::brew
  include people::cbrock::node
  include people::cbrock::cask
  include people::cbrock::preferences

  # TODO - zsh
  # https://github.com/fernandes/puppet-ohmyzsh

  # TODO (all stuff included in dotfiles osx.sh), possibly via:
  # http://jdigger.github.io/boxen-slides/#_other_resources_osx
  # also, https://github.com/boxen/our-boxen/issues/103
}
