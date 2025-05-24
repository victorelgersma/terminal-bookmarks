
# Interface
```sh
$ bm-add "your-url-here" -c "your description here"
✅ wrote "your url-here # your description here" to ~/dev/bookmarks.dm
$ 
```

```sh
$ bm-add 
Nothing written, nothing added
Usage: bm-add <url> -c <description>
```

or 

```sh 
$ bm add "your  url" 
$ enter descritption
my description here
```

```sh
$ bm-find "search string"
bookmarks.md
116:## Documentation
223:https://1e33909e.thgaltitude.com/platform-documentation/overview/
247:https://diataxis.fr/ # documentationipgrp - output
```

```
# Data Store
- a single md file 

# Implementation / dependencies

## addition
- echo
- normal shell tools

## retrieval
- ripgrep
