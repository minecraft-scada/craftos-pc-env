# craftos-pc-env
Startup and initialization scripts for a CraftOS-PC testing environment.

## How To Use

### Cloning/Downloading
This repostiroy should be cloned/downloaded into the 
[computer directory](https://www.craftos-pc.cc/docs/saves) of your [CraftOS-PC](https://www.craftos-pc.cc/) installation. The IDs here will then correlate to computers with those IDs. If you already have computers using those IDs, you can either use different ones for this project or move your existing files.

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

## Layout
The following are the computers included by default, by ID (folder). When this repository is used as the root of the CraftOS-PC computers folder, these are used for the computers with those respective IDs.

Additional computers can of course be added, such as for additional RTU gateways or Reactor PLCs. That would be done by copying directory contents into another other computer's directory, excluding logs and settings.

| Computer  | Assignment |
| --- | --- |
| 0 | Supervisor |
| 1 | Coordinator |
| 2 | Pocket |
| 3 | Reactor PLC |
| 4 | RTU Gateway |
