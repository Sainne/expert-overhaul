#built using mc-build (https://github.com/mc-build/mc-build)

effect give @s minecraft:slowness 15 0 true
effect give @s minecraft:blindness 15 0 true
effect give @s minecraft:darkness 15 0 true
particle minecraft:block minecraft:redstone_block ~ ~0.5 ~ 0 0.5 0 1 600 force
playsound minecraft:entity.player.attack.crit player @a[distance=..32] ~ ~ ~ 1 .6 1