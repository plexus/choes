CHOES_VERSION=0.1

SHOESES=()
[[ -d /opt/shoes/    ]] && SHOESES+=(/opt/shoes/*)
[[ -d "$HOME/.shoes" ]] && SHOESES+=("$HOME"/.shoes/*)
[[ -d "$SHOES_DIR" ]]   && SHOESES+=("$SHOES_DIR"/*)

function choes_reset()
{
    [[ -z "$SHOES_ROOT" ]] && return

    export PATH=":$PATH:"
    export PATH=${PATH//:$SHOES_ROOT\/bin:/:}
    export PATH=${PATH#:}
    export PATH=${PATH%:}

    export RUBYLIB=":$RUBYLIB:"; export RUBYLIB=${RUBYLIB//:$SHOES_ROOT\/lib:/:}
    export RUBYLIB=${RUBYLIB#:}
    export RUBYLIB=${RUBYLIB%:}
}

function choes_use()
{
    if [[ ! -x "$1/bin/shoes" ]] && [[ ! -x "$1/dist/shoes" ]] ; then
        echo "chruby: $1/bin/shoes or $1/dist/shoes needs to exist and be executable" >&2
        return 1
    fi

    [[ -n "$SHOES_ROOT" ]] && choes_reset

    export SHOES_ROOT="$1"

    export PATH="$SHOES_ROOT/bin:$PATH"
    if [[ -d "$SHOES_ROOT/dist" ]] ; then
        export PATH="$SHOES_ROOT/dist:$PATH"
    fi
    # dist/ gets priority over bin/ , this is for red shoes

    export RUBYLIB="$SHOES_ROOT/lib:$RUBYLIB"
}

function choes()
{
  case "$1" in
    -h|--help)
      echo "usage: choes [SHOES_VERSION]"
      ;;

    -v|--version)
      echo "chruby version $CHOES_VERSION"
      ;;

    "")
      local star

      for dir in ${SHOESES[@]}; do
        if [[ "$dir" == "$SHOES_ROOT" ]]; then
          star="*"
        else
          star=" "
        fi
        echo " $star $(basename "$dir")"
      done
      ;;

    system)
      choes_reset
      ;;

    *)
      for dir in ${SHOESES[@]}; do
        if [[ `basename "$dir"` == *$1* ]]; then
          shift
          choes_use "$dir" "$*"
          return $?
        fi
      done

      echo "choes: unknown Shoes: $1" >&2
      return 1
      ;;
      esac
 }
