class people::cbrock::preferences {
  # osx
  
  ## global settings
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  
  ## dock settings
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::dim_hidden_apps
  
  ## finder settings
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_all_filename_extensions
  # uncomment after releasing new version of cbrock/puppet-osx
  # include osx::finder::hide_icons_on_desktop
  
  ## safari settings
  include osx::safari::enable_developer_mode
  
  ## misc settings
  include osx::no_network_dsstores # disable creation of .DS_Store files on network shares
  
  # TODO fork puppet-osx and add stuff a la hide_desktop_icons above
  # 
  # disable volume change sound
  # disable sound effects on boot
  # custom wallpaper
  # check for software updates daily
  # disable smart dashes
  # save screenshots in PNG format
  # save screenshots to the desktop
  # when performing a search, search the current folder by default
  # Use column view in all Finder windows by default
  # Empty Trash securely by default
  # Use plain text mode for new TextEdit documents
  # Prevent Time Machine from prompting to use new hard drives as backup volume
  # Disable local Time Machine backups
  # Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed
  # Enable the Develop menu and the Web Inspector in Safari
  # Set Safari’s home page to ‘about:blank’ for faster loading
  # Prevent Safari from opening ‘safe’ files automatically after downloading
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
}