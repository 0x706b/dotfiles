{ pkgs, ... }:

pkgs.writeShellScriptBin "upfind" ''
  DIR=$PWD

  while
    RESULT=$(find "$DIR"/ -maxdepth 1 -name "$@")
    # echo "Debugging upfind - search in $DIR gives: $RESULT"
    [[ -z $RESULT ]] && [[ "$DIR" != "/" ]]
  do DIR=$(dirname "$DIR"); done

  echo "$RESULT"
''
