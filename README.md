envrc-zsh-plugin
=================

Oh-my-zsh plugin to load or unload environment variables depending on the current directory.

# Quick start guide

Installation
--------------------

First, download the plugin to your $ZSH_CUSTOM/plugins directory.

#### using curl

    curl -o $ZSH_CUSTOM/plugins/envrc.plugin.zsh https://raw.githubusercontent.com/fabiogibson/envrc-zsh-plugin/master/envrc.plugin.zsh
    

#### using wget

    wget -O $ZSH_CUSTOM/plugins/envrc.plugin.zsh https://raw.githubusercontent.com/fabiogibson/envrc-zsh-plugin/master/envrc.plugin.zsh

Now, edit your ~/.zshrc and add "envrc" (without quotes) to your plugins list. 

    plugins=(git ... envrc)

Reload oh-my-zsh.

    source ~/.zshrc

Usage
--------------------

Create a file named ".envrc" inside your project directory containing a list of enviroment variables you need to be set when you cd in that directory.

The file shall contain one variable per line, in the following format:

    VAR_NAME=VAR_VALUE

Your variables will be automatically set and unset every time you cd or leave a project directory.
