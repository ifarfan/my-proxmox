#
#  Colored prompt based on environment
#
HOST_NAME=$(hostname --fqdn)

case $HOST_NAME in
  *".oracle"*)
    #  Production -- RED
    export PS1="\[\033[38;5;39m\]\u\[\033[0m\]@\[\033[1;31m\]\h\[\033[0m\].prod:\[\033[38;5;39m\]\w\[\033[0m\]\$ "
    ;;
  *".cloudflare"*)
    #  Preview -- YELLOW
    export PS1="\[\033[38;5;39m\]\u\[\033[0m\]@\[\033[1;33m\]\h\[\033[0m\].preview:\[\033[38;5;39m\]\w\[\033[0m\]\$ "
    ;;
  *".local"*)
    #  Development -- GREEN
    export PS1="\[\033[1;30m\]\u\[\033[0m\]@\[\033[1;32m\]\h\[\033[0m\].dev:\[\033[38;5;39m\]\w\[\033[0m\]\$ "
    ;;
  *)
    #  Global Bash Prompt -- GRAY
    export PS1="\[\033[1;32m\]\u\[\033[0m\]@\[\033[1;30m\]\h\[\033[0m\].none:\[\033[38;5;39m\]\w\[\033[0m\]\$ "
    ;;
esac
