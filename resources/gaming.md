- [Lutris](#lutris)
  - [Dependencies](#dependencies)
    - [Driver](#driver)
    - [Wine](#wine)


# Lutris
## Dependencies
### Driver
https://github.com/lutris/docs/blob/master/InstallingDrivers.md

> sudo add-apt-repository ppa:kisak/kisak-mesa && sudo dpkg --add-architecture i386 && sudo apt update && sudo apt upgrade && sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386

### Wine
https://github.com/lutris/docs/blob/master/WineDependencies.md

> sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386