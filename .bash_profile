#!/bin/bash
# Add '~/bin' to the '$PATH'
export PATH="$HOME/bin:$PATH";

alias vv='echo "#VERSION_GIT_SHORT --- #DATE_GIT_COMMIT"'

# Loading dotfiles and some extensions:
# ~/.path is used for system specific $PATH-Extension.
# ~/.extra is used for system specific Extension that should not be commited.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


shopt -s nocaseglob; ## Case-insensitive globbing (used in pathname expansion)
shopt -s histappend; ## Append to the Bash history file, rather than overwriting it

#> Bash Completion errors on "source"
# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
    source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

# Enable tab completion for 'git' by marking it as an alias for 'git'
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add 'killall' tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# Adding NVM Stuff to startup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Arcanist
[ -s "$ARCANIST/resources/shell/bash-completion" ] && \. "$ARCANIST/resources/shell/bash-completion" # bash completion for arcanist

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"