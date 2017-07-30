Pilcrow's The Ground Gives Way Launcher, release 2017.Jul.30
------------------------------------------------------------

I've been playing **The Ground Gives Way** myself in Linux, using the instructions from the section "Running TGGW on Other Systems" in the game's [official FAQ](http://www.thegroundgivesway.com/faq/), but apparently that won't work in certain systems with certain versions of Wine. So, since I know it works perfectly with the version of Wine I have on *my* system (version 2.7, built from unmodified source), I used [AppImage](http://appimage.org/) to package up the Wine files together with a simple run script into a hassle-free **The Ground Gives Way** launcher.

This launcher DOES NOT install anything extra to the user's computer (AppImage works by mounting itself as a virtual filesystem overlay, meaning it is sandboxed from all system-wide files), but does create a seperate wine prefix in `~/.wine-appimage` so as not to interfere with the default one in any way.

This launcher should work on pretty much any other relatively recent 64-bit (x86_64) GNU/Linux distro. To use it, simply place the `launcher` file into the same directory as `The Ground Gives Way.exe` and run the launcher file. It does not need to be run from a terminal (as it opens its own xterm window). Also accepts cli parameters to change the xterm launch options (such as giving it a bigger/smaller font, changing the background color, etc), a `--console` option for running the game in the current terminal rather than opening a new window, and a special `--debug` option that echoes the entire final command before running it. Requires xterm (unless using the `--console` option). Tested and working with both the Windows 10/8/7/Vista version of **The Ground Gives Way** and the XP SP3 one.