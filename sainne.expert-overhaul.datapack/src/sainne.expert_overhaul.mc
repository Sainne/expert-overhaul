function load{
    # Add the scoreboard to track installation of the datapack
    scoreboard objectives add sainne.expert_overhaul.global dummy
    execute unless score installed sainne.expert_overhaul.global matches 1 run function sainne.expert_overhaul:.install
    tellraw @a {"text":"Sainne's Expert Overhaul has been reloaded!","color": "gold"}
}

function .install{
    # Create scoreboards
    scoreboard objectives add sainne.expert_overhaul.close_campfire dummy
    scoreboard objectives add sainne.expert_overhaul.slept minecraft.custom:minecraft.sleep_in_bed
    scoreboard objectives add sainne.expert_overhaul.dmgtaken minecraft.custom:minecraft.damage_taken
    # Default Gamerules
    gamerule naturalRegeneration false
    gamerule doInsomnia false
    # Default Settings
    scoreboard players set passive_regen sainne.expert_overhaul.global 1
    # Define the datapack as installed
    scoreboard players set installed sainne.expert_overhaul.global 1
    tellraw @a {"text":"Sainne's Expert Overhaul has been installed!","color": "gold"}
}

function .uninstall{
    # Delete the scoreboards
    scoreboard objectives remove sainne.expert_overhaul.global
    scoreboard objectives remove sainne.expert_overhaul.slept
    scoreboard objectives remove sainne.expert_overhaul.close_campfire
    scoreboard objectives remove sainne.expert_overhaul.dmgtaken
    # Gamerules back to vanilla
    gamerule naturalRegeneration true
    gamerule doInsomnia true
    tellraw @a {"text":"Sainne's Expert Overhaul has been uninstalled!","color": "gold"}
}

