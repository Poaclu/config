To list users currently logged on the system, the _who_ command can be used. To list all existing user accounts including their properties stored in the [user database](https://wiki.archlinux.org/title/users_and_groups#User_database), run `passwd -Sa` as root. See [passwd(1)](https://man.archlinux.org/man/passwd.1) for the description of the output format.

To add a new user, use the _useradd_ command:

```bash
useradd -m -g users -G _additional_groups_ -s _login_shell_ _username_
```

For me :
```
useradd -m -g users -G power,storage,wheel,input -s /bin/zsh poaclu
```

`-m`/`--create-home`

the user's home directory is created as `/home/_username_`. The directory is populated by the files in the skeleton directory. The created files are owned by the new user.

`-g`/`--gid`

name or ID of the primary gourp of the new account

`-G`/`--groups`

a comma separated list of supplementary groups which the user is also a member of. The default is for the user to belong only to the initial group.

`-s`/`--shell`

a path to the user's login shell. Ensure the chosen shell is installed if choosing something other than [Bash](https://wiki.archlinux.org/title/Bash "Bash"). The default shell for newly created user can be set in `/etc/default/useradd`.

Add user to group :
```
usermod -a -G groupname username
```
