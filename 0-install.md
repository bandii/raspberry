1. **Desktop** Prepare the SD card with a 64 bit image burn by the [Raspberry PI Manager](https://www.raspberrypi.com/software/) \
_Choose a fast and big-enough SD Card!_
2. Enable SSH either via the Image Manager, or the Preferences / Raspberry PI Configuration
3. **Desktop** Set up SSH
   1. Install the [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701), if you do not have it already
   2. Click on the arrow down icon, then go to the settings
   3. Add a new Profile for the SSH to your Raspberry
   4. Command line should be ssh {userName}@{ip of your raspberry}
   5. With the plus icon of the Terminal, open the new profile, what should start the SSH
4. **Raspberry** Update the necessary packages. _Raspberry will notify you in case you chose the Desktop version_ \
```sudo apt-get update```
5. **Raspberry** Disable Boot to Desktop via the Preferences \ Raspberry PI Configuration \
..or **Desktop** Disable boot to Desktop via cli:
   1. Run sudo raspi-config. 
   2. Select System Options.
   3. Choose Boot/Auto Login.
   4. Select Desktop or Desktop Autologin depending on preference.
   5. Select Finish, then Reboot when prompted.

