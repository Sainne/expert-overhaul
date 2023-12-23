#built using mc-build (https://github.com/mc-build/mc-build)

effect give @s minecraft:blindness 3 0 true
effect give @s minecraft:darkness 3 0 true
effect give @s minecraft:hunger 3 0 true
playsound minecraft:entity.player.attack.crit player @a[distance=..32] ~ ~ ~ 1 .8 1
particle minecraft:block minecraft:redstone_block ~ ~0.5 ~ 0 0.5 0 0.5 500 force