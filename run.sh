#!/bin/bash -x
bundle_update() {
  bundle update
  touch .last_update
}
if test `find ".last_update" -mmin +1440`; then
  echo "It's been too long since we updated. Let's do it!"
  bundle_update
elif [ ! -f .last_update ]; then
  echo "We've never updated. Let's do it!"
  bundle_update
else
  echo "Skipping bundle update for now."
fi
bundle exec jekyll serve --watch --drafts
