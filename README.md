# Batterycm-Switcher
_an advanced Ideapad Laptops conservation mode adjustment tool_
### What is the **conservation mode**?
> Conservation mode is a battery protected mode in most Lenovo Ideapad Laptops. This mode work for disconnecting battery from your computer when AC power adapter is using. That mean battery overcharging can be avoid directly so that purging AC power adapter is unnecessary.
### How to setup batterycm-switcher?
- <details>
  <summary> Required dependencies for this utility </summary>

  - bash: for running shell script
  - coreutils: for basic commands
  - man-db: for man page support
  - polkit/policykit-1: for access sysfs
  - vim: for config editing support
  - git(make): for clone this repos
  - gzip(make): for package man page
  - make(make): for make this utility
  - xz/xz-utils(make): for harden library support
  - acpid(optional): for capture function key support
  - espeak(optional): for voice prompt support
  - systemd(optional): for system service support
</details>

- For ArchLinux users, the package `batterycm-switcher` is available from **AUR**.
  ``` shell
  git clone https://aur.archlinux.org/batterycm-switcher.git
  cd batterycm-switcher
  makepkg -csi
  ```
- For another distributions.
  - First install the required dependencies:
    - For Debian, some packages have different names:
      - `xz` is provided by `xz-utils`
      - `polkit` is provided by `polkit-1`.
    - For other distributions, you should correct it by yourself.
  - Than clone this repos and make it:
    ``` shell
    git clone https://github.com/supdrewin/batterycm-switcher.git
    cd batterycm-switcher
    make
    sudo make install
    ```
- For preview features, also see the branch `testing`.
### How to use batterycm-switcher?
After install this utility, type `batterycm-switcher help` to get more information for using batterycm-switcher.
``` roff
BATTERYCM-SWITCHER(1)                     User Commands                     BATTERYCM-SWITCHER(1)

NAME
       batterycm-switcher - an advanced Ideapad Laptops conservation mode adjustment tool

SYNOPSIS
       batterycm-switcher [ OPTION ]

DESCRIPTION
       This manual page documents briefly the batterycm-switcher command.
       Batterycm-Switcher  is  a useful commandline utility (CLI) to switch the conservation mode
       of Ideapad Laptops.  And it also provides series features to advanced users.

OPTIONS
       call   call the function  key  receive  backend,  this  require  `acpid`  and  'enable_re‐
              ceive_funkey'  =  1.   To enable show status using sound, it also needed to install
              `espeak` and change the config option 'enable_sound_prompt' = 1.

       config Use `config` to enter config editing, the editor used is vim, which most  powerful.
              You can special your own vimrc to use from the CUSTOMS section.

       debug  Use  `debug`  to view the log of batterycm-switcher, the default loging location is
              '/var/tmp/batterycm-switcher.log'.  You can change this location from config.  It's
              actually  depending  on  config  option 'batterycm_debug_level' != 0.  To enter the
              full debug mode, change the 'batterycm_debug_level' to 1.

       on / off
              Both optoins to turn on/off the battery conservation mode.

       auto / noauto
              Both options to enable/disable the Charging Threshold service, the default  thresh‐
              old  value  is 95%.  To custom the value, use `batterycm-switcher config` and go to
              the CUSTOMS section.

       enable / disable
              Both options to enable/disable the systemd service, which Batterycm-Switcher  Func‐
              tion  Key  Backend  Service.   An  backend service capture the function key opening
              Lenovo Vantage in Windows, the keycode depending on your hardware.

       help   This option will jump to show this man page, you can also do this:
              `man batterycm-switcher`, which function is same as help.

       status This option to show current status of conservation mode, it will return  a  message
              whether the mode on/off.

       version
              This  option  to  show  current version of batterycm-switcher, program name will be
              shown as the core module name of batterycm-switcher.

NOTES
       While no options special, batterycm will switch the conservation mode according to current
       mode.  If current mode is on, turning off, otherwise turning on.

       It's  necessary  to  know  that  `batterycm-charger.service`  is conflict with `batterycm-
       switcher.service` and other commands.  So I highly NOT recommend  use  both  at  the  same
       time.

       Don't  reporting  it as a bug if you don't have the `ideapad_laptop` driver.  Use `lsmod |
       grep ideapad_laptop` to have a try, no any reasons to directly uninstall this utility.

SEE ALSO
       batterycm-charger(1)

BUGS
       <https://github.com/supdrewin/batterycm-switcher/issues>

AUTHORS
       Supdrewin <https://github.com/supdrewin>

1.2.0                                       2021-08-28                      BATTERYCM-SWITCHER(1)
```

### Some special features of this utility
- [x] supports running in tmpfs
- [x] secure environment for runtime
- [x] supports charging threshold _([optional](# "this feature also available for huawei users"))_
- [x] voice for mode switching _(optional: require espeak)_
- [x] function key to switch mode _(optional: require acpid)_
### Help to improve this utility
* Click [here](https://github.com/supdrewin/batterycm-switcher/issues) to report issues
* Click [here](https://github.com/supdrewin/batterycm-switcher/pulls) to pull requests
