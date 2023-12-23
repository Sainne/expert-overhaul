#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard objectives add sainne.expert_overhaul.close_campfire dummy
scoreboard objectives add sainne.expert_overhaul.slept minecraft.custom:minecraft.sleep_in_bed
scoreboard objectives add sainne.expert_overhaul.dmgtaken minecraft.custom:minecraft.damage_taken
gamerule naturalRegeneration false
gamerule doInsomnia false
scoreboard players set passive_regen sainne.expert_overhaul.global 1
scoreboard players set installed sainne.expert_overhaul.global 1
tellraw @a {"text":"Sainne's Expert Overhaul has been installed!","color": "gold"}