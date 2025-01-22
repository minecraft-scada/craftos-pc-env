# craftos-pc-env
Startup and initialization scripts for a CraftOS-PC testing environment.

## How To Use

### Setup
Run `init.py` and provide the absolute path to the git clone of [cc-mek-scada](https://github.com/MikaylaFischler/cc-mek-scada). This will create a path file for **every** currently existing computer so mounts can be determined automatically. If you only wish to generate this for some of your computers, set the values in the `computer_dirs` value in the script:

```python
computer_dirs = [ '0' ,'1', '2' ]
```

### Usage
A modified version of the `cc-mek-scada` 'bootloader' startup.lua application is present on the computers. This will automatically launch the respective `init.lua` file (different name for each type of device) if it determines it hasn't yet been ran. If it doesn't auto-launch, or you want to re-run it, you would run that file from the computer.

From then on, the computer can be used just like one with that application installed in-game for testing purposes.

> [!IMPORTANT]
> The init will need to be completed before using `configure.lua`.
