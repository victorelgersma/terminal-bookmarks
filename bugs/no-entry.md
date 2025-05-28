# Adding nothing is allows

This is a papercut bug, but it's nice to fix. 
currently I can do this:

```sh
$ bm add 
Enter description: asd
✅ saved "" to /Users/victor.elgersma41/.bm_bookmarks.txt
```

when I run `bm add` without an argument, this allows me to save the following to .bm_bookmarks.txt:

```txt
/ ~/.bm_bookmarks.txt

# asd
```

## Proposed solution:
```sh
$ bm add 
😳 you forgot to enter a bookmark, please try again. 
```

## Gameplan

- [x] write code
- [ ] test code
- [ ] merge to main
- [ ] make a new release
- [ ] test new release
