# ProjectOneRP Ped Menu

A FiveM resource that lets authorized players change their ped model and, when using a dog ped, play configured dog animations.

## Dependencies

- [ESX Legacy](https://github.com/esx-framework/esx_core), with the `es_extended` resource
- `fgs-notify`

Both dependencies must be installed and started before `fgs-pedsystem`.

## Installation

1. Copy `fgs-pedsystem` into your server resources directory.
2. Ensure the dependencies and this resource in your `server.cfg`, in this order:

   ```cfg
   ensure es_extended
   ensure fgs-notify
   ensure fgs-pedsystem
   ```

3. Configure permitted players and their available ped categories in `users.lua`.
4. Configure ped models, dog animations, and the optional key mapping in `config.lua`.
5. Restart the server or run `ensure fgs-pedsystem` in the server console.

## Usage

Authorized players can open the menu with `/pedmenu`. The default key mapping is `F11` and can be changed in the FiveM key bindings.

## Authorization

Add players to `ALLOWED_USERS` in `users.lua`. `PLAYER_IDENTIFIER` can be a player's `license:` or `steam:` identifier. Set `DOG` and `NPC` in `ALLOWED_PEDS` to control which categories they can use.
