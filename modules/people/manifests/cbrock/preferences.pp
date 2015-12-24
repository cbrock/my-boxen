class people::cbrock::preferences {
  # global settings
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::global::disable_smart_dashes
  class { 'osx::sound::interface_sound_effects':
    enable => false
  }
  include osx::sound::disable_volume_change_sound
  # disable sound effects on boot
  # TODO osx seems to reset this value: https://github.com/mathiasbynens/dotfiles/issues/517
  # sudo nvram SystemAudioVolume=%00;
  
  # dock settings
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::dim_hidden_apps
  
  # finder settings
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_all_filename_extensions
  include osx::finder::hide_icons_on_desktop

  # safari settings
  include osx::safari::enable_developer_mode
  
  # misc settings
  include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
  
  # TODO
  # https://github.com/cbrock/old-dotfiles/blob/master/osx.sh
   
  # custom wallpaper
   
  # check for software updates daily
  # defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1;

  # save screenshots in PNG format
  # defaults write com.apple.screencapture type -string "png";

  # save screenshots to the desktop
  # defaults write com.apple.screencapture location -string "${HOME}/Desktop";

  # when performing a search, search the current folder by default
  # defaults write com.apple.finder FXDefaultSearchScope -string "SCcf";

  # Use column view in all Finder windows by default
  # defaults write com.apple.finder FXPreferredViewStyle -string "clmv"; 
  
  # Empty Trash securely by default
  # defaults write com.apple.finder EmptyTrashSecurely -bool true;

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

  # running "Don’t automatically rearrange Spaces based on most recent use"
  # defaults write com.apple.dock mru-spaces -bool false
  # TODO other dock-related items

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