#built using mc-build (https://github.com/mc-build/mc-build)

effect give @s minecraft:blindness 1 0 true
playsound minecraft:entity.player.attack.crit player @a[distance=..32] ~ ~ ~ 1 1.5 1
particle minecraft:block minecraft:redstone_block ~ ~0.5 ~ 0 0.5 0 0.5 100 force