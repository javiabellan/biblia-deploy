## iTerm2




### Mouse integration

Preferences > Profiles > Terminal > Enable mouse reporting.





### Display images `imgcat`

```bash
wget https://iterm2.com/utilities/imgcat ; chmod 755 imgcat`
```

Ranger + imgcat


### [Shell Integration](https://iterm2.com/documentation-shell-integration.html)


```bash
curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
source ~/.iterm2_shell_integration.zsh # Add this line at ~/.zshrc 


# If hostname command not found install https://www.gnu.org/software/inetutils/
sudo pacman -S inetutils
```

Download files from remote hosts with a click.
You can right click on a filename (e.g., in the output of ls) to download it.

Drag-drop files to upload with scp.
Hold down option and drag-drop a file from Finder into iTerm2 to upload it.





### Lateral space margings:

`Preferences` -> `Appearance` -> `Pane` -> Side margins and Top & bottom margins settings

https://superuser.com/questions/1760907/iterm2-is-it-possible-to-save-different-margin-settings-when-in-full-screen-mod