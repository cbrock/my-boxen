class people::cbrock::preferences {
  # global settings
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::global::disable_smart_dashes
  include osx::global::disable_smart_quotes
  class { 'osx::sound::interface_sound_effects':
    enable => false
  }
  include osx::sound::disable_volume_change_sound
  include osx::sound::mute_beep_volume
  ## Disable sound effects on boot
  ## TODO osx seems to reset this value: https://github.com/mathiasbynens/dotfiles/issues/517
  # sudo nvram SystemAudioVolume=%00;
  #
  ## Restart automatically if the computer freezes
  # sudo systemsetup -setrestartfreeze on;
  #
  ## Never go into computer sleep mode
  # sudo systemsetup -setcomputersleep Off > /dev/null;
  #
  ## Sleep display after 10 minutes
  # sudo pmset displaysleep 10
  #
  ## automatic restart on power loss
  # sudo pmset autorestart 1
  #
  ## prevent hard disks from going to sleep
  # sudo pmset disksleep 0
  #
  ## require password after display sleep
  #  defaults read com.apple.screensaver
  #  {
  #    askForPassword = 1;
  #    askForPasswordDelay = 300;
  #    tokenRemovalAction = 0;
  #  }
  #
  ## Disable smart quotes as they're annoying when typing code
  # defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false;

  # dock settings
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::dim_hidden_apps
  include osx::dock::icon_size
  include osx::dock::disable_dashboard
  #  include osx::dock::hide_indicator_lights
  class { 'osx::dock::magnification':
    magnification => false
  }
  # include osx::dock::no_auto_rearrange

  # finder settings
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_all_filename_extensions
  include osx::finder::hide_icons_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::search_current_folder
  include osx::finder::use_column_view

  # safari settings
  include osx::safari::enable_developer_mode

  # misc settings
  include osx::no_network_dsstores # disable creation of .DS_Store files on network shares

  # TODO

  # check for software updates daily
  # defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1;

  # save screenshots in PNG format
  # defaults write com.apple.screencapture type -string "png";

  # save screenshots to the desktop
  # defaults write com.apple.screencapture location -string "${HOME}/Desktop";

  # Use plain text mode for new TextEdit documents
  # defaults write com.apple.TextEdit RichText -int 0;

  # Prevent Time Machine from prompting to use new hard drives as backup volume
  # defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true;

  # Disable local Time Machine backups
  # hash tmutil &> /dev/null && sudo tmutil disablelocal;

  # Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed
  # sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes";

  # Enable the Develop menu and the Web Inspector in Safari
  # defaults write com.apple.Safari IncludeDevelopMenu -bool true
  # defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
  # defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true;

  # Set Safari’s home page to ‘about:blank’ for faster loading
  # defaults write com.apple.Safari HomePage -string "about:blank";

  # Prevent Safari from opening ‘safe’ files automatically after downloading
  # defaults write com.apple.Safari AutoOpenSafeDownloads -bool false;

  # Don't animate opening applications from the Dock
  # Minimize windows into their application’s icon
  # Wipe all (default) app icons from the Dock
  # boxen::osx_defaults { 'scrollbars always on':
  #   domain => 'NSGlobalDomain',
  #   key    => 'AppleShowScrollBars',
  #   value  => 'Always',
  #   user   => $::boxen_user,
  # }
  # osx::recovery_message { 'If this Mac is found, please call 555-555-5555': }

  ###############################################################################
  # SSD-specific tweaks                                                         #
  ###############################################################################

  # running "Disable local Time Machine snapshots"
  # sudo tmutil disablelocal;ok

  # running "Disable hibernation (speeds up entering sleep mode)"
  # sudo pmset -a hibernatemode 0;ok

  # running "Remove the sleep image file to save disk space"
  # sudo rm -rf /Private/var/vm/sleepimage;ok
  # running "Create a zero-byte file instead"
  # sudo touch /Private/var/vm/sleepimage;ok
  # running "…and make sure it can’t be rewritten"
  # sudo chflags uchg /Private/var/vm/sleepimage;ok

  # running "Disable the sudden motion sensor as it’s not useful for SSDs"
  # sudo pmset -a sms 0;ok
}
