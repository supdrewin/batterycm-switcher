#!/bin/bash

# ------------------------------ CONFIG ------------------------------ #

. /etc/batterycm-switcher/batterycm.conf

# ------------------------------ CONFIG ------------------------------ #


# ------------------------------ RUNTIME ------------------------------ #

[[ ! -f /tmp/batterycm.lib ]] && xz -cd \
  /usr/lib/batterycm-switcher/*.lib \
  >/tmp/batterycm.lib && chmod 400 /tmp/batterycm.lib
. /tmp/batterycm.lib

# ------------------------------ RUNTIME ------------------------------ #


# ------------------------------ batterycm.main ------------------------------ #

if [[ "$1" ]]; then
  if [[ ! "$2" ]]; then
    case $1 in
      auto)      systemctl enable --now batterycm-charger ;;
      call)      batterycm.keymapper ;;
      config)    vim -u "$vim_config_path" /etc/batterycm-switcher/batterycm.conf ;;
      debug)     less $batterycm_log_path ;;
      disable)   systemctl disable --now batterycm-switcher ;;
      enable)    systemctl enable --now batterycm-switcher ;;
      help)      man batterycm-switcher ;;
      noauto)    systemctl disable --now batterycm-charger ;;
      norun)     batterycm.charger ;;
      status|o*) batterycm.adjuster $1 ;;
      version)   echo ${0##*\/} 1.1.1 ;;
      *) batterycm.debugger "batterycm.main :: Fail to change mode under invalid option :(" v ;;
    esac
    else batterycm.debugger "batterycm.main :: Invalid option '$2', more than 1 option will not work :(" v
  fi
  else batterycm.adjuster
fi

# ------------------------------ batterycm.main ------------------------------ #
