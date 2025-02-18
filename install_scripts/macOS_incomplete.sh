# --------------------------------------------------------------------
# Should write a script to make symlinks with all dotfiles
# that need to go in ~ folder
# --------------------------------------------------------------------

bash -c ./create_simlink.sh

# --------------------------------------------------------------------
# Also should write a script to make Download folder the one on iCloud
# --------------------------------------------------------------------



# --------------------------------------------------------------------
# For defaults see: 
# https://macos-defaults.com
# --------------------------------------------------------------------

# Settings: Enable dragging with three finger drag
defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"

# Finder: Show all file extensions inside the Finder
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Finder: Show path bar in the bottom of the Finder windows
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Finder: Set the default view style for folders to list
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"

# Finder: Show extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Desktop: Do not show hard disks
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "false"

# Dock: Scroll up on an icon to show app exposé
defaults write com.apple.dock "scroll-to-open" -bool "true"

# Dock: Autohide Dock
defaults write com.apple.dock "autohide" -bool "true"

# Dock: Autohide Delay
defaults write com.apple.dock "autohide-delay" -float "0"

# Mission Control : Don't arrange windows automatically  
defaults write com.apple.dock "mru-spaces" -bool "false"

# Mission Control : Group Windows by application
defaults write com.apple.dock "expose-group-apps" -bool "true"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

# Specify the preferences directory for iterm2 settings
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/dotfiles/iTerm2_settings"

killall Dock
