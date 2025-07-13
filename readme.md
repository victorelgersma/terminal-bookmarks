# Terminal Bookmarks

A text-only, CLI-based bookmark manager.

<img src="./bm-demo.gif" alt="Terminal Bookmarks Demo" width="100%" />

## Quickstart

```sh
brew tap victorelgersma/terminal-bookmarks
brew install bm
```

## Adding your first bookmark

```sh
$ bm add https://www.google.com
Enter descritption: Google
$ ✅ saved "https://www.google.com" to /Users/victor.elgersma41/.bm/bookmarks.txt
```

## Get a random bookmark

```sh
$ bm get-random
-> https://histography.io/ # crazy history timelines
```

## Editing bookmarks

To manually edit your bookmarks, open the store file in your editor:

```sh
vim "${BM_STORE:-$HOME/.bm/bookmarks.txt}"
```

## Customizing the Data Store Location

By default, `bm` stores your bookmarks in `~/.bm/bookmarks.txt`.  
If you want to use a different file or location, you can override this by setting the `BM_STORE` environment variable:

```sh
export BM_STORE=~/my_custom_bookmarks.txt
```

After setting this variable, all `bm` commands will read from and write to your chosen file.  
This is useful if you want to sync your bookmarks file with cloud storage, use a project-specific store, or keep multiple sets of bookmarks.

## Future work

## Issues

Now that it's a package rather than a repo, it's much harder to edit my bookmarks store. I can think of a few solutions

1. find the place where bookmarks are kept and just use that - issue with this is that it might not be consistent between homebrew installs - but surely that's a YAGNI
2. elaborate data portability work (see above) - maybe that's too complicated though

- currently when I create a new release I need to manually adjust the homebrew-terminal-bookmarks repo to publish.

## Local Development

To work on `bm` locally (without Homebrew):

1. **Clone the repository:**

   ```sh
   git clone https://github.com/victorelgersma/terminal-bookmarks.git
   cd terminal-bookmarks
   ```

2. **Make the script executable:**

   ```sh
   chmod +x bm.sh
   ```

3. **Run the script directly:**

   ```sh
   ./bm.sh add "https://example.com" -c "example description"
   ./bm.sh get "example"
   ```

**Note:**  
By default, bookmark location is `BM_STORE`, which by default is at `~/.bm/bookmarks.txt` unless you override it.
