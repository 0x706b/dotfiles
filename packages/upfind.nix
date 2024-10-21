{ pkgs, ... }: {
  upfind = pkgs.writeShellScriptBin "upfind" ''
    DIR=$PWD

    while
      RESULT=$(find "$DIR"/ -maxdepth 1 "$@")
      # echo "Debugging upfind - search in $DIR gives: $RESULT"
      [[ -z $RESULT ]] && [[ "$DIR" != "/" ]]
    do DIR=$(dirname "$DIR"); done

    echo "$RESULT"

  '';
}
