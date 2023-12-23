#built using mc-build (https://github.com/mc-build/mc-build)

schedule function sainne.expert_overhaul:scheduled/5s 5s
execute as @a at @s store result score @s sainne.expert_overhaul.close_campfire run clone ~-5 ~-5 ~-5 ~5 ~5 ~5 ~-5 ~-5 ~-5 filtered minecraft:campfire force
execute as @a at @s if score @s sainne.expert_overhaul.close_campfire matches 0 store result score @s sainne.expert_overhaul.close_campfire run clone ~-7 ~-7 ~-7 ~7 ~7 ~7 ~-7 ~-7 ~-7 filtered minecraft:soul_campfire force
execute as @a[scores={sainne.expert_overhaul.close_campfire=1..}] run function sainne.expert_overhaul:players/campfire_regen