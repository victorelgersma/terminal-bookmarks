# Terminal Bookmarks

terminal bookmarks  - the last bookmarking app you'll need. 

## Requirements
- Bash (or zsh)
- grep (standard on Unix-like systems)

## Quick Start

```sh
git clone <repo-url>
cd bookmarks
./bm add "https://example.com" -c "example description"
./bm get "example"
```

## Installation

```sh
brew tap victorelgersma/terminal-bookmarks
brew install bm
```

## Interface

We expose  the commands bm add and get

the syntax of bm add is somewhat similar to git 

```sh
$ bm add 
Usage: bm add <url> -c <description>
```

```sh
$ bm add "https://www.theguardian.com/education/2025/may/24/children-with-special-needs-in-england-may-lose-legal-right-to-school-support" -c "guardian article which I need for x y z project"
✅ saved "https://www.theguardian.com/education/2025/may/24/children-with-special-needs-in-england-may-lose-legal-right-to-school-support" to data/bookmarks.txt
```

if passed without a c flag it will prompt you for a description

```sh 
$ bm add "your  url" 
$ enter descritption
my description here
```

```sh
$ bm get "altitude"
https://docs.thgaltitude.com/getting-started/ # deprecated altitude docs

https://github.com/THG-AltitudeSiteBuilds/ # thg altitude docs

http://platform.thgaltitude.com/api/auth/login?organization=org_4TqhCcWuZx2a7nHX # altitude platform - THG ingenuity org 

https://platform.thgaltitude.com/api/auth/login?organization=org_8K8E4aGjlodAAJXP # the other platform org
```

## editing bookmarks

If you really need to edit links or bookmarks you can manually run vim/bookmarks.txt to find the bookmarks you want

## Implementation 

### Adding

adding is done by appending the link and the description on one line to data/bookmarks.txt

A single entry might look like this:

```txt
// data/bookmarks
248:https://www.platform.thgaltitude.com/sites/clrhr6i130023mc01992vyajq/environments/single-tenanted # single tenancy env nutrition
```

### Retrieving

bm is powered by ripgrep and gets translated to rg -i under the hood 

##  Data Store
- a txt file. Not complicated

## Future work

- export as a brew package