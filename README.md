# zshenvWithGit
Setting up the zsh environment for the switch on Catalina to mirror my previous bash_profile (see here https://github.com/benrhine/bashConfigWithGit)

Customized zsh profile with automatic git branch names when in a git directory (this is native feature once you add oh-my-zsh). This includes config for oh-my-zsh and powerlevel10k themes as well as many helper functions for developers.

- reloadZsh
  - reload the zshrc after changes
- reloadBash
  - reload the bash profile after changes
- removeFromPath
  - I dont remember what this is for but I needed it at some point
- cleanlock
  - clean up gradle lock files | this has been a re-occuring issue on my work machine where gradle builds faile due to `.lock` files, this removes them
- cleanlockproject
  - clean up project lock files | this has been a re-occuring issue on my work machine where gradle creates lock files in the project and the build will fail, this will remove lock files that are in the project directory.
- cleanbuild
  - This will run the cleanlock task before running `./gradlew clean build`
- publish
  - This will run the cleanlock task before runnig `./gradlew clean build uploadArchives`
- listfunc
  - This will list the functions above so you can remember what is available
- cmdhelp
  - This will list common dev commands that I cant rememeber but need from time to time.


