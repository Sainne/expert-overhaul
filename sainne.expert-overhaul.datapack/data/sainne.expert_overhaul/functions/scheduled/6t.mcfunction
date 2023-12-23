#built using mc-build (https://github.com/mc-build/mc-build)

schedule function sainne.expert_overhaul:scheduled/6t 6t
execute as @a[scores={sainne.expert_overhaul.slept=1..}] run function sainne.expert_overhaul:players/slept_on_bed
execute as @a run function sainne.expert_overhaul:players/armor_nerf
execute as @a run function sainne.expert_overhaul:players/elytra_nerf/modify