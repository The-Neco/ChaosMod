# ChaosMod

ChaosMod is a recreation of the popular mod [Chaos Mod V](https://www.gta5-mods.com/scripts/chaos-mod-v-beta) by [pongo1231](https://github.com/pongo1231) for FiveM as a serverside resource. Now you you can have all the fun that the mod brings with your friends!

How Do I install ChaosMod on my server?
=

It's pretty simple

1. Download the latest ChaosMod from the [releases](https://github.com/The-Neco/ChaosMod/releases/latest) section of this repo.
2. Drag the `ChaosMod` folder to the resources folder in your server.
3. Add `ensure ChaosMod` to your `server.cfg`.
4. Start your server and enjoy!

Server Configuration
=
Configuration for this resource is mainly done via convars. 

A list of convars can be found below:

|        Convar       | Default Value |                 Description                  |  Server/Client  |
|:-------------------:|:-------------:|:--------------------------------------------:|:---------------:|
| chaosmod_eventtimer |    30000      |    Number of milliseconds between events.    |       Both      |
|   chaosmod_debug    |    false      | Toggles debug mode (enables console prints). |       Both      |

Example of adding a convar into your `server.cfg`
`setr chaosmod_eventtimer 60000`

# Bug reports/suggestions
If you find any bugs or have any sugestions to add to the resource please add them to the forum post on the fivem forums or submit a feature request using the [issues](https://github.com/The-Neco/ChaosMod/issues) section of github.

# Contributing
Have a feature you would like to add for yourself? Submit a PR and I'll take a look!
