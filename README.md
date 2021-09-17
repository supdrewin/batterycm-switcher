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
### Some special features of this utility
- [x] supports running in tmpfs
- [x] secure environment for runtime
- [x] supports charging threshold _([optional](# "this feature also available for huawei users"))_
- [x] voice for mode switching _(optional: require espeak)_
- [x] function key to switch mode _(optional: require acpid)_
### Help to improve this utility
* Click [here](https://github.com/supdrewin/batterycm-switcher/issues) to report issues
* Click [here](https://github.com/supdrewin/batterycm-switcher/pulls) to pull requests