function .settings{
    tellraw @s {"text":"There is no config right now!","color": "gold"}
}
# self-explanatory time loop of 20 seconds
clock 20s{
    name scheduled/20s
    execute if score passive_regen sainne.expert_overhaul.global matches 1 as @a if predicate sainne.expert_overhaul:full_food run function sainne.expert_overhaul:players/passive_regen
}
# slow time loop
clock 5s{
    name scheduled/5s
    # campfire check 5 blocks
    execute as @a at @s store result score @s sainne.expert_overhaul.close_campfire run clone ~-5 ~-5 ~-5 ~5 ~5 ~5 ~-5 ~-5 ~-5 filtered minecraft:campfire force
    # soul campfire check 7 blocks
    execute as @a at @s if score @s sainne.expert_overhaul.close_campfire matches 0 store result score @s sainne.expert_overhaul.close_campfire run clone ~-7 ~-7 ~-7 ~7 ~7 ~7 ~-7 ~-7 ~-7 filtered minecraft:soul_campfire force
    # campfire regeneration
    execute as @a[scores={sainne.expert_overhaul.close_campfire=1..}] run function sainne.expert_overhaul:players/campfire_regen
}
# 2 second loop
clock 2s{
    execute as @a at @s if predicate sainne.expert_overhaul:equipped/elytra if predicate sainne.expert_overhaul:biome/in_nether unless entity @s[nbt={active_effects:[{id:"minecraft:fire_resistance"}]}] run function sainne.expert_overhaul:players/elytra_nerf/burn_damage
}
# half a second loop
clock 10t{
    execute as @a at @s if predicate sainne.expert_overhaul:inwater_elytra run damage @s 4 minecraft:drown at ~ ~ ~
    execute as @a at @s if predicate sainne.expert_overhaul:equipped/elytra if predicate sainne.expert_overhaul:biome/in_nether unless entity @s[nbt={active_effects:[{id:"minecraft:fire_resistance"}]}] run function sainne.expert_overhaul:players/elytra_nerf/burn_ambient
    execute as @a at @s unless predicate sainne.expert_overhaul:biome/no_rain if predicate sainne.expert_overhaul:equipped/elytra if predicate sainne.expert_overhaul:is_raining if predicate sainne.expert_overhaul:check_sky run damage @s 2 minecraft:drown
}
# quarter "real-time" loop, updated every 6 ticks to avoid over check and lag
clock 6t{
    name scheduled/6t
    execute as @a[scores={sainne.expert_overhaul.slept=1..}] run function sainne.expert_overhaul:players/slept_on_bed
    execute as @a run function sainne.expert_overhaul:players/armor_nerf
    execute as @a run function sainne.expert_overhaul:players/elytra_nerf/modify
}
# 2 ticks loop
clock 2t{
    name scheduled/2t
    # Lethal damages
    execute as @a if score @s sainne.expert_overhaul.dmgtaken matches 60..139 at @s run function sainne.expert_overhaul:players/lethal_damage/level1
    execute as @a if score @s sainne.expert_overhaul.dmgtaken matches 140..179 at @s run function sainne.expert_overhaul:players/lethal_damage/level2
    execute as @a if score @s sainne.expert_overhaul.dmgtaken matches 180.. at @s run function sainne.expert_overhaul:players/lethal_damage/level3
    # Reset damage taken
    scoreboard players set @a sainne.expert_overhaul.dmgtaken 0
}
# Functions that run as players.
dir players{
    # Regeneration function
    function passive_regen{
        effect give @s minecraft:regeneration 1 2 true
    }
    # Sleeping function
    function slept_on_bed{
        effect give @s minecraft:regeneration 5 2 true
        effect give @s minecraft:hunger 120 1 false
        effect give @s minecraft:slowness 120 0 false
        effect give @s minecraft:weakness 120 0 false
        scoreboard players set @s sainne.expert_overhaul.slept 0
    }
    # Campfire function
    function campfire_regen{
        effect give @s minecraft:regeneration 1 2 true
    }
    # This function replaces equipped vanilla armor with the slower armor
    function armor_nerf{
        # Iron armor nerf
        execute if predicate sainne.expert_overhaul:equipped/iron_helmet run item modify entity @s armor.head sainne.expert_overhaul:iron_helmet
        execute if predicate sainne.expert_overhaul:equipped/iron_chestplate run item modify entity @s armor.chest sainne.expert_overhaul:iron_chestplate
        execute if predicate sainne.expert_overhaul:equipped/iron_leggings run item modify entity @s armor.legs sainne.expert_overhaul:iron_leggings
        execute if predicate sainne.expert_overhaul:equipped/iron_boots run item modify entity @s armor.feet sainne.expert_overhaul:iron_boots
        # Diamond armor nerf
        execute if predicate sainne.expert_overhaul:equipped/diamond_helmet run item modify entity @s armor.head sainne.expert_overhaul:diamond_helmet
        execute if predicate sainne.expert_overhaul:equipped/diamond_chestplate run item modify entity @s armor.chest sainne.expert_overhaul:diamond_chestplate
        execute if predicate sainne.expert_overhaul:equipped/diamond_leggings run item modify entity @s armor.legs sainne.expert_overhaul:diamond_leggings
        execute if predicate sainne.expert_overhaul:equipped/diamond_boots run item modify entity @s armor.feet sainne.expert_overhaul:diamond_boots
        # Netherite armor nerf
        execute if predicate sainne.expert_overhaul:equipped/netherite_helmet run item modify entity @s armor.head sainne.expert_overhaul:netherite_helmet
        execute if predicate sainne.expert_overhaul:equipped/netherite_chestplate run item modify entity @s armor.chest sainne.expert_overhaul:netherite_chestplate
        execute if predicate sainne.expert_overhaul:equipped/netherite_leggings run item modify entity @s armor.legs sainne.expert_overhaul:netherite_leggings
        execute if predicate sainne.expert_overhaul:equipped/netherite_boots run item modify entity @s armor.feet sainne.expert_overhaul:netherite_boots
    }
    # Elytra nerf directory
    dir elytra_nerf{
        # This function replaces the default elytra with the nerfed one from the datapack
        function modify{
            execute if predicate sainne.expert_overhaul:equipped/elytra run item modify entity @s armor.chest sainne.expert_overhaul:elytra_nerf
        }
        # This function shows ambient particles when burning in the nether
        function burn_ambient{
            particle minecraft:flame ~ ~1 ~ 0.3 0.5 0.3 0 3 force
        }
        # This function damages with fire damage when in the nether
        function burn_damage{
            damage @s 2 minecraft:in_fire
            particle minecraft:flame ~ ~1 ~ 0.3 0.5 0.3 0 7 force
        }
    }
    # Lethal damage functions
    dir lethal_damage{
        # level 1 >6hp
        function level1{
            effect give @s minecraft:blindness 1 0 true
            playsound minecraft:entity.player.attack.crit player @a[distance=..32] ~ ~ ~ 1 1.5 1
            particle minecraft:block minecraft:redstone_block ~ ~0.5 ~ 0 0.5 0 0.5 100 force
        }
        # level 2 >10hp
        function level2{
            effect give @s minecraft:blindness 3 0 true
            effect give @s minecraft:darkness 3 0 true
            effect give @s minecraft:hunger 3 0 true
            playsound minecraft:entity.player.attack.crit player @a[distance=..32] ~ ~ ~ 1 .8 1
            particle minecraft:block minecraft:redstone_block ~ ~0.5 ~ 0 0.5 0 0.5 500 force
        }
        # level 3 >16hp
        function level3{
            effect give @s minecraft:slowness 15 0 true
            effect give @s minecraft:blindness 15 0 true
            effect give @s minecraft:darkness 15 0 true
            particle minecraft:block minecraft:redstone_block ~ ~0.5 ~ 0 0.5 0 1 600 force
            playsound minecraft:entity.player.attack.crit player @a[distance=..32] ~ ~ ~ 1 .6 1
        }
    }
    # Elytra nerfs
    dir elytra_punish{
        # When the elytra is equipped while in water or rain
        function elytra_in_water{
            say the water hurts!
        }
        # When the elytra is equipped while in the nether
        function elytra_in_nether{
            say im burning!
        }
    }
}