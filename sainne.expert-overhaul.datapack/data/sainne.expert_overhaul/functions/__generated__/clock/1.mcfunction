#built using mc-build (https://github.com/mc-build/mc-build)

schedule function sainne.expert_overhaul:__generated__/clock/1 10t
execute as @a at @s if predicate sainne.expert_overhaul:inwater_elytra run damage @s 4 minecraft:drown at ~ ~ ~
execute as @a at @s if predicate sainne.expert_overhaul:equipped/elytra if predicate sainne.expert_overhaul:biome/in_nether unless entity @s[nbt={active_effects:[{id:"minecraft:fire_resistance"}]}] run function sainne.expert_overhaul:players/elytra_nerf/burn_ambient
execute as @a at @s unless predicate sainne.expert_overhaul:biome/no_rain if predicate sainne.expert_overhaul:equipped/elytra if predicate sainne.expert_overhaul:is_raining if predicate sainne.expert_overhaul:check_sky run damage @s 2 minecraft:drown