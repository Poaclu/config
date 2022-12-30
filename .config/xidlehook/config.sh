#!/usr/bin/env bash

# Run xidlehook
xidlehook \
  `# Lock the screen after 10 minutes of incativity` \
  --timer 600  \
    'slock' \
    '' \
  `# Finally, suspend an hour after it locks` \
  --timer 3600 \
    'systemctl suspend' \
    ''
