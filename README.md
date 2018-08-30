# Git - Work-in-progress

`bash.sh` contains 3 functions you can add to your `.bashrc`. The functions help lazy people create WIP (work-in-progress) commits, and remove them when something really needs to be commited.

## Functions

| Function | Arguments         | Descripiton                                                     |
|:--------:|:----------------- |:--------------------------------------------------------------- |
| `push`   | Arguments for git | Pushes to current branch                                        |
| `commit` | Message           | Commits, and squashes the last commit, if its message is "WIP"  |
| `wip`    | None              | Adds everything, commits, and pushes, with the message of "WIP" |

## Example

So you're working, and you're done for the day, then just type:

```bash
wip
```

Then the next day, you finalize your commit, then you type

```bash
commit "i'm done here"
push -f
```
