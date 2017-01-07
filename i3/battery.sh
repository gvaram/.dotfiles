#!/bin/zsh
nstance="${1:-BAT0}"

if [[ -e "/sys/class/power_supply/$instance" ]]; then
  status="$(cat /sys/class/power_supply/$instance/status)"
  capacity="$(($(cat /sys/class/power_supply/$instance/capacity) + 1))"

  case "$status" in
      "Discharging")
          if [[ $capacity -gt 89 ]]; then
            symbol=' '
          elif [[ $capacity -gt 64 ]]; then
            symbol=' '
          elif [[ $capacity -gt 34 ]]; then
            symbol=' '
          elif [[ $capacity -gt 9 ]]; then
            symbol=' '
          else
            symbol=' '
          fi
          ;;
      "Charging")
          symbol=' '
          ;;
      "Unknown")
          symbol=' '
          ;;
      "Full")
          symbol=' '
          exit
          ;;
  esac

  # Full text
  echo "$symbol $capacity%"
  echo "$symbol $capacity%"


  if [[ $status = "Full" ]] || [[ $status = "Charging" ]] || [[ $status = "Unknown" ]] || [[ $capacity -gt 89 ]]; then
      echo "#52B5B9"
  elif [[ $capacity -lt 21 ]] && [[ $capacity -gt 10 ]] && [[ $status = "Discharging" ]]; then
      echo "#EDC33D"
  elif [[ $capacity -lt 11 ]] && [[ $status = "Discharging" ]]; then
      echo "#E02760"
  fi
fi

case $BLOCK_BUTTON in
  1) xfce4-power-manager-settings ;;
esac
