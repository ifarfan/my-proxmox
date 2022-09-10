#
#  Colored prompt based on environment
#
HOST_NAME=$(hostname --fqdn)

export PS1="\[\033[1;30m\]\u\[\033[0m\]@\[\033[1;32m\]\h\[\033[0m\].sandbox:\[\033[38;5;39m\]\w\[\033[0m\]\$ "
