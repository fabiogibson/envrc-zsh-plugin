if [[ ! $DISABLE_ENVRC -eq 1 ]]; then
  _envrc_cwd() {
      # if cd in the root dir, there is nothing to do.
      if [[ $(pwd) = $ENVRC ]]; then
        return 0
      fi

      # if cwd is not a subdir from root dir, unload env.
      if [[ $(pwd) != $ENVRC/* ]]; then
        _unload_env
        unset ENVRC
      fi

      # if cwd contains .envrc, load it up.
      if [[ -f ".envrc" ]]; then
        ENVRC=$(pwd)
        _load_env
      fi
  }

  _unload_env() {
    while IFS== read -r var _; do
      [[ -n "$var" && ! $var =~ ^#.* ]] &&  unset "$var"
    done <"$ENVRC/.envrc"

    echo $fg[yellow]"*** Environment unloaded\n"
  }

  _load_env() {
    while IFS= read -r var; do
      [[ -n "$var" && ! $var =~ ^#.* ]] && export "$var"
    done < ".envrc"

    echo $fg[green]"*** Environment loaded\n"
  }

  # Append _envrc_cwd to the chpwd_functions array, so it will be called on cd
  # http://zsh.sourceforge.net/Doc/Release/Functions.html
  if ! (( $chpwd_functions[(I)envrc_cwd] )); then
    chpwd_functions+=(_envrc_cwd)
  fi
fi
