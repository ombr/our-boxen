class people::ombr {
  include chrome
  include iterm2::stable
  include iterm2::colors::solarized_dark
  include iterm2::colors::solarized_light
  include zsh
  exec { 'install oh-my-zsh':
    command => 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"',
    creates => "${home}/.oh-my-zsh",
  }
  package { 'tmux': ensure => "installed" }
  package { 'python': ensure => "installed" }
  package { 'vim': ensure => "installed" }
  package { 'coreutils': ensure => "installed" }
  package { 'reattach-to-user-namespace': ensure => "installed" }
  ruby_gem { 'github gem for all versions':
    gem          => 'github',
    ruby_version => '*',
  }
  include macvim
  # include docker
  include nvm
  include heroku
  include postgresql
  include qt
  include alfred
  include spectacle
  include appcleaner
  include java
  include opera
  include firefox
  include sublime_text
  include teamviewer
  include transmit
  include vlc
  include android::sdk
  include android::ndk
  include android::tools
  include android::platform_tools
  include android::studio

  sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }
  include brewcask
  package { 'ngrok': ensure => "installed" }
  # package { 'hordnis': ensure => "installed" }
  package { 'wget': ensure => "installed" }
  package { 'htop-osx': ensure => "installed" }
  package { 'skype': provider => 'brewcask' }
  package { 'virtualbox': provider => 'brewcask' }
  package { 'intel-haxm': provider => 'brewcask' }
  package { 'optipng': ensure => 'installed' }
  package { 'jpeg': ensure => 'installed' }
  include spotify

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${home}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'ombr/dotfiles',
    require => File[$my]
  }
}
