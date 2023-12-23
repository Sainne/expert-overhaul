#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard objectives add sainne.expert_overhaul.global dummy
execute unless score installed sainne.expert_overhaul.global matches 1 run function sainne.expert_overhaul:.install
tellraw @a {"text":"Sainne's Expert Overhaul has been reloaded!","color": "gold"}