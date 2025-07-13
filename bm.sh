#!/bin/bash

BOOKMARKS_FILE="${BM_STORE:-$HOME/.bm_bookmarks.txt}"

mkdir -p data

case "$1" in
  add)
    URL="$2"
    # Fix: Prevent adding empty URL
    if [ -z "$URL" ]; then
      echo "😳 you forgot to enter a bookmark, please try again."
      echo "Usage: bm add <url>"
      exit 1
    fi
    # Check for too many arguments
    if [ -n "$3" ]; then
      echo "😳 too many arguments provided. Please provide only one URL."
      echo "Usage: bm add <url>"
      echo "Hint: If your URL contains spaces, wrap it in quotes"
      exit 1
    fi
    echo -n "Enter description: "
    read DESC
    # Check for empty description
    if [ -z "$DESC" ]; then
      echo "😳 you forgot to enter a description, please try again."
      exit 1
    fi
    echo "" >> "$BOOKMARKS_FILE"
    echo "$DESC:" >> "$BOOKMARKS_FILE"
    echo "$URL" >> "$BOOKMARKS_FILE"
    echo "✅ saved \"$URL\" to $BOOKMARKS_FILE"
    ;;
  get)
    shift
    if [ $# -eq 0 ]; then
      echo "Usage: bm get <search-term>"
      exit 1
    fi
    if [ ! -f "$BOOKMARKS_FILE" ]; then
      echo "No bookmarks file found at $BOOKMARKS_FILE"
      exit 1
    fi
    grep --color=always -i -A1 "$*" "$BOOKMARKS_FILE" | awk '{print; print ""}'
    ;;
  get-random)
    if [ ! -f "$BOOKMARKS_FILE" ]; then
      echo "No bookmarks file found at $BOOKMARKS_FILE"
      exit 1
    fi
    if [ ! -s "$BOOKMARKS_FILE" ]; then
      echo "No bookmarks found in $BOOKMARKS_FILE"
      exit 1
    fi
    # Get all description lines (lines ending with :), then pick a random one
    DESCRIPTION_LINES=$(grep ':$' "$BOOKMARKS_FILE")
    if [ -z "$DESCRIPTION_LINES" ]; then
      echo "No valid bookmarks found in $BOOKMARKS_FILE"
      exit 1
    fi
    RANDOM_DESC=$(echo "$DESCRIPTION_LINES" | shuf -n 1)
    LINE_NUM=$(grep -n "^$RANDOM_DESC$" "$BOOKMARKS_FILE" | cut -d: -f1)
    URL_LINE=$((LINE_NUM + 1))
    URL=$(sed -n "${URL_LINE}p" "$BOOKMARKS_FILE")
    echo "-> $RANDOM_DESC"
    echo "   $URL"
    ;;
  *)
    echo "Usage:"
    echo "  bm add <url>"
    echo "  bm get <search-term>"
    echo "  bm get-random"
    ;;
esac