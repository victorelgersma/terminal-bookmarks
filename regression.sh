#!/bin/bash
# filepath: regression.sh

set -e

export BM_STORE="$(mktemp)"
trap 'rm -f "$BM_STORE"' EXIT

# Safety check: abort if BM_STORE points to a real bookmarks file
if [[ "$BM_STORE" == "$HOME/.bm_bookmarks.txt" ]]; then
  echo "❌ BM_STORE points to your real bookmarks file! Aborting test."
  exit 1
fi

echo "Testing add..."
./bm.sh add "https://example.com" -c "test bookmark"

echo "Testing get..."
if ./bm.sh get "example" | GREP_COLOR=never grep -q "example"; then
  echo "✅ Test passed: Bookmark found in get output"
else
  echo "❌ Test failed: Bookmark not found in get output"
  exit 1
fi

# Note: GREP_COLOR=never is used to avoid color codes in the grep output, because the assertion fails if the output contains color codes.