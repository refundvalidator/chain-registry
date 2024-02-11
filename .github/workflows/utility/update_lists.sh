#!/bin/bash
files="$(ls -d */ | grep -vE "^#|\.|_" | xargs -n 1 basename)"
printf '%s\n' "{
  \"mainnets\": [
    \"${files//$'\n'/$'",\n    "'}\"
  ]
}" > mainnets.json
files="$(ls -d testnets/*/ | grep -vE "^#|\.|_" | xargs -n 1 basename)"
printf '%s\n' "{
  \"testnets\": [
    \"${files//$'\n'/$'",\n    "'}\"
  ]
}" > testnets.json
