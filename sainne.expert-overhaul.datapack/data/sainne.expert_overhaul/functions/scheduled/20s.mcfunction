#built using mc-build (https://github.com/mc-build/mc-build)

schedule function sainne.expert_overhaul:scheduled/20s 20s
execute if score passive_regen sainne.expert_overhaul.global matches 1 as @a if predicate sainne.expert_overhaul:full_food run function sainne.expert_overhaul:players/passive_regen