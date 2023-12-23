#built using mc-build (https://github.com/mc-build/mc-build)

schedule function sainne.expert_overhaul:__generated__/clock/0 2s
execute as @a at @s if predicate sainne.expert_overhaul:equipped/elytra if predicate sainne.expert_overhaul:biome/in_nether unless entity @s[nbt={active_effects:[{id:"minecraft:fire_resistance"}]}] run function sainne.expert_overhaul:players/elytra_nerf/burn_damage