#!/bin/bash

source_localised_aliases() {
  for f in $ZSHALIASES/localised_aliases/*; do
    if [[ $f != *"local_source.sh" ]]; then
      if [[ $f == *".sh" ]]; then
        source $f
      fi
    fi
  done
}

file_count=$(ls $ZSHALIASES/localised_aliases | wc -l)
if [ "$file_count" -gt 1 ]; then
  source_localised_aliases
fi