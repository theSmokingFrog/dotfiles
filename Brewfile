# Updates to the latest version of homebrew
update

# Upgrade any already-installed formulae.
upgrade

# Tap the cores; should be tapped though
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add '$(brew --prefix coreutils)/libexec/gnubin' to '$PATH'.
brew "coreutils"

# Install some other useful utilities like 'sponge'.
brew "moreutils"

# Install GNU 'find', 'locate', 'updatedb', and 'xargs', 'g'-prefixed.
brew "findutils"

# Install GNU 'sed', overwriting the built-in 'sed'.
brew "gnu-sed", args: {"with-default-names"}

# Installs bash and completions in a current version
brew "bash"
brew "bash-completion@2"

# Updated versions to some OSX Tools
brew "vim", args: {"with-override-system-vi"}
brew "grep"
brew "openssh"
brew "screen"

# Useful dev-tools
brew "tree"
brew "wget"
brew "xmlstarlet"
brew "graphviz"

# Useful other binaries
brew "ack"
brew "fontforge"
brew "groovy"
brew "neofetch"
brew "p7zip"
brew "pigz"
brew "pv"
brew "rename"
brew "ssh-copy-id"
brew "zopfli"

cleanup