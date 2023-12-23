#built using mc-build (https://github.com/mc-build/mc-build)

schedule function sainne.expert_overhaul:scheduled/2t 2t
execute as @a if score @s sainne.expert_overhaul.dmgtaken matches 60..139 at @s run function sainne.expert_overhaul:players/lethal_damage/level1
execute as @a if score @s sainne.expert_overhaul.dmgtaken matches 140..179 at @s run function sainne.expert_overhaul:players/lethal_damage/level2
execute as @a if score @s sainne.expert_overhaul.dmgtaken matches 180.. at @s run function sainne.expert_overhaul:players/lethal_damage/level3
scoreboard players set @a sainne.expert_overhaul.dmgtaken 0