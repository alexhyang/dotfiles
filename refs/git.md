# Git

This document contains Git notes.

Contents:

* [Questions](#questions)
* [Commands](#commands)
* [Tasks](#tasks)
* [References](#references)

## Questions
*   How does Git bash work on Windows? Why do Vim plugins work on bash (unix) but not gVim (dos)?

## Commands
1.  Initial settings
    ```bash
    git config --global user.name "Your name"
    git config --global user.email "youremail@example.com"
    git config --global init.defaultBranch main
    ```

1.  Basics
    ```bash
    git help
    git init
    git add <filename>
    git commit
    git status
    git log
    git diff
    git checkout
    ```

1.  Branching
    ```bash
    git branch    # see all local branches
                  # -r: see remote branches
                  # -a: see all branches (both local and remote)
    git merge
    git rebase
    ```

1.  Remotes
    ```bash
    git remote
    git remote add <name> <url>
    git push <remote> <local_branch>:<remote_branch>
    git branch --set-upstream-to=<remote>/<remote_branch>
    git fetch
    git pull
    git clone
    ```

1.  Undo
    ```bash
    git commit --amend     # edit last commit's message
    git reset HEAD <file>  # unstage a file
    git checkout -- <file> # discard changes
    ```

## Tasks
```bash
git ls-files <path> |\
rg <pattern> | xargs git add               # git add by pattern
git mv                                     # same as git add <new_name>; git rm <old_name>
git show <hash>                            # show details of one commit
git rm <file>                              # stage file for deletion
git rm --cached <file>                     # stage file for deletion but keep it in file system, i.e. untracked state
git rm -r --cached .                       # remove files from staging area but keep them in working directory
                                           # used to update .gitignore file aftering changing it
git log -n 10                              # show the latest 10 commits
git reset                                  # undo last commit
                                           # --soft: uncommit changes, but keep them staged (repo --> staging area)
                                           # --mixed(default): uncommit & unstage changes (repo --> working tree)
                                           # --hard: uncommit & trash changes (repo --> trash can)

# Stash
git stash                                  # stash current changes
git stash list                             # list the stashes
git stash show                             # show the files in the most recent stash
git stash show -p                          # show the changes in the most recent stash
git stash apply                            # apply stash (show changes in current index)
git stach drop                             # delete stash (remove stash "commits")

# Patches
git log -p -- <file>                      # show history of a specific file
git add -p <file>                         # commit changes in a file by patches
                                          # y/n -- stage / do not stage this hunk
                                          # a/d -- stage / do not stage this hunk and any remaining hunks
                                          # s   -- split the current hunk into smaller hunks
                                          # ?   -- print help

# Differences
git diff --diff-filter=D                  # check diff for removed files in Git

# Update remotes and branches
git push -u origin <local_branch>         # publish local branch to remote repo
git branch --unset-upstream               # remove remote-tracking branch that no longer exists
git fetch -p                              # remove any remote branches that don't exist anymore
git prune                                 # clean up old branches
git remote set-url origin <url>           # update remote repo url
git push <remote> <commit hash>:<branch>  # push up to a certain commit

# Pull remote branch into a local branch with a different name
git fetch <remote_repo>
git checkout -b <local_branch> <remote_repo>/<branch_name>

# Rename branches
git branch -m <new_local_branch>          # rename local branch
git push origin -u <new_remote_branch>;
git push origin -d <old_remote_branch>    # rename remote branch

# Delete branches
git push origin -d <remote_branch>        # delete remote branch
git branch -d <local_branch>              # delete local branch

# Update branch pointer without checkout
git branch -f <branch-name> <commit-hash> # update branch pointer
git update-ref refs/heads/<branch-name> <commit-hash> -m "<reflog-message>"
                                          # update branch pointer with reflog message

# Remove Sensitive Data from repository
git filter-repo --invert-paths --path <path-to-file>
echo <path-to-file> >> .gitignore
git add .gitignore
git commit -m "add file to .gitignore"
git remote add origin <remote-repo-url>
git push origin --force --all

# Find commit using binary search
git bisect start             # start the search
git bisect bad               # choose a known bad commit as the beginning
git bisect good              # choose a known good commit as the end
# git will guide you to the commit in the middle, and you need to tell git
#     if it's a good or bad commit
git bisect reset             # end the search

# Tagging
git tag                                    # show all tags
git tag -n2                                # show 2-line message of tags
git tag <tag-name>                         # create a lightweight tag
git tag -a <tag-name> -m <tag-message>     # create an annotated tag
git tag -d <tag-name>                      # delete tag
git push origin <tag-name>                 # publish tag to remote repo
git push origin --tags                     # publish multiples tags
git push origin --delete <tagname>         # remove remote tag

# Git ssh
git config core.sshCommand "ssh -i <path-to-private-key>"
                                           # use specific ssh key for git tasks
```

## References
*   [Missing Semester MIT - Verions Control (Git)](https://missing.csail.mit.edu/2020/version-control/)
*   [Git Official References](https://git-scm.com/docs)
*   [Remove sensitive data from GitHub repository - GitHub](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository#using-git-filter-repo)
