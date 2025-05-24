#!/bin/bash
# filepath: bm

BOOKMARKS_FILE="data/bookmarks.txt"

mkdir -p data

case "$1" in
  add)
    URL="$2"
    shift 2
    if [[ "$1" == "-c" ]]; then
      DESC="$2"
    else
      echo -n "Enter description: "
      read DESC
    fi
    echo "$URL # $DESC" >> "$BOOKMARKS_FILE"
    echo "✅ saved \"$URL\" to $BOOKMARKS_FILE"
    ;;
  get)
    shift
    if [ $# -eq 0 ]; then
      echo "Usage: bm get <search-term>"
      exit 1
    fi
    grep --color=always -i "$*" "$BOOKMARKS_FILE" | awk '{print; print ""}'
    ;;
  *)
    echo "Usage:"
    echo "  bm add <url> -c <description>"
    echo "  bm add <url>   # will prompt for description"
    echo "  bm get <search-term>"
    ;;
esac
