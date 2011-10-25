﻿-- Demented Druid Spirit SAI
SET @ENTRY   := 15260; -- NPC entry
SET @SPELL1  := 6726;  -- Silence
SET @SPELL2  := 16247; -- Curse of Thorns
SET @SPELL3  := 21669; -- Moonfire
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY; -- Set SAI as AI. Remove cpp ScriptName if one exist
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI if exist
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2500,2500,10000,15000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Demented Druid Spirit - Combat - Cast Silence on victim'),
(@ENTRY,0,1,0,0,0,100,0,15000,15000,15000,20000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Demented Druid Spirit - Combat - Cast Curse of Thorns on victim'),
(@ENTRY,0,2,0,0,0,100,0,10000,10000,15000,20000,11,@SPELL3,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Demented Druid Spirit - Combat - Cast Moonfire on victim');

-- Shade of Taerar SAI
SET @ENTRY   := 15302; -- NPC entry
SET @SPELL1  := 24840; -- Poison Cloud
SET @SPELL2  := 20667; -- Corrosive Acid Breath
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY; -- Set SAI as AI. Remove cpp ScriptName if one exist
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI if exist
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,12000,12000,10000,14000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Shade of Taerar - Combat - Cast Poison Cloud on victim'),
(@ENTRY,0,1,0,0,0,100,0,30000,30000,25000,30000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Shade of Taerar - Combat - Cast Corrosive Acid Breath on victim');

UPDATE `spell_dbc` SET `AttributesEx3`=0x00020000 WHERE `Id`=25042;

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_mark_of_nature';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(25042, 'spell_mark_of_nature');

-- Add condition for Item 38731 "Ahunae's Knife" to target 28600 "Dead Heb'Drakkar Headhunter"
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry`=38731;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,0,38731,0,24,2,28600,0,63,'','Item 38731 "Ahunae''s Knife" targets 28600 "Dead Heb''Drakkar Headhunter');

DELETE FROM `spell_script_names` WHERE `spell_id`=52090;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES 
(52090, 'spell_q12659_ahunaes_knife');

-- Fix faction of Sand Trap
UPDATE `gameobject_template` SET `faction`=14 WHERE `entry`=180647;

-- Demented Druid Spirit SAI
SET @ENTRY   := 15260; -- NPC entry
SET @SPELL1  := 6726;  -- Silence
SET @SPELL2  := 16247; -- Curse of Thorns
SET @SPELL3  := 21669; -- Moonfire
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY; -- Set SAI as AI. Remove cpp ScriptName if one exist
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI if exist
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,15000,15000,15000,20000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Demented Druid Spirit - Combat - Cast Silence on victim'),
(@ENTRY,0,1,0,0,0,100,0,10000,10000,15000,20000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Demented Druid Spirit - Combat - Cast Curse of Thorns on victim'),
(@ENTRY,0,2,0,0,0,100,0,2500,2500,10000,15000,11,@SPELL3,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Demented Druid Spirit - Combat - Cast Moonfire on victim');

-- Shade of Taerar SAI
SET @ENTRY   := 15302; -- NPC entry
SET @SPELL1  := 20667; -- Corrosive Acid Breath
SET @SPELL2  := 24840; -- Poison Cloud
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@ENTRY; -- Set SAI as AI. Remove cpp ScriptName if one exist
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI if exist
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,0,0,100,0,12000,12000,10000,14000,11,@SPELL1,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Shade of Taerar - Combat - Cast Corrosive Acid Breath on victim'),
(@ENTRY,0,0,0,0,0,100,0,30000,30000,25000,30000,11,@SPELL2,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Shade of Taerar - Combat - Cast Poison Cloud on victim');

UPDATE `creature_template` set `VehicleId` = 129 WHERE `entry` = 28710;
UPDATE `creature_template` set `npcflag`=`npcflag`|0x1000000 WHERE `entry` IN (28710,29838,33114,33167,34161);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (28710,29838,33114,33167,34161);
INSERT INTO `npc_spellclick_spells` VALUES
(28710,46598,0,0,0,1,0,0,0),
(29838,46598,0,0,0,1,0,0,0),
(33114,46598,0,0,0,1,0,0,0),
(33167,46598,0,0,0,1,0,0,0),
(34161,46598,0,0,0,1,0,0,0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` = 29838;
INSERT INTO `vehicle_template_accessory` VALUES
(29838,29836,0,0,'Drakkari Battle Rider on Drakkari Rhino, not minion',6,30000);

DELETE FROM `creature` WHERE `id` = 29836;

-- Remove destroyed flag from Storm Beacons in Ulduar
UPDATE `gameobject_template` SET `flags`=`flags`&~1024 WHERE `entry` IN (194398,194399,194400,194401,194402,194403,194404,194405,194406,194407,194408,194409,194410,194411,194412,194413,194414,194415,194506);

UPDATE `creature_template` set `VehicleId` = 273 WHERE `entry` = 31406;
UPDATE `creature_template` set `VehicleId` = 274 WHERE `entry` = 31408;
UPDATE `creature_template` set `VehicleId` = 277 WHERE `entry` = 31407;
UPDATE `creature_template` set `VehicleId` = 278 WHERE `entry` = 31409;
UPDATE `creature_template` set `VehicleId` = 301 WHERE `entry` = 32344;
UPDATE `creature_template` set `npcflag`=`npcflag`|0x1000000 WHERE `entry` IN
(25762,27131,31110,31137,31157,31262,31406,31407,31408,31409,32490,31583,31830,31881,31884,32225,32227,32292,32344,37968);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN
(25762,27131,31110,31137,31157,31262,31406,31407,31408,31409,32490,31583,31830,31881,31884,32225,32227,32292,32344,37968);
INSERT INTO `npc_spellclick_spells` VALUES
(25762,43671,0,0,0,1,0,0,0),
(27131,48754,0,0,0,1,0,0,0),
(31110,46598,0,0,0,1,0,0,0), -- maybe missed quest data
(31137,46598,0,0,0,1,0,0,0),
(31157,46598,0,0,0,1,0,0,0),
(31262,46598,0,0,0,1,0,0,0),
(31406,46598,0,0,0,1,0,0,0),
(31407,46598,0,0,0,1,0,0,0),
(31408,46598,0,0,0,1,0,0,0),
(31409,46598,0,0,0,1,0,0,0),
(32490,46598,0,0,0,1,0,0,0),
(31583,59319,0,0,0,1,0,0,0),
-- (31583,46598,0,0,0,1,0,0,0), -- should be casted if creature interacts, not implemented yet
(31830,46598,0,0,0,1,0,0,0),
(31881,46598,0,0,0,1,0,0,0),
(31884,46598,0,0,0,1,0,0,0),
(32225,46598,0,0,0,1,0,0,0),
(32227,46598,0,0,0,1,0,0,0),
(32292,46598,0,0,0,1,0,0,0),
(32344,46598,0,0,0,1,0,0,0),
(37968,46598,0,0,0,1,0,0,0);

DELETE FROM `vehicle_template_accessory` WHERE `entry` IN
(29931,31262,31406,31583,31881,31884,32225,32227,32490,32344);
INSERT INTO `vehicle_template_accessory` VALUES
(29931,29982,0,0,'Drakkari Rider on Drakkari Rhino',6,300),
(29931,29982,1,0,'Drakkari Rider on Drakkari Rhino',6,300),
(29931,29982,2,0,'Drakkari Rider on Drakkari Rhino',6,300),
(31262,31263,0,0,'Carrion Hunter rides Blight Falconer',6,300),
(31406,31408,0,1,'Alliance Bomber Seat on Alliance Infra-green Bomber',8,0),
(31406,31407,1,1,'Alliance Turret Seat on Alliance Infra-green Bomber',8,0),
(31406,31409,2,1,'Alliance Engineering Seat on rides Alliance Infra-green Bomber',8,0),
(31406,32217,3,1,'Banner Bunny, Hanging, Alliance on Alliance Infra-green Bomber',8,0),
(31406,32221,4,1,'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber',8,0),
(31406,32221,5,1,'Banner Bunny, Side, Alliance on Alliance Infra-green Bomber',8,0),
(31406,32256,6,1,'Shield Visual Loc Bunny on Alliance Infra-green Bomber',8,0),
(31406,32274,7,0,'Alliance Bomber Pilot rides Alliance Infra-green Bomber',6,300),
(31583,31630,1,1,'Skytalon Explosion Bunny on Frostbrood Skytalon',8,0),
(31881,31891,0,0,'Kor''kron Transport Pilot rides Kor''kron Troop Transport',6,300),
(31881,31884,1,1,'Kor''kron Suppression Turret on Kor''kron Troop Transport',8,0),
(31881,31882,2,0,'Kor''kron Infiltrator on Kor''kron Troop Transport',6,300),
(31881,31882,3,0,'Kor''kron Infiltrator on Kor''kron Troop Transport',6,300),
(31881,31882,4,0,'Kor''kron Infiltrator on Kor''kron Troop Transport',6,300),
(31881,31882,5,0,'Kor''kron Infiltrator on Kor''kron Troop Transport',6,300),
(31884,31882,0,1,'Kor''kron Infiltrator rides Kor''kron Suppression Turret',8,0),
(32225,32223,0,0,'Skybreaker Transport Pilot rides Skybreaker Troop Transport',6,300),
(32225,32227,1,1,'Skybreaker Suppression Turret on Skybreaker Troop Transport',8,0),
(32225,32222,2,0,'Skybreaker Infiltrator on Skybreaker Troop Transport',6,300),
(32225,32222,3,0,'Skybreaker Infiltrator on Skybreaker Troop Transport',6,300),
(32225,32222,4,0,'Skybreaker Infiltrator on Skybreaker Troop Transport',6,300),
(32225,32222,5,0,'Skybreaker Infiltrator on Skybreaker Troop Transport',6,300),
(32227,32222,0,1,'Skybreaker Infiltrator rides Skybreaker Suppression Turret',6,300),
(32490,32486,0,0,'Scourge Death Knight rides Scourge Deathcharger',6,300),
(32344,32274,0,0,'Alliance Bomber Pilot rides Alliance Rescue Craft',6,300),
(32344,32531,2,1,'Banner Bunny, Side, Alliance, Small rides Alliance Rescue Craft',8,0);

DELETE FROM `creature` where `id` IN (31408,31407,31409,32217,32221,32256,32274,31630,31891,31884,31882,32223,32227,32222,32486,32531);
DELETE FROM `creature` where `guid` IN (121310,121302,121301,121277,121304,121312,121303,121305,121311,121306,121308) and `id` = 31263;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 34793;
INSERT INTO `npc_spellclick_spells` VALUES
(34793,66245,0,0,0,1,0,0,0);

UPDATE `creature_template` set `VehicleId` = 436 WHERE `entry` = 36355;
UPDATE `creature_template` set `npcflag`=`npcflag`|0x1000000 WHERE `entry` IN (36355,36356);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (36355,36356);
INSERT INTO `npc_spellclick_spells` VALUES
(36355,66245,0,0,0,1,0,0,0),
(36356,66245,0,0,0,1,0,0,0);

-- Change spell script name for Attuned To Nature Dose Reduction
UPDATE `spell_script_names` SET `ScriptName`='spell_freya_attuned_to_nature_dose_reduction' WHERE `ScriptName`='spell_attuned_to_nature_dose_reduction';

-- removing some garbage
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 31583 AND `spell_id`=46598;

-- fix DB errors recently inroduced
UPDATE `creature_template` set `VehicleId` = 201 WHERE `entry` = 30935;
UPDATE `creature_template` set `VehicleId` = 397 WHERE `entry` = 34162;
UPDATE `creature_template` set `npcflag`=`npcflag`|0x1000000 WHERE `entry` IN (30935,34162);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (30935,34162);
INSERT INTO `npc_spellclick_spells` VALUES
(30935,46598,0,0,0,1,0,0,0),
(34162,46598,0,0,0,1,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` IN
(121277,122957,123103,123108,124444,124619,124620,124621,127107,127108,127109,133430,133431,133432,133433,133436,133437);
DELETE FROM `linked_respawn` WHERE `guid` IN (127108,127109);

-- Fix Creature Loot of Rare Elite Mobs in Northrend
UPDATE `creature_template` SET `lootid`=`entry` WHERE `entry` IN (32357,32358,32361,32400,32409,32417,32517,32485,32481,32377,32386,32398,32422,32429,32438,38453,32447,32471,32475,33776,32630,32500,32491,35189,32501,32495,32487);
-- Loot
DELETE FROM `creature_loot_template` WHERE `entry` IN (32357,32358,32361,32400,32409,32417,32517,32485,32481,32377,32386,32398,32422,32429,32438,38453,32447,32471,32475,33776,32630,32500,32491,35189,32501,32495,32487);
INSERT INTO `creature_loot_template`
 (`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`)
 VALUES
-- Old Crystalbark
(32357,44649,100,1,0,1,1), -- Crystalbark's Toenail
(32357,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Fumblub Gearwind
(32358,44666,100,1,0,1,1), -- Fumblub's Seat Cushion
(32358,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Icehorn
(32361,44667,100,1,0,1,1), -- Mammoth-Hair Crown
(32361,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Tukemuth
(32400,44673,100,1,0,1,1), -- Mammoth-Riding Boots
(32400,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
(32400,42104,-33,1,0,1,1), -- QUEST: Northern Ivory
-- Crazed Indu'le Survivor
(32409,44672,100,1,0,1,1), -- Seal-Fur Spaulders
(32409,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Scarlet Highlord Daion
(32417,44671,100,1,0,1,1), -- Highlord's Padded Legguards
(32417,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Loque'nahak
(32517,44688,75,1,1,1,1), -- Loque'Nahak's Severed Fang (GROUP 1)
(32517,44687,25,1,1,1,1), -- Loque'Nahak's Pelt(GROUP 1)
(32517,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- King Krush
(32485,44683,100,1,0,1,1), -- King's Eyesocket
(32485,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Aotona
(32481,44691,100,1,0,1,1), -- Aotona's Collar
(32481,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Perobas the Bloodthirster
(32377,44669,100,1,0,1,1), -- Worgen-Scored Shackles
(32377,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Vigdis die Kriegsmaid
(32386,44670,100,1,0,1,1), -- Soul-Sealed Belt
(32386,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- King Ping
(32398,44668,100,1,0,1,1), -- Egg-Warming Blanket
(32398,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Grocklar
(32422,44675,100,1,0,1,1), -- Rock-Giant's Pinky Cover
(32422,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Seething Hate
(32429,44674,100,1,0,1,1), -- Ichor-Stained Wraps
(32429,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Syreian the Bonecarver
(32438,44676,100,1,0,1,1), -- Syreian's Leggings
(32438,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Arcturis
(38453,51958,100,1,0,1,1), -- Pristine Glowbear Pelt
(38453,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Zul'drak Sentinel
(32447,44677,100,1,0,1,1), -- Eternal Observer's Legplates
(32447,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Griegen
(32471,44686,100,1,0,1,1), -- Ethereal Terror Handwraps
(32471,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Terror Spinner
(32475,44685,100,1,0,1,1), -- Calcified Web Spaulders
(32475,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Gondria
(33776,46324,100,1,0,1,1), -- Gondria's Spectral Claw
(33776,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Vyragosa
(32630,44732,100,1,0,1,1), -- Azure Dragonleather Helm
(32630,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Dirkee
(32500,44681,85,1,1,1,1), -- Titanium Brain-Gear (GROUP 1)
(32500,44708,15,1,1,1,1), -- Dirkee's Superstructure (GROUP 1)
(32500,44663,100,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Time-Lost Proto Drake
(32491,44682,99,1,0,1,1), -- Time-Forward Talisman
(32491,44168,99,1,0,1,1), -- Reins of the Time-Lost Proto-Drake
(32491,44663,99,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Skoll
(35189,49227,98,1,0,1,1), -- Skoll's Fang
(35189,44663,99,1,0,1,1), -- Abandoned Adventurer's Satchel
-- High Thane Jorfus
(32501,44695,99,1,0,1,1), -- Corroded Faceguard
(32501,44663,96,1,0,1,1), -- Abandoned Adventurer's Satchel
(32501,41989,-33,1,0,1,1), -- QUEST: Vrykul Amulet
-- Hildana Deathstealer
(32495,44697,99,1,0,1,1), -- Val'kyr Vestments
(32495,44663,96,1,0,1,1), -- Abandoned Adventurer's Satchel
-- Putridus the Ancient
(32487,44696,98,1,0,1,1), -- Giant's Toewrap
(32487,44663,93,1,0,1,1); -- Abandoned Adventurer's Satchel

-- Pathing for Firewing Bloodwarder Entry: 1410
SET @NPC := 78283;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `id`=1410,`spawndist`=0,`MovementType`=2,`position_x`=-2300.636,`position_y`=3100.041,`position_z`=147.3982 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2299.969,3105.141,149.6725,0,0,0,100,0),
(@PATH,2,-2292.289,3110.856,152.6214,0,0,0,100,0),
(@PATH,3,-2283.752,3110.493,152.8172,0,0,0,100,0),
(@PATH,4,-2276.066,3103.917,152.8172,0,0,0,100,0),
(@PATH,5,-2283.752,3110.493,152.8172,0,0,0,100,0),
(@PATH,6,-2292.289,3110.856,152.6214,0,0,0,100,0),
(@PATH,7,-2299.969,3105.141,149.6725,0,0,0,100,0),
(@PATH,8,-2300.636,3100.041,147.3982,0,0,0,100,0),
(@PATH,9,-2300.859,3092.531,144.2333,0,0,0,100,0),
(@PATH,10,-2296.14,3085.783,141.8156,0,0,0,100,0),
(@PATH,11,-2289.155,3083.634,139.7564,0,0,0,100,0),
(@PATH,12,-2281.993,3085.269,138.7524,0,0,0,100,0),
(@PATH,13,-2277.662,3092.126,138.7524,0,0,0,100,0),
(@PATH,14,-2281.993,3085.269,138.7524,0,0,0,100,0),
(@PATH,15,-2289.155,3083.634,139.7564,0,0,0,100,0),
(@PATH,16,-2296.14,3085.783,141.8156,0,0,0,100,0),
(@PATH,17,-2300.859,3092.531,144.2333,0,0,0,100,0),
(@PATH,18,-2300.636,3100.041,147.3982,0,0,0,100,0);

-- Pathing for Firewing Bloodwarder Entry: 1410
SET @NPC := 7758;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2242.387,`position_y`=3202.843,`position_z`=22.8518 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2239.479,3214.478,22.85181,0,0,0,100,0),
(@PATH,2,-2242.496,3225.877,22.8518,0,0,0,100,0),
(@PATH,3,-2251.287,3234.036,22.8518,0,0,0,100,0),
(@PATH,4,-2263.125,3235.337,22.8518,0,0,0,100,0),
(@PATH,5,-2272.588,3231.565,22.85181,0,0,0,100,0),
(@PATH,6,-2277.569,3226.189,22.8518,0,0,0,100,0),
(@PATH,7,-2272.588,3231.565,22.85181,0,0,0,100,0),
(@PATH,8,-2263.125,3235.337,22.8518,0,0,0,100,0),
(@PATH,9,-2251.486,3234.058,22.85181,0,0,0,100,0),
(@PATH,10,-2242.496,3225.877,22.8518,0,0,0,100,0),
(@PATH,11,-2239.404,3214.779,22.8518,0,0,0,100,0),
(@PATH,12,-2242.387,3202.843,22.8518,0,0,0,100,0),
(@PATH,13,-2249.017,3196.804,22.80147,0,0,0,100,0),
(@PATH,14,-2260.803,3194.38,22.85367,0,0,0,100,0),
(@PATH,15,-2271.738,3198.11,22.85364,0,0,0,100,0),
(@PATH,16,-2277.687,3205.128,22.85181,0,0,0,100,0),
(@PATH,17,-2271.738,3198.11,22.85364,0,0,0,100,0),
(@PATH,18,-2260.803,3194.38,22.85367,0,0,0,100,0),
(@PATH,19,-2249.017,3196.804,22.80147,0,0,0,100,0),
(@PATH,20,-2242.387,3202.843,22.8518,0,0,0,100,0);

-- Pathing for Firewing Bloodwarder Entry: 1410
SET @NPC := 7756;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2254.217,`position_y`=3224.904,`position_z`=5.111827 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2260.976,3226.1,5.349664,0,0,0,100,0),
(@PATH,2,-2254.217,3224.904,5.111827,0,0,0,100,0),
(@PATH,3,-2249.498,3219.329,2.661798,0,0,0,100,0),
(@PATH,4,-2248.54,3212.486,0.2007978,0,0,0,100,0),
(@PATH,5,-2251.302,3207.916,-1.99811,0,0,0,100,0),
(@PATH,6,-2257.676,3204.946,-4.053215,0,0,0,100,0),
(@PATH,7,-2251.302,3207.916,-1.99811,0,0,0,100,0),
(@PATH,8,-2248.54,3212.486,0.2007978,0,0,0,100,0),
(@PATH,9,-2249.494,3219.303,2.65062,0,0,0,100,0),
(@PATH,10,-2254.217,3224.904,5.111827,0,0,0,100,0);

-- Pathing for Firewing Bloodwarder Entry: 1410
SET @NPC := 7763;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2345.06,`position_y`=3365.858,`position_z`=-3.307672 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2349.435,3351.335,-2.557672,0,0,0,100,0),
(@PATH,2,-2351.637,3330.967,-2.123725,0,0,0,100,0),
(@PATH,3,-2352.411,3313.604,-1.498725,0,0,0,100,0),
(@PATH,4,-2348.645,3294.924,-0.8494196,0,0,0,100,0),
(@PATH,5,-2347.5,3285.576,-0.4744196,0,0,0,100,0),
(@PATH,6,-2348.645,3294.924,-0.8494196,0,0,0,100,0),
(@PATH,7,-2352.411,3313.604,-1.498725,0,0,0,100,0),
(@PATH,8,-2351.637,3330.967,-2.123725,0,0,0,100,0),
(@PATH,9,-2349.435,3351.335,-2.557672,0,0,0,100,0),
(@PATH,10,-2345.06,3365.858,-3.307672,0,0,0,100,0),
(@PATH,11,-2336.654,3375.736,-4.585965,0,0,0,100,0),
(@PATH,12,-2345.06,3365.858,-3.307672,0,0,0,100,0);

-- Pathing for Firewing Bloodwarder Entry: 1410
SET @NPC := 7746;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2411.25,`position_y`=3154.885,`position_z`=12.51691 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2425.553,3163.988,17.89025,0,0,0,100,0),
(@PATH,2,-2429.365,3184.917,18.08286,0,0,0,100,0),
(@PATH,3,-2421.878,3196.283,18.09011,0,0,0,100,0),
(@PATH,4,-2409.75,3196.483,18.08351,0,0,0,100,0),
(@PATH,5,-2401.37,3186.509,18.08373,0,0,0,100,0),
(@PATH,6,-2403.097,3176.193,18.08514,0,0,0,100,0),
(@PATH,7,-2411.921,3170.701,18.0846,0,0,0,100,0),
(@PATH,8,-2421.156,3170.403,18.0838,0,0,0,100,0),
(@PATH,9,-2424.846,3168.233,18.08307,0,0,0,100,0),
(@PATH,10,-2417.574,3160.759,15.48733,0,0,0,100,0),
(@PATH,11,-2409.663,3157.18,11.92867,0,0,0,100,0),
(@PATH,12,-2399.892,3160.786,8.800606,0,0,0,100,0),
(@PATH,13,-2390.157,3169.781,3.500476,0,0,0,100,0),
(@PATH,14,-2388.426,3169.413,3.038804,0,0,0,100,0),
(@PATH,15,-2400.481,3157.432,9.245301,0,0,0,100,0),
(@PATH,16,-2411.25,3154.885,12.51691,0,0,0,100,0);

-- Pathing for Firewing Defender Entry: 5355
SET @NPC := 35071;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2373.031,`position_y`=3204.094,`position_z`=-1.114177 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2362.045,3196.487,-1.458659,0,0,0,100,0),
(@PATH,2,-2349.351,3192.811,-1.458659,0,0,0,100,0),
(@PATH,3,-2338.471,3193.571,-1.333659,0,0,0,100,0),
(@PATH,4,-2326.477,3197.87,-1.377604,0,0,0,100,0),
(@PATH,5,-2317.173,3205.313,-1.375597,0,0,0,100,0),
(@PATH,6,-2310.82,3213.454,-1.125597,0,0,0,100,0),
(@PATH,7,-2307.583,3222.53,-1.500597,0,0,0,100,0),
(@PATH,8,-2306.818,3235.682,-1.325006,0,0,0,100,0),
(@PATH,9,-2308.267,3246.324,-0.9500055,0,0,0,100,0),
(@PATH,10,-2314.036,3256.474,-1.075006,0,0,0,100,0),
(@PATH,11,-2320.906,3264.052,-1.075006,0,0,0,100,0),
(@PATH,12,-2330.98,3271.191,-1.087267,0,0,0,100,0),
(@PATH,13,-2339.27,3275.36,-0.9744196,0,0,0,100,0),
(@PATH,14,-2346.198,3276.744,-1.09942,0,0,0,100,0),
(@PATH,15,-2354.26,3274.702,-1.34942,0,0,0,100,0),
(@PATH,16,-2364.516,3268.476,-1.47442,0,0,0,100,0),
(@PATH,17,-2374.687,3260.501,-1.125597,0,0,0,100,0),
(@PATH,18,-2382.419,3248.859,-1.250597,0,0,0,100,0),
(@PATH,19,-2385.263,3238.87,-1.375597,0,0,0,100,0),
(@PATH,20,-2385.077,3224.941,-1.239177,0,0,0,100,0),
(@PATH,21,-2382.88,3215.065,-1.114177,0,0,0,100,0),
(@PATH,22,-2373.031,3204.094,-1.114177,0,0,0,100,0);


-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209069;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2697.419,-4016.824,376.924,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2720.878,-4016.57,377.9195,0,0,0,100,0),
(@PATH,2,2697.828,-4016.585,377.0644,0,0,0,100,0),
(@PATH,3,2688.135,-4019.685,375.1393,0,0,0,100,0),
(@PATH,4,2697.419,-4016.824,376.924,0,0,0,100,0);
-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209070;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2638.914,-3954.672,325.1407,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2654.15,-3942.158,338.6407,0,0,0,100,0),
(@PATH,2,2673.78,-3936.003,356.7825,0,0,0,100,0),
(@PATH,3,2687.534,-3933.731,366.9075,0,0,0,100,0),
(@PATH,4,2673.78,-3936.003,356.7825,0,0,0,100,0),
(@PATH,5,2654.15,-3942.158,338.6407,0,0,0,100,0),
(@PATH,6,2638.914,-3954.672,325.1407,0,0,0,100,0);
-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209071;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2736.774,-4092.956,380.9239,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2715.542,-4118.895,366.3432,0,0,0,100,0),
(@PATH,2,2694.547,-4124.934,358.1958,0,0,0,100,0),
(@PATH,3,2715.542,-4118.895,366.3432,0,0,0,100,0),
(@PATH,4,2736.774,-4092.956,380.9239,0,0,0,100,0);
-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209072;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2731.569,-4059.094,387.1922,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2703.275,-4056.196,372.1922,0,0,0,100,0),
(@PATH,2,2689.402,-4037.676,372.4806,0,0,0,100,0),
(@PATH,3,2703.275,-4056.196,372.1922,0,0,0,100,0),
(@PATH,4,2731.569,-4059.094,387.1922,0,0,0,100,0);
-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209073;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2708.681,-3949.61,375.7774,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2705.178,-3961.799,375.6524,0,0,0,100,0),
(@PATH,2,2696.735,-3974.133,375.7,0,0,0,100,0),
(@PATH,3,2696.953,-3984.144,375.95,0,0,0,100,0),
(@PATH,4,2699.271,-3976.043,375.7,0,0,0,100,0),
(@PATH,5,2707.984,-3965.564,376.0274,0,0,0,100,0),
(@PATH,6,2712.257,-3950.983,376.0274,0,0,0,100,0),
(@PATH,7,2708.681,-3949.61,375.7774,0,0,0,100,0);
-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209074;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2714.579,-3939.838,375.1524,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2708.935,-3922.262,375.2774,0,0,0,100,0),
(@PATH,2,2714.446,-3919.956,375.2774,0,0,0,100,0),
(@PATH,3,2729.402,-3932.177,374.5274,0,0,0,100,0),
(@PATH,4,2714.446,-3919.956,375.2774,0,0,0,100,0),
(@PATH,5,2708.935,-3922.262,375.2774,0,0,0,100,0),
(@PATH,6,2714.579,-3939.838,375.1524,0,0,0,100,0);
-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209075;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2784.569,-4011.168,379.6814,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2779.109,-4015.134,378.8367,0,0,0,100,0),
(@PATH,2,2772.743,-4003.694,378.4659,0,0,0,100,0),
(@PATH,3,2784.437,-4003.582,379.5116,0,0,0,100,0),
(@PATH,4,2784.569,-4011.168,379.6814,0,0,0,100,0);
-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209076;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2628.199,-4141.459,327.4775,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2611.351,-4128.365,318.1612,0,0,0,100,0),
(@PATH,2,2593.124,-4125.909,308.7285,0,0,0,100,0),
(@PATH,3,2611.351,-4128.365,318.1612,0,0,0,100,0),
(@PATH,4,2628.199,-4141.459,327.4775,0,0,0,100,0),
(@PATH,5,2624.449,-4161.107,331.8525,0,0,0,100,0),
(@PATH,6,2614.918,-4174.501,333.1044,0,0,0,100,0),
(@PATH,7,2624.413,-4161.336,331.8525,0,0,0,100,0),
(@PATH,8,2628.199,-4141.459,327.4775,0,0,0,100,0);
-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209077;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2673.117,-4088.239,356.8162,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2662.794,-4065.665,356.5576,0,0,0,100,0),
(@PATH,2,2676.103,-4058.589,361.4806,0,0,0,100,0),
(@PATH,3,2662.794,-4065.665,356.5576,0,0,0,100,0),
(@PATH,4,2673.117,-4088.239,356.8162,0,0,0,100,0),
(@PATH,5,2679.449,-4110.017,355.3208,0,0,0,100,0),
(@PATH,6,2673.117,-4088.239,356.8162,0,0,0,100,0);
-- Pathing for Gjalerhorn Scavenger Entry: 27699
SET @NPC := 209078;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`curhealth`,`MovementType`) VALUES
(@NPC,27699,571,1,1,0,0,2571.937,-3991.866,280.0677,0,120,1,2);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2596.033,-3983.378,293.1927,0,0,0,100,0),
(@PATH,2,2571.937,-3991.866,280.0677,0,0,0,100,0);

-- Pathing for Anub'ar Underlord Entry: 26605
SET @NPC := 118237;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3704.838,`position_y`=2095.148,`position_z`=29.32822 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3704.878,2078.017,22.76327,0,0,0,100,0),
(@PATH,2,3704.838,2095.148,29.32822,0,0,0,100,0),
(@PATH,3,3716.224,2107.784,34.74489,0,0,0,100,0),
(@PATH,4,3704.838,2095.148,29.32822,0,0,0,100,0);
-- Pathing for Anub'ar Underlord Entry: 26605
SET @NPC := 118244;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3720.111,`position_y`=2070.069,`position_z`=20.87124 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3719.379,2060.642,18.13046,0,0,0,100,0),
(@PATH,2,3717.377,2046.599,19.50792,0,0,0,100,0),
(@PATH,3,3712.452,2034.414,20.03152,0,0,0,100,0),
(@PATH,4,3717.377,2046.599,19.50792,0,0,0,100,0),
(@PATH,5,3719.186,2059.884,18.13046,0,0,0,100,0),
(@PATH,6,3720.111,2070.069,20.87124,0,0,0,100,0);
-- Pathing for Anub'ar Underlord Entry: 26605
SET @NPC := 118288;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3697.697,`position_y`=2009.523,`position_z`=26.85555 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3694.476,2020.034,23.35549,0,0,0,100,0),
(@PATH,2,3696.517,2032.483,19.2324,0,0,0,100,0),
(@PATH,3,3694.476,2020.034,23.35549,0,0,0,100,0),
(@PATH,4,3697.697,2009.523,26.85555,0,0,0,100,0);
-- Pathing for Anub'ar Underlord Entry: 26605
SET @NPC := 118245;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3732.257,`position_y`=2176.174,`position_z`=37.1051 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3718.512,2172.458,37.42885,0,0,0,100,0),
(@PATH,2,3732.257,2176.174,37.1051,0,0,0,100,0),
(@PATH,3,3743.498,2155.942,37.23704,0,0,0,100,0),
(@PATH,4,3732.257,2176.174,37.1051,0,0,0,100,0);
-- Pathing for Anub'ar Underlord Entry: 26605
SET @NPC := 118238;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=3743.132,`position_y`=2124.906,`position_z`=44.5452 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,3736.5,2122.697,41.26656,0,0,0,100,0),
(@PATH,2,3728.368,2133.333,39.51953,0,0,0,100,0),
(@PATH,3,3736.5,2122.697,41.26656,0,0,0,100,0),
(@PATH,4,3742.983,2124.628,44.42427,0,0,0,100,0),
(@PATH,5,3748.981,2135.839,47.54227,0,0,0,100,0),
(@PATH,6,3746.108,2146.75,50.10811,0,0,0,100,0),
(@PATH,7,3748.981,2135.839,47.54227,0,0,0,100,0),
(@PATH,8,3743.132,2124.906,44.5452,0,0,0,100,0);
-- Pathing for Anub'ar Cultist Entry: 26319
SET @NPC := 115443;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4022.739,`position_y`=2258.957,`position_z`=152.3082 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4032.673,2267.958,152.1369,0,0,0,100,0),
(@PATH,2,4023.99,2280.177,153.2619,0,0,0,100,0),
(@PATH,3,4012.677,2274.532,153.6369,0,0,0,100,0),
(@PATH,4,3999.963,2258.323,154.234,0,0,0,100,0),
(@PATH,5,4000.036,2251.767,154.5582,0,0,0,100,0),
(@PATH,6,3995.088,2248.992,154.234,0,0,0,100,0),
(@PATH,7,3993.707,2243.226,154.109,0,0,0,100,0),
(@PATH,8,3998.962,2241.267,154.734,0,0,0,100,0),
(@PATH,9,4006.684,2243.027,154.1832,0,0,0,100,0),
(@PATH,10,4022.739,2258.957,152.3082,0,0,0,100,0);

UPDATE `creature_template` SET `AIName`='SmartAI',`exp`=2,`minlevel`=83,`maxlevel`=83,`baseattacktime`=2000,`flags_extra`=`flags_extra`|0x80 WHERE `entry`=36536; -- Well of Souls

DELETE FROM `smart_scripts` WHERE `entryorguid`=36536;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(36536,0,0,0,54,0,0,0,0,0,0,0,11,68854,0,0,0,0,0,1,0,0,0,0,0,0,0,'Well of Souls - On summon - Cast Well of Souls');

DELETE FROM `spell_proc_event` WHERE `entry` = 63251;
INSERT INTO `spell_proc_event` VALUES
(63251,0,0,0,0,0,0,0,0,0,45);

DELETE FROM `script_texts` WHERE `entry` IN (-1603055,-1603056);
INSERT INTO `script_texts` (`npc_entry`,`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`)
VALUES
(33515,-1603055,'Auriaya begins to cast Terrifying Screech.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Auriaya - EMOTE_FEAR'),
(33515,-1603056,'Auriaya begins to activate the Feral Defender!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Auriaya - EMOTE_DEFENDER');

DELETE FROM `spelldifficulty_dbc` WHERE `id` BETWEEN 3200 AND 3206;
INSERT INTO `spelldifficulty_dbc` (`id`,`spellid0`,`spellid1`,`spellid2`,`spellid3`)
VALUES
(3200,64389,64678,0,0), -- Auriaya - Sentinel Blast
(3201,64422,64688,0,0), -- Auriaya - Sonic Screech
(3202,64496,64674,0,0), -- Auriaya/Feral Defender - Feral Rush
(3203,64478,64669,0,0), -- Auriaya/Feral Defender - Feral Pounce
(3204,64458,64676,0,0), -- Auriaya/Feral Defender - Seeping Essence
(3205,64666,64374,0,0), -- Auriaya/Sanctum Sentry - Savage Pounce
(3206,64375,64667,0,0); -- Auriaya/Sanctum Sentry - Rip Flesh

UPDATE `creature_template` SET `equipment_id`=2500 WHERE `entry`=33515; -- Freya
UPDATE `creature_template` SET `ScriptName`='npc_feral_defender' WHERE `entry`=34035; -- Feral Defender
UPDATE `creature_template` SET `ScriptName`='npc_sanctum_sentry' WHERE `entry`=34014; -- Sanctum Sentry
UPDATE `creature_template` SET `ScriptName`='npc_auriaya_seeping_trigger',`unit_flags`=33554692,`flags_extra`=130 WHERE `entry` =34098; -- Seeping Trigger
UPDATE `creature_template` SET `ScriptName`='',`unit_flags`=33554692,`flags_extra`=128 WHERE `entry` =34096; -- Feral Defender Trigger

DELETE FROM `spell_script_names` WHERE `spell_id`=64381;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`)
VALUES
(64381,'spell_auriaya_strenght_of_the_pack');

DELETE FROM `conditions` WHERE `SourceEntry`=64449; 
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`)
VALUES 
(13,0,64449,0,18,1,34096,0,0,'','Auriaya Feral Defender Stalker spell script target');

DELETE FROM `creature_equip_template` WHERE `entry`=2500;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`)
VALUES
(2500,45315,0,0);

DELETE FROM `spell_proc_event` WHERE `entry` = 32216;
INSERT INTO `spell_proc_event` VALUES
(32216,0,4,0,0x100,0,0x10,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);

-- Remove those achievements from disables table
DELETE FROM `disables` WHERE `entry` IN (10184,10243,10399,10400);

-- Achievement ScriptNames
DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10184,10243,10399,10400) and `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`)
VALUES
(10243,11,0,0,'achievement_nine_lives'),
(10399,11,0,0,'achievement_nine_lives'),
(10184,11,0,0,'achievement_crazy_cat_lady'),
(10400,11,0,0,'achievement_crazy_cat_lady');

-- Creature walk/run speed update
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 5648;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 16863;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 16867;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 16878;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 16880;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 16934;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 17046;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 17263;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 17282;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 17794;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 17795;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 18991;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 19029;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 19032;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 19259;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 19276;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 19277;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 19282;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 19414;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 20159;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`= 3300;
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE `entry` = 18733;
UPDATE `creature_template` SET `speed_walk`=3.2 WHERE `entry` = 19189;
UPDATE `creature_template` SET `speed_walk`=4 WHERE entry = 19275;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=706;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=705;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=704;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=724;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=721;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=707;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1354;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12738;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=786;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=708;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=946;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=808;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=713;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=658;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=829;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3571;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2042;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1998;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=1995;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3602;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3515;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=883;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1984;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1992;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2079;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2031;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2077;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12160;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2082;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3589;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3596;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3597;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1988;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1420;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1985;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1989;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1986;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1994;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16719;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16718;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16739;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16764;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15103;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19925;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16733;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16475;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16477;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16483;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=16520;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=16516;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16917;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16918;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16971;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16500;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16501;
UPDATE `creature_template` SET `speed_walk`=0.9 WHERE `entry`=16502;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20227;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16514;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20233;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16503;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16499;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16535;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16920;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16919;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17071;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17073;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17425;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=16537;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16922;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=16518;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1412;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20239;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16546;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=16521;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=17467;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17947;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=16522;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1127;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1211;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=8503;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=14881;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=16303;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16353;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16347;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16300;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15494;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15513;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15284;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15285;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15283;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15279;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15280;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=6368;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15366;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=15274;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15287;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15371;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15278;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15292;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15289;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15291;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15295;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15297;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15296;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15468;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=15271;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15372;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15281;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=15294;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=15273;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=15298;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=15367;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3166;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3163;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3139;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3142;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3171;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11025;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6928;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9987;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3168;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3165;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3175;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3174;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5953;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3167;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3191;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3881;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3098;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11378;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10556;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5952;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5887;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9796;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5765;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10176;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3143;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3145;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3154;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3707;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3153;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3882;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3158;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3157;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5884;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3155;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3124;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3160;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3156;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3159;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12776;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3161;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=5951;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3281;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=3300;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3287;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3101;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3102;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3183;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1509;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1513;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1512;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1508;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=4075;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1568;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2307;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=1737;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1570;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2116;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2117;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1569;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1661;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2124;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5749;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2123;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2126;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5667;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=1740;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2315;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2115;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2113;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2122;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2119;
UPDATE `creature_template` SET `speed_walk`=0.777776,`speed_run`=0.85714 WHERE `entry`=1502;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=1736;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=1741;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1501;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=1739;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1890;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1504;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1505;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1688;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3084;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2987;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2998;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3003;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6410;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8674;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2999;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10278;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8360;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15106;
UPDATE `creature_template` SET `speed_run`=0.57143 WHERE `entry`=29238;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11084;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11071;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3015;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11051;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3012;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3017;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3093;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3050;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14728;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2995;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8722;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3004;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3011;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3092;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3007;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3005;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3095;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3008;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4451;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3002;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3001;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3978;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3210;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2620;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.85714 WHERE `entry`=2955;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3072;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3060;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3211;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3214;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3883;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5888;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3062;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3074;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3073;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3061;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3059;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3075;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2980;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2981;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3213;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3209;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2991;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2966;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2952;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2954;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2953;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3229;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=8554;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3297;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5880;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6408;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3186;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10369;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3187;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3125;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11814;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3188;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3304;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14545;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14543;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12349;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12346;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12350;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14544;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7953;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3185;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7952;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10578;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3194;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5942;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3184;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3933;
UPDATE `creature_template` SET `speed_walk`=1.444444,`speed_run`=1.5873 WHERE `entry`=30235;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=30206;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=30268;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=2 WHERE `entry`=30544;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=30203;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.71429 WHERE `entry`=30205;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.71429 WHERE `entry`=30333;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=2.14286 WHERE `entry`=30486;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30673;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=30674;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=2 WHERE `entry`=30541;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=30543;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32155;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=32771;
UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=1.38571 WHERE `entry`=32201;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=31747;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=31691;
UPDATE `creature_template` SET `speed_run`=0.14286 WHERE `entry`=24879;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31813;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31847;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31147;
UPDATE `creature_template` SET `speed_run`=3.57143 WHERE `entry`=28243;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=30265;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30856;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30860;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=31033;
UPDATE `creature_template` SET `speed_walk`=1.444444,`speed_run`=1.5873 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=31040;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=31039;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31836;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31718;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11822;
UPDATE `creature_template` SET `speed_walk`=2.8 WHERE `entry`=11832;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11799;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=32320;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=31045;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=31063;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=33422;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE `entry`=32428;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=31404;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31402;
UPDATE `creature_template` SET `speed_run`=3.42857 WHERE `entry`=31393;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26358;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26359;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=26316;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26293;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=26272;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=26711;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=26273;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=26295;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27953;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26917;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=34381;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=26271;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27685;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27686;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27533;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27534;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32598;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29570;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31033;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20791;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=22497;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=19687;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18166;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18481;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19684;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25167;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19075;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24938;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19144;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18893;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19120;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21432;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18525;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20331;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24928;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=27666;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24932;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25115;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23472;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=34984;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=30094;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=30095;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=31233;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=31851;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=31783;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.57143 WHERE `entry`=32767;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31243;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30588;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30589;
UPDATE `creature_template` SET `speed_walk`=6,`speed_run`=3.14286 WHERE `entry`=30700;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30649;
UPDATE `creature_template` SET `speed_walk`=6,`speed_run`=3.14286 WHERE `entry`=30707;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=31353;
UPDATE `creature_template` SET `speed_walk`=6,`speed_run`=3.14286 WHERE `entry`=30690;
UPDATE `creature_template` SET `speed_walk`=6,`speed_run`=3.14286 WHERE `entry`=30699;
UPDATE `creature_template` SET `speed_walk`=1.4,`speed_run`=2.57143 WHERE `entry`=32492;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30476;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30559;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30640;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30655;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30651;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30646;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=32193;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31142;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31155;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=32299;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31746;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=32769;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=32770;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31258;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=31280;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31267;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31263;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31396;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31265;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31736;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31399;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=31150;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=31198;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=32188;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=32523;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=32525;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=32524;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=1.71429 WHERE `entry`=32182;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=32179;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.57143 WHERE `entry`=31721;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=30832;
UPDATE `creature_template` SET `speed_walk`=6,`speed_run`=3.14286 WHERE `entry`=30749;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=32257;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=32284;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=32505;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=32502;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=32482;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31779;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=31780;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=31411;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=31853;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=30894;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=31868;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30687;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=30988;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30597;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=30993;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30701;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=30631;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=31015;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=30704;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31554;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=31556;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31553;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.19048 WHERE `entry`=30952;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=30951;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31131;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=31251;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=30312;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31266;
UPDATE `creature_template` SET `speed_run`=0.57143 WHERE `entry`=31438;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=29343;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=30074;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=30335;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=32469;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=30002;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31255;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=0.71429 WHERE `entry`=31075;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=30922;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=35470;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33543;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33558;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33698;
UPDATE `creature_template` SET `speed_walk`=0.6,`speed_run`=0.69286 WHERE `entry`=33749;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29477;
UPDATE `creature_template` SET `speed_run`=0.59524 WHERE `entry`=29624;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29389;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29808;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29843;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29793;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29792;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=31030;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31322;
UPDATE `creature_template` SET `speed_walk`=6,`speed_run`=3.14286 WHERE `entry`=31246;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31900;
UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=1.42857 WHERE `entry`=32178;
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE `entry`=2110;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=15475;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=22515;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=31222;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=3.14286 WHERE `entry`=31242;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=31271;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32601;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=36508;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36666;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=29888;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31900;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=23739;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23801;
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE `entry`=24174;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=23550;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23557;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24694;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=24270;
UPDATE `creature_template` SET `speed_run`=0.21429 WHERE `entry`=24177;
UPDATE `creature_template` SET `speed_walk`=0.5,`speed_run`=0.57143 WHERE `entry`=24215;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=2914;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=24322;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3501;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3338;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3489;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3480;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3659;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3658;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3449;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3464;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3429;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3431;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3482;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3934;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3481;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3490;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3390;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3615;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=5774;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9981;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3478;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3479;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5871;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3483;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3428;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=3244;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3477;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3488;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3432;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3486;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3448;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3484;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3485;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3487;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3254;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=3415;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=12296;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28968 WHERE `entry`=3242;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=3246;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3255;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4127;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3425;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3498;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3499;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16418;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=3502;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3453;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9558;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3497;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3665;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3493;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3492;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3292;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8496;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10063;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6791;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3339;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3572;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3491;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3446;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3496;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8119;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7166;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7161;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3442;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16227;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8738;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3391;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3494;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3495;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6266;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6253;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6252;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6254;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6251;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23535;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23536;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23534;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=3245;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5766;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3416;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=6145;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9559;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=4624;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=17249;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=21045;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3272;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3273;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3248;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3234;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3461;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3256;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4129;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28968 WHERE `entry`=3426;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3463;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3240;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3247;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3474;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3258;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3260;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3433;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3704;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3703;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6394;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3705;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3430;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7714;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6387;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10380;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9983;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5944;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3387;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3418;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5911;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10378;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3239;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28968 WHERE `entry`=3466;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3424;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3250;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=4196;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3252;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3251;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3472;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3436;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3458;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3434;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3457;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=10756;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=10757;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10537;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4878;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11117;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9551;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4317;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10377;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17093;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10539;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11116;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4876;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4722;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4877;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10645;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4875;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.42857 WHERE `entry`=31233;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=30273;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=36657;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=36656;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=36642;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=36624;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33382;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=35473;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.95238 WHERE `entry`=35469;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33285;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33383;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33384;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=34788;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=33243;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=33272;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=35501;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33306;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33842;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=35476;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10928;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=35475;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=417;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33643;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8996;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17252;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=33843;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33564;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33561;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33562;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33559;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=36065;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33974;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=32639;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33972;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33973;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33870;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=35482;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=36223;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.99206 WHERE `entry`=33447;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=35808;
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE `entry`=35984;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33743;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33740;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33747;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.99206 WHERE `entry`=33522;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33738;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.99206 WHERE `entry`=34210;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=35344;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=35117;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=33817;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33739;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.99206 WHERE `entry`=33518;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33749;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33745;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.71429 WHERE `entry`=36173;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33746;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33748;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33744;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=22817;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28077;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28095;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28076;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=3835;
UPDATE `creature_template` SET `speed_run`=0.14286 WHERE `entry`=32544;
UPDATE `creature_template` SET `speed_run`=1.57143 WHERE `entry`=28093;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=30737;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28346;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=28053;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28037;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=28170;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=27801;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=29124;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=28641;
UPDATE `creature_template` SET `speed_walk`=1.111112,`speed_run`=1.19048 WHERE `entry`=28113;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28668;
UPDATE `creature_template` SET `speed_run`=1.30952 WHERE `entry`=28667;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=30560;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32622;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=32294;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=39172;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32621;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32616;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=31036;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=31153;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=30849;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26575;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26577;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26578;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=33532;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=22818;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=37856;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=34520;
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE `entry`=32466;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32601;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1917;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1916;
UPDATE `creature_template` SET `speed_walk`=0.777776,`speed_run`=0.85714 WHERE `entry`=1918;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1919;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1506;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6784;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1547;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1553;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1519;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1548;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1554;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=5725;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1526;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1525;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=620;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3522;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3523;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10666;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1735;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1496;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1743;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1742;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=11156;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1518;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2132;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2114;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3547;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10665;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4773;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=34238;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2309;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12342;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12341;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12343;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14558;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2311;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=35169;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4731;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10055;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1745;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2314;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31715;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2136;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2137;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2135;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=1515;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1746;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5750;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2129;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2127;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1499;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11945;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2134;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2118;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2310;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1652;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6785;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5724;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5759;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1500;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1521;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1560;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2128;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2131;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1738;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3548;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2130;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2210;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5688;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5695;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2209;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2211;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1931;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6966;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=346;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=348;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7009;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3091;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=6728;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=266;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3085;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=900;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=344;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1680;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5620;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=859;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=381;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9982;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6166;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=379;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=789;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=790;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1678;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=777;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=791;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=415;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=793;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=956;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3087;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3086;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3090;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3088;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=849;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=343;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5608;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5607;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1933;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=341;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=382;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8965;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8962;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8963;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=903;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=547;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=441;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1070;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=931;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=442;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=464;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=423;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=712;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=732;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3134;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2142;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=202;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=302;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=203;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1436;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1101;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1099;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1098;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1100;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=898;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=888;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1001;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=499;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=412;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=288;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2481;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=909;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=681;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=688;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=910;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=533;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=205;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5414;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=7376;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=741;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=740;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=767;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=6653;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=4953;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5988;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=5982;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5990;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7750;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=14448;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=11198;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=1776;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=11874;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17127;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17531;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18221;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5353;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=428;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=578;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=422;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=485;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=505;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=615;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=437;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4463;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=9700;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=7031;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9691;
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE `entry`=9699;
UPDATE `creature_template` SET `speed_walk`=0.777776,`speed_run`=1.42857 WHERE `entry`=10119;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9560;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9565;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9561;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9177;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9562;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2299;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1296;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3298;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8978;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=7032;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=5855;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=8447;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5846;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14621;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8400;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1201;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1125;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1196;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1126;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1128;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12363;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12367;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12365;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14553;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14552;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12366;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14551;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1138;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1131;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=35073;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32667;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31146;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32666;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31144;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1388;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12372;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14546;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12374;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12373;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14548;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4772;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14547;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1261;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1352;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3177;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1265;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1263;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13076;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1115;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1116;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1117;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1689;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1959;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1161;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1195;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1186;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1190;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1470;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3948;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6734;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9989;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1473;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2506;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1963;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1465;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1682;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2512;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3291;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=167;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1572;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1105;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1681;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=372;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1340;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6241;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1474;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2513;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1139;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1469;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1337;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2516;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2098;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2509;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1777;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2514;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2508;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1338;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1278;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1224;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1172;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=1008;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=1007;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1030;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1111;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1038;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1036;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2091;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6412;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1057;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=1035;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2108;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1022;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1023;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1021;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=8881;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=4962;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1463;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12375;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=5403;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=5404;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=5406;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=5405;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1458;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1454;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1453;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12376;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1446;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22015;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33707;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=34925;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30861;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30868;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=29453;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29452;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=29449;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28519;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28565;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29436;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28869;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28868;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28870;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28871;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28867;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28615;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=29484;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28872;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28866;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29697;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29699;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29654;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28026;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=29917;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=29848;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=29690;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=29733;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29686;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29437;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29438;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29439;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28968 WHERE `entry`=16570;
UPDATE `creature_template` SET `speed_walk`=0.4,`speed_run`=0.99206 WHERE `entry`=28158;
UPDATE `creature_template` SET `speed_walk`=0.2,`speed_run`=1 WHERE `entry`=28274;
UPDATE `creature_template` SET `speed_walk`=0.833332,`speed_run`=0.99206 WHERE `entry`=28258;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28257;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=28413;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28412;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28145;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=28323;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28178;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=29133;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=28221;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=16509;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28401;
UPDATE `creature_template` SET `speed_run`=1.57143 WHERE `entry`=28465;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=31889;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28571 WHERE `entry`=582;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=27944;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=27421;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=26363;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=31890;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26357;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=26356;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=26436;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=26428;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=26434;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=26366;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.85714 WHERE `entry`=26646;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=27408;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=27259;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=24026;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=24210;
UPDATE `creature_template` SET `speed_walk`=0.6 WHERE `entry`=24359;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=23977;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=23836;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=23984;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=23986;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=29662;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=23985;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=23987;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=23851;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=23771;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=28407;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=23691;
UPDATE `creature_template` SET `speed_walk`=1.444444,`speed_run`=1.5873 WHERE `entry`=23750;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=16030;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23680;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=26823;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=26825;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=26827;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24212;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=2.14286 WHERE `entry`=23772;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=23919;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=24514;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=24524;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=24863;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_run`=1.11111 WHERE `entry`=24178;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=33698;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33543;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30035;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29377;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29390;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29960;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29963;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29959;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29950;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=32476;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29978;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29979;
UPDATE `creature_template` SET `speed_run`=1.5873 WHERE `entry`=29984;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29980;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29981;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30148;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=30164;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30376;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31693;
UPDATE `creature_template` SET `speed_run`=1.5873 WHERE `entry`=29544;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29584;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=29585;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30455;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30127;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=32571;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30262;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28411;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=27458;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=27461;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=27459;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=27460;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26417;
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE `entry`=27230;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26820;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26420;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=33643;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33543;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33698;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=36066;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31265;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31892;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31900;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.85714 WHERE `entry`=29648;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=29344;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=29456;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=29517;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=32495;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=30086;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31770;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=31233;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=33529;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=31033;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29792;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29793;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=30096;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29569;
UPDATE `creature_template` SET `speed_walk`=1.444444,`speed_run`=1.5873 WHERE `entry`=29590;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29369;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29376;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=30448;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=2 WHERE `entry`=30341;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=29724;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29469;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30445;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29844;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29849;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29695;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=30177;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29652;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29323;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29331;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=29411;
UPDATE `creature_template` SET `speed_run`=0.92857 WHERE `entry`=29434;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29426;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29885;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29518;
UPDATE `creature_template` SET `speed_walk`=1.444444,`speed_run`=1.42857 WHERE `entry`=29755;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=30006;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=30175;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29366;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=29461;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=30012;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=30154;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29975;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=29798;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29549;
UPDATE `creature_template` SET `speed_run`=1.11111 WHERE `entry`=29352;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30008;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=30005;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29796;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=29543;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=30010;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29571;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29545;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=30260;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30422;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32569;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=30302;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=30219;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30222;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30294;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=32540;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30105;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30456;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30252;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=32594;
UPDATE `creature_template` SET `speed_run`=1.5873 WHERE `entry`=30163;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28802;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=28759;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28145;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=28268;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=30043;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=30025;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30020;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=28793;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=29133;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=28022;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=27451;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=385;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=890;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=6271;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=27342;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27343;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27340;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26613;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=27008;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=6827;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29953;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26198;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26197;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26200;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26199;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26201;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=26510;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=21223;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=26321;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=26333;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.99206 WHERE `entry`=32572;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=25715;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=26191;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29965;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=27610;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=26218;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=25679;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25812;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25811;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=31685;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=24614;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=24613;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=25850;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=25732;
UPDATE `creature_template` SET `speed_walk`=8,`speed_run`=2.85714 WHERE `entry`=25364;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=27888;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=25727;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=25733;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25488;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25487;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=18955;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=25478;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25728;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=25718;
UPDATE `creature_template` SET `speed_walk`=4.8,`speed_run`=3.57143 WHERE `entry`=26127;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.99206 WHERE `entry`=25717;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.99206 WHERE `entry`=25716;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=33087;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25712;
UPDATE `creature_template` SET `speed_run`=1.5873 WHERE `entry`=27046;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25489;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=25724;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.99206 WHERE `entry`=25585;
UPDATE `creature_template` SET `speed_walk`=0.833332,`speed_run`=0.99206 WHERE `entry`=24566;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=25445;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=25284;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24562;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.42857 WHERE `entry`=25655;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=25294;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=25469;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=27064;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=25349;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=28150;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.85714 WHERE `entry`=25333;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=2 WHERE `entry`=25332;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=25675;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=25481;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=25450;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=26449;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=25435;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=25582;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=27365;
UPDATE `creature_template` SET `speed_run`=0.57143 WHERE `entry`=37574;
UPDATE `creature_template` SET `speed_run`=0.57143 WHERE `entry`=37543;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=466;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=32592;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=2442;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=525;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=94;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=116;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=30;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=474;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=99;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=478;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=97;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=822;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.89286 WHERE `entry`=467;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=154;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8934;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10045;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8931;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1109;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=157;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=113;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=524;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=251;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=6927;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6846;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=46;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=118;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=441;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=430;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=342;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=851;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=812;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1671;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=426;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=69;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=299;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=952;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=951;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=197;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=459;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=911;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=925;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=196;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=823;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1213;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=78;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=190;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=152;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=198;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=375;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=915;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9296;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=6;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=257;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=38;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=103;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=43;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18744;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16659;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16653;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16654;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16222;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18743;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20672;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18103;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16651;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16652;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16658;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16660;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16802;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16801;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16800;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16641;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16643;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16642;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.14286 WHERE `entry`=18237;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18230;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16634;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16633;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16635;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16644;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16631;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16623;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18722;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16690;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16648;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16649;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16667;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18763;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=18560;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16668;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16646;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16647;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=18563;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16782;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18231;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18232;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18626;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16669;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18627;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16663;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16664;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16655;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16670;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16671;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18629;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16685;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16686;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16684;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16683;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16442;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17769;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18781;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16618;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17768;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16636;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16780;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18347;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18191;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18187;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18189;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18188;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18190;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18628;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18147;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=18146;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16662;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18527;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16677;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16612;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16613;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16650;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20724;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17627;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17628;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17629;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18761;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16640;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16639;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20612;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18730;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16638;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16637;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16691;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16666;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16678;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16191;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16611;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18303;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18668;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18669;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18724;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18799;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18336;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18671;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16693;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16626;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16625;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17631;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17632;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17633;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16192;
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE `entry`=27946;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16273;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16278;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18277;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17630;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18790;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18792;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16676;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25207;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25200;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23988;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25202;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18782;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16610;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16568;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=19882;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=20087;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16687;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16692;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16688;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16689;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17845;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16703;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16624;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19775;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16627;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16628;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16629;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16615;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16616;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16617;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25223;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16679;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16681;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16621;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16620;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18175;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18174;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17718;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16680;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19923;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20390;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17717;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16619;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18507;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18504;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16656;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16674;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16673;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16675;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16672;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16221;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8666;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7295;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=29019;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29293;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29295;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29292;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29294;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=25464;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=25468;
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE `entry`=25753;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25814;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=25434;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=4 WHERE `entry`=26807;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=24563;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25622;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25619;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=25726;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=25677;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=25715;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=26480;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=27953;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29961;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=30152;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=29801;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=2 WHERE `entry`=29962;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29384;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29792;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29793;
UPDATE `creature_template` SET `speed_run`=1.57143 WHERE `entry`=29350;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=29402;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=29404;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29910;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29440;
UPDATE `creature_template` SET `speed_run`=3.57143 WHERE `entry`=30466;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=29483;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=29475;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28145;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_run`=0.59524 WHERE `entry`=28784;
UPDATE `creature_template` SET `speed_walk`=0.6 WHERE `entry`=28779;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=29236;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28597;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28411;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.57143 WHERE `entry`=29332;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=26681;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_run`=0.92857 WHERE `entry`=26588;
UPDATE `creature_template` SET `speed_run`=0.92857 WHERE `entry`=26589;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=10218;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=26461;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26457;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=24901;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.28571 WHERE `entry`=24013;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=24681;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=5936;
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE `entry`=23826;
UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=2.57143 WHERE `entry`=24914;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=24992;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=25026;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=24797;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=24786;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=2.85714 WHERE `entry`=28277;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=26503;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=24899;
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=2 WHERE `entry`=24871;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23550;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24701;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.71429 WHERE `entry`=29559;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=23887;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24340;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=23886;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=24824;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23675;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23672;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23673;
UPDATE `creature_template` SET `speed_run`=2.57143 WHERE `entry`=24747;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24746;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24752;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=24820;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24751;
UPDATE `creature_template` SET `speed_run`=2.57143 WHERE `entry`=24787;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23676;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23674;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23711;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.42857 WHERE `entry`=24027;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24030;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23796;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23725;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24345;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24334;
UPDATE `creature_template` SET `speed_run`=1.11111 WHERE `entry`=23744;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=24371;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20054;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20069;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=20055;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=19918;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5420;
UPDATE `creature_template` SET `speed_run`=0.78571 WHERE `entry`=29865;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=5465;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=29867;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20027;
UPDATE `creature_template` SET `speed_run`=0.78571 WHERE `entry`=29866;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20025;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5441;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20026;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=20129;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18723;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18725;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2354;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=2385;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2350;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=20424;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17814;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28571 WHERE `entry`=18651;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.42857 WHERE `entry`=18650;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=18646;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18094;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18644;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18093;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18092;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18657;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17815;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20433;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21341;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2267;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19433;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17819;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17840;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17833;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18598;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17820;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17876;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20155;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18764;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18765;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17860;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17846;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18673;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=17848;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18934;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18655;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18656;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20156;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.28571 WHERE `entry`=18649;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23175;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20376;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20372;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18664;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18666;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20430;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20426;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20363;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18672;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20358;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20396;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20428;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=20429;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28571 WHERE `entry`=20434;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20360;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20357;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20359;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20350;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20353;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20365;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20441;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20432;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20422;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20378;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20345;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20368;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20377;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20346;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20401;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20349;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20391;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20348;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20352;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20419;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20420;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20355;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20361;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20370;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20347;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20351;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20400;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20342;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20344;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20373;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20354;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20379;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20380;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21342;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21343;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21344;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21345;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20053;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19932;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=19959;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19933;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5451;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5450;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=20130;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=20131;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5452;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18982;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18983;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17952;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=15608;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21862;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17838;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=21148;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=18553;
UPDATE `creature_template` SET `speed_walk`=4 WHERE `entry`=18555;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=17839;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=21104;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21137;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=17881;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17023;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20201;
UPDATE `creature_template` SET `speed_run`=0.78571 WHERE `entry`=29868;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=29873;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7803;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18594;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19232;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19244;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19243;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19330;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19239;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19238;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18593;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18547;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19197;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23263;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19223;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19662;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19678;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=21655;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19195;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19664;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=21411;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21434;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19185;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19663;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19170;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23483;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19331;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20808;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23273;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19246;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19180;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19680;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19475;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=5202;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19338;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19715;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19216;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19150;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19076;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5543;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2798;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5906;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3447;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3045;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3044;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3049;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3046;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3048;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3419;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5957;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3030;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3032;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3047;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=34766;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3031;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=2957;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3035;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14441;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5189;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5054;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8359;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8361;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8362;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8363;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8364;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10054;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11869;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8358;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2997;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3026;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2996;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8356;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8357;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6746;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3027;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3083;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3022;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3020;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3019;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3021;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8398;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3023;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10881;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14440;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14442;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3025;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4721;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15164;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3013;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3028;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3024;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3014;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3029;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3016;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3010;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11047;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3018;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3009;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19432;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21252;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19435;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19179;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=19652;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=18733;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2615;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21993;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22001;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16575;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17558;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17585;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18747;
UPDATE `creature_template` SET `speed_walk`=7.2,`speed_run`=2.57143 WHERE `entry`=16598;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=22461;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=16946;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=15476;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.99206 WHERE `entry`=24918;
UPDATE `creature_template` SET `speed_walk`=0.4,`speed_run`=1.38889 WHERE `entry`=24933;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=16863;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19410;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16870;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=16880;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=16932;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21854;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18540;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18477;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18463;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18469;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18457;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18456;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18464;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21816;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18973;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18384;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24886;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19772;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18959;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19606;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=19607;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18447;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19048;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18385;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21192;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19002;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21188;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18960;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18386;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18705;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18712;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18383;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18676;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18984;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18962;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18957;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18249;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21193;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21194;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18807;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=22307;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=21902;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19718;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20986;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.9127 WHERE `entry`=19847;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19496;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19542;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19502;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19501;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19503;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19417;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19673;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19677;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18933;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18323;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=4076;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18327;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19429;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.14286 WHERE `entry`=21931;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18328;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18472;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18956;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18325;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18326;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18322;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18319;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18320;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21891;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18321;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19428;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21904;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18473;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18793;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18794;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18796;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21159;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18633;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18635;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18641;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18640;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18642;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=18731;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18848;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=18732;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=18667;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18637;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18631;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18891;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18636;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18797;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18638;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18830;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19224;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18632;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18639;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18634;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=18708;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=21317;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22326;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18453;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19227;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22208;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=22940;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19213;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19661;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22213;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22212;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19194;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19702;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19725;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19726;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19720;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19034;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18940;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=22987;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23449;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19202;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25140;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=23919;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23677;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24117;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23678;
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE `entry`=23876;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=23874;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=23875;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=19162;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.28571 WHERE `entry`=17076;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23131;
UPDATE `creature_template` SET `speed_walk`=1.8 WHERE `entry`=19685;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22292;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18596;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18622;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22373;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19164;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20807;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23484;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23270;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19321;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=19665;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20123;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20124;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20125;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=19155;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19033;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21235;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25991;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=25992;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22819;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19163;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23699;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18466;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18476;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18482;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18483;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18468;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18437;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18490;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24920;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17084;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16929;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=16927;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17057;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=16968;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=17794;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=17795;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=19032;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17059;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19264;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19766;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16574;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18752;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=19275;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19401;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=19717;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19222;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5991;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=5993;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5983;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5985;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8675;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5990;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=7363;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=8816;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=740;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=7379;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=7369;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=7372;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=12377;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=12378;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12379;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12380;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18253;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17613;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18255;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18162;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16415;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16169;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=16457;
UPDATE `creature_template` SET `speed_walk`=1.111112,`speed_run`=1.42857 WHERE `entry`=16482;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16171;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16424;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16425;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16407;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16411;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16412;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16159;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16488;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16388;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16389;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=2 WHERE `entry`=15691;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17260;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15551;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=15548;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=15547;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=16151;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16414;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16153;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=2 WHERE `entry`=15687;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19874;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17007;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19875;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19876;
UPDATE `creature_template` SET `speed_walk`=1.111112,`speed_run`=1.42857 WHERE `entry`=16481;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16170;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16426;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16409;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=16524;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16408;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16406;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16806;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16410;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=1.71429 WHERE `entry`=16173;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=1.71429 WHERE `entry`=16174;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=1.71429 WHERE `entry`=16175;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=16485;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16470;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16468;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16471;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16460;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16178;
UPDATE `creature_template` SET `speed_walk`=5.6,`speed_run`=4 WHERE `entry`=17225;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16459;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16461;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16177;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=2.14286 WHERE `entry`=15690;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16176;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18654;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16811;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16812;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16473;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=16472;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16492;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16491;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=16504;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16489;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=16595;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=16596;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22519;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22520;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22523;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17305;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17208;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17316;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17317;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=17211;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21664;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21684;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21160;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21683;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21682;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=17469;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21748;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21726;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21747;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21750;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21752;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=17533;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=16816;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21921;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17459;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22524;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17171;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17518;
UPDATE `creature_template` SET `speed_walk`=1.8,`speed_run`=0.64286 WHERE `entry`=17161;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17176;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17168;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17174;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17175;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17172;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17170;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17173;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17169;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16525;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16813;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17229;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=15688;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=16540;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16530;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16529;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16539;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16815;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16814;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16526;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.71429 WHERE `entry`=16544;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.71429 WHERE `entry`=16545;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=15689;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=4.28571 WHERE `entry`=17660;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17644;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17645;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31233;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32207;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.95238 WHERE `entry`=31852;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32336;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=35642;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=24935;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3566;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2959;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10086;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6393;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20499;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8664;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3042;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3039;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3441;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5599;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3038;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3043;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3040;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2960;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3057;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8401;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=12383;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9087;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4046;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5770;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3036;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11833;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4310;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4309;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3037;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9076;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5769;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3034;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3033;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18530;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21905;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19242;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33623;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33616;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19248;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19245;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19252;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33617;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33619;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19251;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19340;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19235;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33621;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19234;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18531;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20613;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19250;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33612;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33611;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19249;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33608;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33614;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19485;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33615;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18568;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33613;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33609;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33610;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33618;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23272;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19236;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19240;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25196;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22013;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19142;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23271;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19153;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=19390;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25195;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19337;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=18549;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24728;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19063;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18537;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19346;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20616;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19138;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19377;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21906;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18538;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=19378;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23433;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18652;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18653;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18600;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18597;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19184;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24393;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=23466;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19045;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=23462;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=23463;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=23461;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=23465;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19047;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22429;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19074;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19051;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19052;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19049;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=23464;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19077;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19271;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18484;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25967;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18762;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18756;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18585;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19270;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19186;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19064;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23948;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19182;
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE `entry`=24412;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24369;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24370;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22442;
UPDATE `creature_template` SET `speed_walk`=0.944444,`speed_run`=0.95238 WHERE `entry`=18584;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20362;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19283;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19289;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=19162;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20384;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19196;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19187;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=17076;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=23131;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16766;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16734;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17202;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17513;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17514;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16632;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16749;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16755;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16706;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18800;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=1.42857 WHERE `entry`=17201;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16756;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17511;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17773;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18350;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18896;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17121;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17509;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16735;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16712;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16738;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=17373;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16761;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17216;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17614;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16721;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21376;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17122;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17505;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20674;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16723;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16741;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16705;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18903;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18901;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18899;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18814;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18900;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18902;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17468;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20382;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17520;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16725;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16722;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16742;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18917;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18919;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18918;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21019;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17436;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18985;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18916;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18915;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17204;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17219;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16710;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16708;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16731;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16774;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18812;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18813;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16757;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17435;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17519;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17431;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18892;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17512;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19778;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20722;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=17538;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16732;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16768;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16709;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16707;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18349;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18924;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18348;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20604;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17120;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16773;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16771;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20121;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16726;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16657;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16713;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16752;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16751;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16740;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16724;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16743;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17504;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.85714 WHERE `entry`=17200;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16715;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16753;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16750;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16762;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16747;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16714;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16728;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16716;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16745;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16763;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16765;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16748;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16729;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16746;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16767;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17555;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18921;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17197;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.92857 WHERE `entry`=17374;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19073;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17530;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=19658;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20846;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20847;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20848;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20849;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20850;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17584;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20914;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.62857 WHERE `entry`=18815;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17196;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18038;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=17372;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17116;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18810;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17228;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17117;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17214;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17215;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17929;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17486;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17930;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17983;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17484;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17480;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17110;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17212;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17483;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17481;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17114;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17232;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17222;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16551;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17360;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16476;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17485;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17488;
UPDATE `creature_template` SET `speed_walk`=0.9 WHERE `entry`=17482;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16553;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17203;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17441;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17442;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17432;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17439;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17490;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17444;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17440;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17445;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17446;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17443;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17452;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17453;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17437;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17438;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17199;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=17217;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17101;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=17278;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=17279;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17243;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=17247;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=17244;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17240;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17242;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17241;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17285;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17246;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17489;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17487;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28968 WHERE `entry`=16225;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17245;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17193;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17194;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17195;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17298;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.85714 WHERE `entry`=17185;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.85714 WHERE `entry`=17183;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=17375;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.85714 WHERE `entry`=17184;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3681;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=25054;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=25055;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12656;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=25013;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4456;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2185;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=25014;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2231;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4192;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10216;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4200;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3644;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6887;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4190;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10085;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2930;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3666;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6737;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4191;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3841;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10219;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2913;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8997;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4187;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3657;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3701;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=24997;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=24996;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12123;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3607;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10118;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=4262;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7907;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7916;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4209;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4208;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4155;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11700;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7316;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15678;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8723;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4088;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7315;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4164;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4087;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11866;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4203;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6142;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20497;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15679;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8026;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8669;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4230;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4170;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7555;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8665;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3469;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4181;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4241;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11709;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14380;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=2041;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14378;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=1996;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2043;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1999;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3605;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6287;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.85714 WHERE `entry`=2162;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.85714 WHERE `entry`=2152;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=10604;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=2151;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6781;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=10606;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3608;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3600;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3567;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4266;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6094;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3614;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3601;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3306;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10051;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3611;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3599;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3609;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11942;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3610;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2081;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3613;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3612;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3598;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2078;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2083;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1419;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6774;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.14286 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=38763;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=32592;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=32343;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=32450;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=27870;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=33238;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=37861;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=33239;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29966;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=24681;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24518;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=23663;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=23665;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26268;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26282;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26335;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26334;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26270;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26414;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26408;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27177;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=28938;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=28255;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_run`=2.57143 WHERE `entry`=28952;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28411;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=30140;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=30007;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28145;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=29133;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26946;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=26948;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=27768;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27577;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=27556;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=27836;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.42857 WHERE `entry`=31293;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=31309;
UPDATE `creature_template` SET `speed_run`=0.14286 WHERE `entry`=32522;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31333;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27363;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=32282;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=32296;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=39173;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32620;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32617;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32625;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32619;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32623;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7567;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32618;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32624;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=30849;
UPDATE `creature_template` SET `speed_run`=0.59524 WHERE `entry`=30875;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20388;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2971;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3233;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2994;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3232;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=4166;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3389;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=3243;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3284;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3282;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5836;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5835;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3445;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3286;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3296;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8404;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7562;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7565;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5640;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12797;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12788;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12790;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12794;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12791;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12793;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12795;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12789;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12798;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19850;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3349;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3370;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5188;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3312;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13842;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3320;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3309;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3314;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3310;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15188;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14376;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12796;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15116;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5611;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6929;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3322;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8673;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9856;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8724;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14377;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3367;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14375;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3329;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3328;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6446;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3331;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3323;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3401;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10880;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14392;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3321;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3317;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3319;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5817;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3313;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3189;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3402;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3216;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3327;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3330;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3334;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5816;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5639;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23635;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3369;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3400;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3399;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3368;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3364;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14726;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3363;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2855;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3315;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3366;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7010;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7088;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5811;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3365;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3316;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6986;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6987;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3404;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3405;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8659;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3345;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11066;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3346;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3347;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3348;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11046;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5875;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3326;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3351;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3350;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5909;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3335;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5815;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3324;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3325;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14304;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5892;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4047;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3403;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3344;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13417;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10540;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3144;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16012;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=23131;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17098;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23128;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4949;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3342;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5910;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=30849;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26575;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32596;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16269;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16276;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=16916;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18929;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16272;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16262;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16924;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15418;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16277;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17005;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15433;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16271;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16267;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15403;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16185;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16266;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16275;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16279;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16186;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15501;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16259;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16258;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16270;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16923;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16257;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18926;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15493;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=15644;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11397;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11916;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5505;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5506;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4984;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5504;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11827;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11828;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5502;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1305;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4160;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4783;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4786;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4784;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4226;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11042;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11041;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=2041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4232;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4233;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4231;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4171;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14725;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6034;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5191;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11081;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4225;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4161;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6292;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11083;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4212;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11050;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5047;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4168;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4159;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=2041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4169;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6286;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4265;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3603;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3604;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12429;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2150;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6780;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3587;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3590;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6091;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3595;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3594;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3514;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3592;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3591;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3588;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3593;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2032;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19050;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19161;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19046;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21518;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19065;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19043;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15303;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15218;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1269;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1268;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5568;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1241;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1690;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1245;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1231;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12427;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1273;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1238;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1240;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10803;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10804;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10610;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10611;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1243;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10805;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1199;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1718;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6782;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1965;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=895;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=926;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1104;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=945;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8416;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=916;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=912;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=837;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=944;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=460;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6376;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=836;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3620;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3170;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3336;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3294;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3172;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3706;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3164;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3173;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3169;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6027;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3099;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3126;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14480;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3110;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3295;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6606;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3285;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3471;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3379;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=3241;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3394;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2972;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2974;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2973;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=2956;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2970;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=14444;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3220;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23618;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3688;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3065;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5940;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3054;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3215;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3055;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=34155;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3690;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3222;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12354;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12355;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3077;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14549;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14550;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14542;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11407;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3080;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3079;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3212;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3685;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3224;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3069;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3081;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3067;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6290;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3076;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3066;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3064;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23616;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2993;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3052;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11944;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3078;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2948;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2947;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6776;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10050;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6747;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5939;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3884;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5938;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2985;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3223;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10721;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3063;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10599;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10600;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3218;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3221;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3217;
UPDATE `creature_template` SET `speed_walk`=0.6,`speed_run`=0.69286 WHERE `entry`=33384;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15124;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10696;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2808;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2789;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2810;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15130;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2812;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2816;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2700;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1471;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2814;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2788;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2835;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14984;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15127;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=30231;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14983;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2608;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2563;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2559;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2592;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2553;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2562;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2579;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=2611;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2764;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4063;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2765;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2560;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2714;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2721;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2578;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2698;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2349;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=2587;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2586;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2589;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2600;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2565;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2564;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2555;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7869;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2570;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2580;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2569;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2612;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=2738;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2552;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2607;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2805;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2584;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24477;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24476;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2590;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2591;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2588;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2558;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2599;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2597;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2783;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2782;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2781;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2780;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2561;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2581;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2582;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4481;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2762;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4479;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4480;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2712;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2619;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2618;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=2713;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2733;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2556;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2793;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2554;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2621;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2792;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9555;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2851;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15128;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15022;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15021;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15126;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2771;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2703;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4954;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2818;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2772;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9976;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=19905;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2820;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9501;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15125;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2821;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6574;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12920;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2787;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=27365;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7044;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=7040;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=7031;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9694;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7045;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=7032;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9563;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9536;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9836;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10267;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3708;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13177;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9544;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10260;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10262;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=2719;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8887;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=9459;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=8977;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7026;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7055;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7027;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7025;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10078;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8979;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=9176;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7029;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9520;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=16043;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=7049;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1135;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1397;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1137;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8508;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1374;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1697;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1120;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1123;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1121;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1124;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1122;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6113;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11807;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3162;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1375;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1134;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15569;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6221;
UPDATE `creature_template` SET `speed_walk`=0.7,`speed_run`=0.8 WHERE `entry`=6886;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1132;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1133;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15102;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15892;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1355;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1255;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1237;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1679;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1256;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1701;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1358;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1977;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1698;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1360;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1119;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=475;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=40;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=80;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=735;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=285;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1922;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1949;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=261;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10616;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=16928;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14284;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11997;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14283;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10987;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11602;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11600;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11657;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12127;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12050;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=10990;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11675;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14026;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13179;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13358;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=10986;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11949;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10981;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11947;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13359;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12053;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12051;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13438;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14030;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14282;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10982;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11603;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13798;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14031;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13439;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10367;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10364;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3625;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2225;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3343;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14186;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14185;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13176;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13218;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13448;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13437;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2 WHERE `entry`=13236;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13284;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14029;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13617;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=13577;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5135;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5139;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14188;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14187;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13257;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11948;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14763;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.71429 WHERE `entry`=13756;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.71429 WHERE `entry`=13778;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.71429 WHERE `entry`=13796;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13816;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12096;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5134;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4255;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4257;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14762;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13447;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13216;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13797;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14027;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13181;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13442;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13443;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=7402;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=3909;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=10557;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12097;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11946;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12122;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12121;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11678;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13097;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14776;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14772;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14777;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14773;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11605;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11604;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14764;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14765;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=11837;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=11838;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=11840;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=11839;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=18828;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=18974;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19764;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17062;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15891;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15895;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15898;
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE `entry`=16938;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=20678;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38889 WHERE `entry`=19354;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=20679;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=16937;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=20677;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=19361;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=19350;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=19188;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=19461;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=16912;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.71429 WHERE `entry`=16927;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20158;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=16994;
UPDATE `creature_template` SET `speed_walk`=1.4 WHERE `entry`=16996;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26125;
UPDATE `creature_template` SET `speed_run`=0.9127 WHERE `entry`=19191;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=19029;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18998;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16789;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17277;
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE `entry`=17725;
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE `entry`=17871;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28571 WHERE `entry`=18409;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28571 WHERE `entry`=17724;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17731;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17734;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17723;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2 WHERE `entry`=20465;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.57143 WHERE `entry`=17770;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17726;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17727;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17730;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17735;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17728;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17729;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17771;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19632;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17732;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1276;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1277;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1197;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1164;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1693;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1185;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1181;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1183;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1180;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1210;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1184;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1188;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1189;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6577;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1283;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1281;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1091;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4844;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4846;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4845;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4851;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2932;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4856;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1205;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=441;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=440;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1083;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=424;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=548;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14270;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4065;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4064;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=436;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4462;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=334;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=335;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=433;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=486;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4464;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=434;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=432;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=568;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=429;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=544;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=545;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=431;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3097;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2697;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6295;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=819;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=397;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=703;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=579;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=446;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=445;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=518;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=435;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=580;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=711;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=345;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=349;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9584;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5509;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5518;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2504;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1721;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=3626;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12785;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4961;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1326;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6946;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=332;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=918;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12783;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1341;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1323;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1324;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=914;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5480;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5479;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1325;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7207;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7208;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13283;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8383;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5483;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5482;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=842;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7067;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=98;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=124;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=453;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=590;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=619;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=589;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=452;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=115;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=123;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=114;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6250;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=504;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=458;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=1426;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=95;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=117;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=500;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=480;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1236;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=126;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=830;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=513;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=456;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=28709;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=28510;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=28487;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29047;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=28528;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28530;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25462;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28611;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28765;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28683;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33384;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=1.5873 WHERE `entry`=37859;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32601;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31033;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33543;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=36102;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=36101;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=35330;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32656;
UPDATE `creature_template` SET `speed_run`=3.42857 WHERE `entry`=29264;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1778;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1765;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=1866;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1769;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=1865;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1797;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1867;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1912;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=10780;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1914;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1913;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1924;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1923;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1896;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1893;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3533;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1891;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1782;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1779;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6570;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=1939;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1940;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=1943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1909;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6033;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1768;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1767;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1766;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=1770;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7489;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3556;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=1868;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=1869;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=1870;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=1953;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1958;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=1955;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=1956;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1957;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=1954;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18165;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2628;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1908;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1889;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1888;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3577;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8385;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1536;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5624;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4570;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4554;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15105;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4571;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5821;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16096;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25102;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25105;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25077;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31708;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=25075;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3100;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3123;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=3127;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25074;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25071;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25070;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25072;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25076;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=25083;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=25079;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=24934;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9564;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12136;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24926;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24930;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24924;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=25081;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24931;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24927;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=25080;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24929;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=3197;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=10685;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19175;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14843;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19177;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=33219;
UPDATE `creature_template` SET `speed_walk`=0.4 WHERE `entry`=7395;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11320;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=11321;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11319;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11834;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11322;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11323;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11324;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11520;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11519;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11518;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=14873;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3268;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3267;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5834;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3341;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7874;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7895;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4530;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4514;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4541;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4436;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4520;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4442;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4511;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4512;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4424;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4523;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4516;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4535;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4519;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4531;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4532;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4515;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=4528;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4522;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4440;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4428;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4526;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6035;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4623;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6168;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4518;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4525;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4534;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4420;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4438;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4435;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4437;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4508;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4538;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4539;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4427;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4625;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4425;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4422;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4421;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=5800;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=5797;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=5799;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=5798;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3261;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3396;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3397;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3274;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4316;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3680;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=3631;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3633;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3638;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3641;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8418;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=5874;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14285;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=10986;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11675;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=19906;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2258;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13776;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13219;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13817;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13840;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14962;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2351;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2241;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2240;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19176;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=3284;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11998;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11678;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13180;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=14752;
UPDATE `creature_template` SET `speed_walk`=0.4,`speed_run`=0.45714 WHERE `entry`=89;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3333;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7951;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3332;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4485;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3359;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3353;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3354;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3410;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2857;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3357;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3412;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9317;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14451;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3413;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3358;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11017;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19912;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3408;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3355;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11176;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7793;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7792;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5812;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10266;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3356;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7230;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11178;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11177;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7790;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1383;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=14499;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=17076;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4574;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5675;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4578;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1498;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2492;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4563;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4567;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4564;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4568;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4575;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5753;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4566;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4565;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5693;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4573;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4576;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11048;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4577;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2308;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7825;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14729;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4580;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11049;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5754;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4581;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6741;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10053;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6293;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15683;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15676;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15682;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4562;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19178;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23713;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4603;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4592;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15675;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4569;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4585;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5052;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10781;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4613;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4589;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4588;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4555;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=223;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5820;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4591;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8403;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5190;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7087;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4486;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8672;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8721;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2459;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4551;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4590;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2458;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4775;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4549;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=5950;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5651;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4552;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4561;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4558;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15686;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10879;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6411;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4556;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4557;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4597;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2050;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15684;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4553;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4559;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4601;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4600;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4596;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4560;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5819;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4602;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11067;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4616;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4617;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7683;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4615;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4614;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4605;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=5674;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11870;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5698;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4604;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4599;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4598;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5697;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23103;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5679;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=5652;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6395;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4606;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4608;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4607;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4593;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4595;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4594;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1537;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1662;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2356;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2359;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2358;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=29264;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13328;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13534;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13537;
UPDATE `creature_template` SET `speed_walk`=4.8,`speed_run`=4.28571 WHERE `entry`=13178;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13326;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=2384;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2249;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2248;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13841;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=2386;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13217;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2396;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=5727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18372;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=7416;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=15352;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4488;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5733;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2934;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32597;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19312;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19443;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=22401;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=19440;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=21173;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=20815;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=22402;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=20814;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=22403;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=20816;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=20813;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=21182;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=15464;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=16927;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18942;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17015;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13321;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18130;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.95238 WHERE `entry`=20387;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18910;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18011;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18243;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18012;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18016;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20762;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18134;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22125;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22126;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22124;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17834;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21172;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17896;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17904;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17841;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18993;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18907;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17901;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18132;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18332;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18911;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17858;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18213;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17909;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=22843;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22832;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=19189;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18905;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16794;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18997;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16793;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.71429 WHERE `entry`=17230;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16795;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.71429 WHERE `entry`=17250;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.71429 WHERE `entry`=17251;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16790;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16792;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16791;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.71429 WHERE `entry`=17226;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16851;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16850;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16993;
UPDATE `creature_template` SET `speed_walk`=1.4,`speed_run`=1.42857 WHERE `entry`=17034;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3352;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3407;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3406;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=4752;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3362;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=356;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14540;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12353;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12351;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14539;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14541;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=5195;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10088;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14182;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16076;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20385;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31726;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31727;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=3275;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=5841;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10668;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6247;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6244;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=3444;
UPDATE `creature_template` SET `speed_walk`=1.555556,`speed_run`=0.85714 WHERE `entry`=4120;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11818;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8142;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4544;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11752;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7875;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5390;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8144;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9986;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8145;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8159;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7777;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14373;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7854;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11098;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8115;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7726;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7997;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5307;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=5241;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=5236;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=5239;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=5238;
UPDATE `creature_template` SET `speed_run`=2.57143 WHERE `entry`=15185;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=11744;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=11738;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=11724;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=11698;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15184;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33543;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16980;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=34990;
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=1.71429 WHERE `entry`=34496;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=2.14286 WHERE `entry`=34564;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.71429 WHERE `entry`=35763;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32598;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32596;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15471;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15473;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15338;
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=2.28571 WHERE `entry`=15344;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15387;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15385;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15388;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15325;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.14286 WHERE `entry`=15341;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15324;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=1.71429 WHERE `entry`=15335;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15323;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15320;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.42857 WHERE `entry`=15370;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15333;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15336;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=15327;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=15343;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.14286 WHERE `entry`=15348;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15392;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15391;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15389;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15390;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15386;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15319;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15318;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=2.14286 WHERE `entry`=15369;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=15355;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15339;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=0.57143 WHERE `entry`=15428;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2977;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2976;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2958;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2988;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.85714 WHERE `entry`=2967;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=4120;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4147;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4483;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5937;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4151;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4150;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7824;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=9460;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16417;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5419;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=5428;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=9165;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6556;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9162;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=6517;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=6527;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=6519;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=6518;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9618;
UPDATE `creature_template` SET `speed_walk`=1.5 WHERE `entry`=28092;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8737;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9270;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9998;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9271;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9997;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9272;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3000;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12959;
UPDATE `creature_template` SET `speed_walk`=2.32,`speed_run`=0.82857 WHERE `entry`=9273;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9118;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10977;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9119;
UPDATE `creature_template` SET `speed_walk`=2.32,`speed_run`=0.82857 WHERE `entry`=9274;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9157;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=9167;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6560;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11805;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13220;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11722;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6467;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6566;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=29312;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30857;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.19048 WHERE `entry`=31010;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.99206 WHERE `entry`=31008;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=29313;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=29316;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31011;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=31009;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=30896;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=29395;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=31007;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=29266;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=29315;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=29314;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30679;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=30695;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=30667;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.99206 WHERE `entry`=30668;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=32191;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32601;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3513;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3505;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3509;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3507;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3512;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3511;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3508;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=957;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5413;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7798;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5511;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5514;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5513;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=39624;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=39466;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14842;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=39396;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=39711;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=39817;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1645;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1249;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=5873;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=842;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1669;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=550;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1424;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32598;
UPDATE `creature_template` SET `speed_run`=0.9127 WHERE `entry`=37862;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=40198;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=30849;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=29124;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28113;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=28217;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28139;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29146;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29122;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29014;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29015;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31911;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28138;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=25432;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=25433;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=25455;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=27074;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=25326;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=25419;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=25418;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=25880;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25834;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25838;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25986;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=26098;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=27365;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4586;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4587;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11031;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4582;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4584;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5204;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13839;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11750;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4609;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5735;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5738;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4610;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5734;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10136;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2055;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8390;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11835;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4611;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8393;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6522;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29793;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=29755;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29551;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=30011;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16554;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=16921;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=16517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3838;
UPDATE `creature_template` SET `speed_walk`=0.5,`speed_run`=0.57143 WHERE `entry`=32342;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26260;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=24196;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=23919;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=23550;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23680;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23750;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=24785;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26196;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26456;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=26448;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26837;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26455;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=26477;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=32572;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26402;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26413;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=25715;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=25452;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25454;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=26725;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=25226;
UPDATE `creature_template` SET `speed_walk`=0.5,`speed_run`=0.28571 WHERE `entry`=31438;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17191;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17190;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17192;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17475;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17326;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17325;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17327;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17525;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17343;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17347;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17352;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=10779;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17666;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17553;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18028;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17433;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18811;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17642;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17663;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=18803;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17684;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17844;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17434;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18029;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18427;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18030;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17676;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17667;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=17549;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18804;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17554;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17843;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17883;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18024;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18022;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18026;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17703;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17974;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17824;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17424;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17825;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17659;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17658;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17988;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18021;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17423;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18020;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=690;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1744;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.85714 WHERE `entry`=10716;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12428;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1941;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11044;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5680;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5681;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=5685;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5686;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=14421;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15113;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15011;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1.388888,`speed_run`=0.85714 WHERE `entry`=2964;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2978;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3683;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3684;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3632;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=3630;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=12034;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3122;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=10357;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=26539;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=3150;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9566;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5728;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=846;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=874;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=740;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=741;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6006;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5990;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=7363;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=5977;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=4968;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=23899;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=23835;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=23900;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5419;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=9396;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20278;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19860;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19859;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7876;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9985;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7407;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7408;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7763;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14743;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11758;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16014;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7733;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=21448;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8126;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8125;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=8883;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=8885;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=8882;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=8884;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=6506;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=9166;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14460;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9999;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=15545;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11723;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14475;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11721;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14455;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11880;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11881;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11882;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=11746;
UPDATE `creature_template` SET `speed_walk`=1.4,`speed_run`=1.42857 WHERE `entry`=14478;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=32592;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=40198;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32601;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=18497;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=18371;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18726;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18493;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18495;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18778;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18558;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18499;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18500;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18498;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18503;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18501;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18557;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18506;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18556;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18521;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18524;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18700;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18702;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=18373;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21963;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18309;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18311;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18313;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18344;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18341;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18317;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=19306;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=19307;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18331;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18343;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18314;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18312;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18315;
UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=1.42857 WHERE `entry`=18431;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19671;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19666;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=10986;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11675;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2258;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11678;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2359;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=15352;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19511;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=17977;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19509;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19598;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17993;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19865;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19513;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19507;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18884;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19166;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19167;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=19218;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20990;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=19219;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20988;
UPDATE `creature_template` SET `speed_walk`=0.944444,`speed_run`=0.95238 WHERE `entry`=19713;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19716;
UPDATE `creature_template` SET `speed_walk`=0.944444,`speed_run`=0.95238 WHERE `entry`=19712;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20059;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19735;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19168;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=19710;
UPDATE `creature_template` SET `speed_walk`=0.944444,`speed_run`=0.95238 WHERE `entry`=19231;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=19221;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19220;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20796;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=22494;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22491;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22479;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20515;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=20673;
UPDATE `creature_template` SET `speed_walk`=8,`speed_run`=2.85714 WHERE `entry`=19727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19939;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20207;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20140;
UPDATE `creature_template` SET `speed_walk`=0.7,`speed_run`=0.25 WHERE `entry`=19731;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20435;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19686;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18883;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19940;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=18879;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=18880;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21262;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19852;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20215;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19853;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=20210;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21261;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21259;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19634;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18864;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19610;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21732;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21733;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21734;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=20485;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19709;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21997;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22063;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20389;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19574;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21974;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19576;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=19541;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19575;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19621;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19655;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19645;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19654;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21751;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19845;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19570;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19651;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=20484;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19612;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19571;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19737;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19776;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17636;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19880;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19623;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19617;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19780;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19469;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19467;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19468;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19466;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23396;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19572;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21493;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22279;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22280;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19217;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19482;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20162;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19573;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18938;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=19948;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20058;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21349;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=19952;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=21033;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20748;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21142;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19479;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21311;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10204;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21147;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28571 WHERE `entry`=21984;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21117;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19472;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19837;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18248;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19474;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19473;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19470;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19471;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23280;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18953;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19450;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19478;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=19957;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22052;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21352;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=19995;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21074;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20713;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=21022;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=20126;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19500;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19943;
UPDATE `creature_template` SET `speed_walk`=1.4,`speed_run`=1.42857 WHERE `entry`=20109;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19944;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=22180;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23076;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=22204;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22298;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=19973;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19730;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19729;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18115;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18116;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18133;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20003;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20093;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20024;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20023;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19945;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20113;
UPDATE `creature_template` SET `speed_walk`=1.4,`speed_run`=1.42857 WHERE `entry`=20127;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21023;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=21516;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=21519;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=22123;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21737;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=20766;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22495;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.14286 WHERE `entry`=22423;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=22443;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20751;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.9127 WHERE `entry`=19747;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=20749;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=21659;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21837;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=20600;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20338;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19483;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19484;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18852;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18857;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19643;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18855;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18853;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20333;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=18881;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20392;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.35714 WHERE `entry`=19692;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19832;
UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=2.57143 WHERE `entry`=19849;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20404;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20134;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18850;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20136;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20135;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19620;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19618;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19619;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20226;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20397;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18856;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19723;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19707;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20221;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19724;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19926;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=20411;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28571 WHERE `entry`=20495;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21065;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=20142;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=15192;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5420;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=28163;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=28132;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=17862;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=18644;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=21140;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21818;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=17892;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=21136;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=17835;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8198;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6014;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6018;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5994;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3373;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5882;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7311;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5958;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5885;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5883;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18197;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=18128;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.95238 WHERE `entry`=18129;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22039;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22306;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22044;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5420;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=5465;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18644;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=20429;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18457;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18456;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=22307;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=89;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18142;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19660;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=19068;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19646;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18489;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=18299;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19015;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=18296;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18293;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18292;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20097;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18301;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18302;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18066;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28968 WHERE `entry`=17153;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=18102;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23108;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19734;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6497;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=29302;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=26540;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23945;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=1921;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=23780;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24041;
UPDATE `creature_template` SET `speed_run`=0.92857 WHERE `entry`=24156;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=23776;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=24128;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=25107;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25104;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25100;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25101;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=25106;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25103;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3190;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=34765;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=26537;
UPDATE `creature_template` SET `speed_walk`=1.388888,`speed_run`=0.85714 WHERE `entry`=3116;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=3118;
UPDATE `creature_template` SET `speed_walk`=1.388888,`speed_run`=0.85714 WHERE `entry`=3117;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=26047;
UPDATE `creature_template` SET `speed_run`=4.28571 WHERE `entry`=25286;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=18380;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=26538;
UPDATE `creature_template` SET `speed_walk`=1.388888,`speed_run`=0.49603 WHERE `entry`=25269;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=25256;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=18378;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=18379;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=25446;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=25426;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=25611;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=25624;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9990;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=3108;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=24137;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=23998;
UPDATE `creature_template` SET `speed_run`=5.71429 WHERE `entry`=23805;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23968;
UPDATE `creature_template` SET `speed_run`=0.78571 WHERE `entry`=23784;
UPDATE `creature_template` SET `speed_run`=2.57143 WHERE `entry`=24238;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=24215;
UPDATE `creature_template` SET `speed_run`=0.78571 WHERE `entry`=24081;
UPDATE `creature_template` SET `speed_run`=0.78571 WHERE `entry`=24164;
UPDATE `creature_template` SET `speed_run`=0.78571 WHERE `entry`=24168;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=24768;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23750;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=24160;
UPDATE `creature_template` SET `speed_walk`=1.444444,`speed_run`=1.5873 WHERE `entry`=23688;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23882;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23680;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=27699;
UPDATE `creature_template` SET `speed_run`=1.85714 WHERE `entry`=24142;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=7469;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=23919;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=23875;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=24638;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=24261;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=33303;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=7368;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=10991;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=10986;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11675;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=24196;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32601;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32597;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=40281;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.99206 WHERE `entry`=10181;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19909;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15007;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2227;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20406;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16287;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=15107;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=30230;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=15062;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=29134;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14645;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.71429 WHERE `entry`=14732;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=23584;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2 WHERE `entry`=23597;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2 WHERE `entry`=23596;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24312;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23586;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=23774;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=23834;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23817;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24363;
UPDATE `creature_template` SET `speed_walk`=0.5,`speed_run`=1 WHERE `entry`=24059;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2 WHERE `entry`=24064;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2 WHERE `entry`=24065;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=24047;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=24043;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.14286 WHERE `entry`=23578;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=24180;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=2.14286 WHERE `entry`=23574;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=24159;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=24225;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=24179;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=24480;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=23879;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=23877;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=2.14286 WHERE `entry`=24239;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23790;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.14286 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5677;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25037;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=25045;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24994;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25047;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25161;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=25174;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24980;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25036;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25061;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25057;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25133;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25034;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25112;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.28571 WHERE `entry`=26253;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24991;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.85714 WHERE `entry`=25063;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24967;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24965;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24813;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25032;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24978;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25108;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25069;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=26089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=26091;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=26090;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=26092;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23409;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24999;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=25001;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24976;
UPDATE `creature_template` SET `speed_walk`=0.4,`speed_run`=1.38889 WHERE `entry`=25002;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=25163;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25046;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25043;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24975;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25950;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25088;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25162;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24966;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24960;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.57143 WHERE `entry`=25175;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25976;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25977;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25170;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25172;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25169;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25132;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24683;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24686;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24687;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24554;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24559;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24556;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24561;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24685;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24684;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24698;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24815;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24697;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=24722;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24560;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=24777;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=24696;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24688;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24689;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24690;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=24761;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24822;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24781;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24762;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24744;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25042;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=25960;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24848;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=24972;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25059;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=26560;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=24553;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20274;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20273;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20395;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20339;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=19163;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=19162;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17269;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17271;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17259;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=17280;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17264;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17270;
UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=2.57143 WHERE `entry`=17307;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=17306;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17309;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=17308;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17281;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17478;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17455;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=17537;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=22258;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22260;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22267;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22259;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22273;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17370;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17477;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17397;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17491;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17653;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17256;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17371;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17626;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=21174;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17377;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17395;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17380;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17416;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17414;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17624;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17429;
UPDATE `creature_template` SET `speed_walk`=0.944444,`speed_run`=1.42857 WHERE `entry`=17381;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17398;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19016;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=18894;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17401;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=17400;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=25062;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3056;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=4068;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24922;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18461;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=18750;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25580;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=18600;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24979;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25003;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=25156;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=32261;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=1.14286 WHERE `entry`=26722;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26723;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=1.14286 WHERE `entry`=26716;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=26731;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=26727;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.19048 WHERE `entry`=26730;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=22517;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=6012;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=7414;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30276;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30278;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30277;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30286;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30288;
UPDATE `creature_template` SET `speed_run`=0.9127 WHERE `entry`=30413;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1 WHERE `entry`=30623;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18430;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18559;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=26316;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2359;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2473;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2474;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=0.71429 WHERE `entry`=7806;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2505;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7977;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14730;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17598;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14737;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14741;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14731;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14734;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14739;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14738;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14740;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4314;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10905;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=11873;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1852;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10904;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11615;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11608;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11055;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17099;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11022;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10856;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11057;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10839;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10837;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=17306;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=21391;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28730;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28729;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28731;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28732;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28733;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29335;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_walk`=0.5,`speed_run`=0.69286 WHERE `entry`=18706;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.71429 WHERE `entry`=24674;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=27925;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=27009;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=27005;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27712;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=27290;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=26607;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26653;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=26316;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=3573;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31170;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=3149;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5814;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1404;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3624;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=1064;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12137;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16094;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7485;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1147;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2465;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1149;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1385;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2464;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1382;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17094;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1387;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1148;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2856;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1381;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2497;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2519;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1146;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=1085;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=682;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=688;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=741;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=740;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=755;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=757;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=988;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12807;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1386;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=986;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8177;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=989;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1775;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6026;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7643;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=982;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5591;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10049;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=985;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=987;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17109;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=983;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=27705;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6930;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1443;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7623;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1442;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5416;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5546;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=745;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14356;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5243;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5261;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5224;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=744;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5263;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5225;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=14445;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=746;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=8319;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5228;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5226;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8311;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=5277;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5259;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5267;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8257;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=8384;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=5280;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5712;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5715;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=5256;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=5283;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5270;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8656;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8657;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8658;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5271;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5713;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5273;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5710;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5711;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5717;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5714;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5722;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5719;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5709;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5708;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8336;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5716;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5291;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8437;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8438;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=8497;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5721;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5720;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.14286 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32598;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33543;
UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=0.99206 WHERE `entry`=32487;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=34907;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26455;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=26477;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=25040;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=10986;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11675;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=26370;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=27165;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26501;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=26349;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26662;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=26509;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=26365;
UPDATE `creature_template` SET `speed_walk`=0.333334,`speed_run`=0.47619 WHERE `entry`=26711;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13316;
UPDATE `creature_template` SET `speed_walk`=2.4 WHERE `entry`=26838;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26455;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=10986;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11675;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=27165;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26501;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32598;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=30849;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=29124;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28113;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=28215;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28082;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28315;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28078;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28079;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=28106;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29222;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29130;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29131;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29132;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=28191;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=28862;
UPDATE `creature_template` SET `speed_run`=0.59524 WHERE `entry`=28858;
UPDATE `creature_template` SET `speed_run`=0.59524 WHERE `entry`=30872;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26606;
UPDATE `creature_template` SET `speed_run`=1.90476 WHERE `entry`=26607;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=26770;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=26769;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=26771;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26455;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=26477;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.95238 WHERE `entry`=26711;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=26858;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=27843;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=26316;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26575;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26577;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=27768;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=27836;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=27272;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28014;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=27028;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=27007;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=2 WHERE `entry`=26858;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=26926;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=27537;
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=2 WHERE `entry`=31291;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26577;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26575;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26578;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20272;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=19163;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=19164;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20269;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=18912;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=17156;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18200;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18180;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18218;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18895;
UPDATE `creature_template` SET `speed_run`=0.14286 WHERE `entry`=24222;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18897;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=18062;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28968 WHERE `entry`=17154;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.14286 WHERE `entry`=18192;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21474;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21483;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21484;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18264;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18821;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18816;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28968 WHERE `entry`=17155;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18240;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18215;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18207;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18202;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18203;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18208;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28968 WHERE `entry`=18145;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18688;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.14286 WHERE `entry`=18256;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18822;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18817;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21485;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21487;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21488;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18789;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=20240;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20072;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19019;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=19030;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18914;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=19027;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=17157;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=27272;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=27836;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5419;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=6507;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=6508;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32596;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32598;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32601;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=32321;
UPDATE `creature_template` SET `speed_walk`=1.444444,`speed_run`=1.5873 WHERE `entry`=37858;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1860;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32655;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=32592;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=32342;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31174;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=1.71429 WHERE `entry`=34497;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=0.71429 WHERE `entry`=34605;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29147;
UPDATE `creature_template` SET `speed_walk`=0.9,`speed_run`=1.03929 WHERE `entry`=33383;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23627;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24766;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23521;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23482;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23628;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23710;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23703;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23486;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23522;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24710;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23525;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24468;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23558;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=24462;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=24463;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23481;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23511;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=23894;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=24536;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=23709;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=39466;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=39624;
UPDATE `creature_template` SET `speed_walk`=0.5,`speed_run`=0.57143 WHERE `entry`=31216;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=12996;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1129;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=24842;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=24841;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14560;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14561;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14559;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3824;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=3743;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=3750;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=3749;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=3746;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10559;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2236;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2187;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2233;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2205;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2235;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2174;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2203;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2232;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2204;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=2202;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2234;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7015;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2163;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=2321;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19171;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4186;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11037;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6299;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3649;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6300;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6301;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6297;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6298;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4193;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4185;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4183;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4182;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3702;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4189;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3562;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19173;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=2041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4423;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4167;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4215;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4214;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4163;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4730;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4753;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14555;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14556;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=14602;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12359;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12358;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=12360;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=35168;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4205;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4244;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4138;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4243;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10056;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4146;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2796;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3561;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4219;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7296;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4220;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4218;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3516;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9047;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4217;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=14379;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10878;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4223;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2879;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5515;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5516;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11069;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6579;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24729;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5519;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11026;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13018;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10956;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10942;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.14286 WHERE `entry`=14121;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5186;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.71429 WHERE `entry`=13016;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12997;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24501;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=19164;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7740;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4092;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4165;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17105;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7999;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8396;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11401;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=36481;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4090;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4091;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2912;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7313;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4204;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4221;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4222;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=2041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3219;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23533;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2964;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5865;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=3284;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24499;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23604;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24498;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23605;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24657;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23603;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24711;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23606;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24497;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=27707;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15012;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15115;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=3116;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3293;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=24753;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=3130;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=14857;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=14892;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2964;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=5785;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=2979;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2706;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2819;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12923;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12924;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2440;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2252;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2253;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2243;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2245;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2247;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=15649;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15971;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15970;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18951;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=15651;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=3116;
UPDATE `creature_template` SET `speed_walk`=1.388888,`speed_run`=0.85714 WHERE `entry`=3115;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3195;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=503;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=785;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=787;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=311;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=893;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10037;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=441;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=17076;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=23131;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=4242;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4216;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4236;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4240;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4177;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4172;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4234;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=2041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4156;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4210;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4211;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6735;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4229;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4228;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11070;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4213;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3468;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4521;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4235;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4173;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4175;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4180;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=28937;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=28897;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=28903;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28911;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=28919;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28943;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=2.57143 WHERE `entry`=28906;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28936;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=28905;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28898;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=28893;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28909;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28901;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28908;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28907;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32541;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28760;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=28890;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=2.57143 WHERE `entry`=29501;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=28506;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28444;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=28357;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28488;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=28506;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28356;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=28405;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=28653;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=28377;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=28506;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=29232;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=28611;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=28845;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=28768;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=28819;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=28821;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=28850;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28846;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=27365;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=572;
UPDATE `creature_template` SET `speed_run`=3.14286 WHERE `entry`=26287;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27953;
UPDATE `creature_template` SET `speed_walk`=0.888888,`speed_run`=0.99206 WHERE `entry`=32572;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=25715;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=25514;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=27165;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26455;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26501;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=27290;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=27762;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27272;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=28264;
UPDATE `creature_template` SET `speed_run`=0.59524 WHERE `entry`=27382;
UPDATE `creature_template` SET `speed_walk`=0.333334,`speed_run`=0.47619 WHERE `entry`=26711;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=26926;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=27004;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=27537;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1092;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1089;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1329;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1330;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6030;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1090;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1173;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=1279;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1343;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1336;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1334;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1335;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1332;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1362;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1331;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1342;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2105;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2468;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2469;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2528;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1222;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1175;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1254;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=1201;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1271;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29304;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=29834;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28411;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=28526;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28411;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=40198;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28145;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28145;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=30014;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28411;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=30864;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=30263;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=33291;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=33289;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=27768;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=27766;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=27836;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=24516;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=347;
UPDATE `creature_template` SET `speed_walk`=0.2 WHERE `entry`=21628;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21641;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20386;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=5843;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8283;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8279;
UPDATE `creature_template` SET `speed_run`=2.85714 WHERE `entry`=8964;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=10371;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=10372;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=10083;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=9096;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=10363;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=10442;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=9816;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=10740;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=10258;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=10683;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=10429;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=10366;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16048;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=9568;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=9268;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9267;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9240;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10257;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9701;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10177;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=9217;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9717;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9716;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8888;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=4120;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5899;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.85714 WHERE `entry`=3068;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3058;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=29019;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10996;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12202;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=37888;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10903;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=11075;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1529;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1495;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6289;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3549;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1805;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11885;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11878;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9447;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9449;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9452;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.28571 WHERE `entry`=11710;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1855;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8558;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8557;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12033;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12338;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11823;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12030;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11105;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10182;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12045;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11624;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11106;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12027;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11877;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12340;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12028;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11562;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=13699;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11563;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.57143 WHERE `entry`=31438;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31265;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=31323;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=31320;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.95238 WHERE `entry`=26711;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=27953;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=27768;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=2.14286 WHERE `entry`=27766;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26583;
UPDATE `creature_template` SET `speed_walk`=4 WHERE `entry`=24019;
UPDATE `creature_template` SET `speed_run`=1.28968 WHERE `entry`=24073;
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE `entry`=23992;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=24029;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_walk`=0.5,`speed_run`=0.57143 WHERE `entry`=30387;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=30160;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30291;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31265;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=30703;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=29333;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=29329;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=29710;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=29621;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.99206 WHERE `entry`=29400;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=25269;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=25427;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=25430;
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE `entry`=22985;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=11996;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=531;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29611;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1416;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7232;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=2041;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=36607;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1201;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1130;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=3836;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=27537;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=26316;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26577;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26575;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26360;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32598;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31265;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21151;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21158;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21469;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21197;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19495;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22469;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=20126;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19498;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19499;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21066;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19497;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18937;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21176;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=20095;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=19991;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18581;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17634;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18788;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19694;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18004;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18250;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18251;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18003;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18007;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18295;
UPDATE `creature_template` SET `speed_run`=0.14286 WHERE `entry`=17378;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18138;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19590;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18294;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18297;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=17156;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19035;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19041;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=18062;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=17157;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=2.57143 WHERE `entry`=18411;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18210;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18211;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18417;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.85714 WHERE `entry`=18418;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21893;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19201;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18258;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18964;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18414;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18415;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18229;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.38571 WHERE `entry`=17129;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=2.28571 WHERE `entry`=18257;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18037;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17151;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18589;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=21233;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17152;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18135;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18125;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18127;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18131;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19519;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=20270;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18114;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.95238 WHERE `entry`=18201;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18113;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=20292;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=20291;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18046;
UPDATE `creature_template` SET `speed_run`=0.92857 WHERE `entry`=17969;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18079;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18042;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18077;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18005;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18006;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18909;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17637;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18791;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18564;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18151;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18150;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18247;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18014;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18275;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18017;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18091;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18246;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19380;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18018;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19383;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18285;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=20295;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17924;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22088;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22087;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22086;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17877;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17856;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=18140;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=18139;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=22823;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17866;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17857;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17925;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=18382;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20198;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=20293;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32601;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17875;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17324;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17604;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17322;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17323;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17350;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17344;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17348;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=17664;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17986;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.92857 WHERE `entry`=17982;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=17527;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17926;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17927;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17346;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17608;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17353;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17607;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17609;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17610;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=5929;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=25618;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=25880;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=24567;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=24469;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=25501;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28113;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=29124;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=28107;
UPDATE `creature_template` SET `speed_run`=0.95238 WHERE `entry`=25862;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=24681;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=27748;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=27550;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26455;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=25715;
UPDATE `creature_template` SET `speed_walk`=0.5,`speed_run`=0.5 WHERE `entry`=26452;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=27365;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21465;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21807;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19362;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19355;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.28571 WHERE `entry`=21153;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21769;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21938;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21417;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19348;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21749;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21419;
UPDATE `creature_template` SET `speed_walk`=0.944444,`speed_run`=0.95238 WHERE `entry`=19755;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19740;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38889 WHERE `entry`=21314;
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=1.71429 WHERE `entry`=21404;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.28571 WHERE `entry`=19364;
UPDATE `creature_template` SET `speed_walk`=0.944444,`speed_run`=0.95238 WHERE `entry`=21499;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21305;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21403;
UPDATE `creature_template` SET `speed_walk`=0.777776,`speed_run`=0.99206 WHERE `entry`=21501;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21348;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.35714 WHERE `entry`=21316;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21302;
UPDATE `creature_template` SET `speed_walk`=0.777776,`speed_run`=0.99206 WHERE `entry`=21500;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21512;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20683;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21245;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21244;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21249;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.28571 WHERE `entry`=22228;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=461;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5495;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5520;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5496;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1435;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1733;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6122;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=6267;
UPDATE `creature_template` SET `speed_walk`=0.7,`speed_run`=0.8 WHERE `entry`=6492;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=844;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=233;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=235;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=450;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=596;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=599;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32601;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31768;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=25209;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=25715;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=26448;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26455;
UPDATE `creature_template` SET `speed_walk`=0.888888 WHERE `entry`=26477;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=26501;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=24681;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23680;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=23919;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=26418;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28411;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30446;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29964;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.38571 WHERE `entry`=33383;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=40198;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5420;
UPDATE `creature_template` SET `speed_walk`=1.4,`speed_run`=1.42857 WHERE `entry`=5429;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5419;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=9396;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8208;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8199;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.21429 WHERE `entry`=9683;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=1.71429 WHERE `entry`=6498;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5304;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=5347;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=5300;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5292;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5361;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7764;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7904;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7900;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7903;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7943;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7945;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7877;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3936;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7775;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=7765;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=5362;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=5363;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=4647;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4728;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=11564;
UPDATE `creature_template` SET `speed_walk`=1.111112,`speed_run`=0.71429 WHERE `entry`=4729;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11596;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=4633;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=4632;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=4635;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=4637;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=1.42857 WHERE `entry`=4636;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1322;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=13698;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4030;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4041;
UPDATE `creature_template` SET `speed_walk`=1.555556,`speed_run`=0.85714 WHERE `entry`=4035;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=4027;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=4026;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4042;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=4025;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4044;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=4022;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4057;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=3994;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=3722;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=1011;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=2595;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4782;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7744;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=7423;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=7403;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=3908;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10698;
UPDATE `creature_template` SET `speed_walk`=2,`speed_run`=1.42857 WHERE `entry`=24410;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18446;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18492;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18457;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=18456;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17143;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=17142;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18999;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18389;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21399;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19053;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21400;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18704;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19159;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19042;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19000;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.28571 WHERE `entry`=19003;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19056;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21397;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21398;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24885;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19154;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19147;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19038;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19296;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19773;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18459;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19181;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=15991;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18390;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18713;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18387;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18809;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18252;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=16810;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16772;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=18595;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18583;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22265;
UPDATE `creature_template` SET `speed_walk`=0.6,`speed_run`=0.21429 WHERE `entry`=17407;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.19048 WHERE `entry`=21878;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21408;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.71429 WHERE `entry`=21879;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19802;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19351;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19387;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19388;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19384;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.85714 WHERE `entry`=19382;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20505;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21775;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19372;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19352;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20510;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20511;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21773;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=21937;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20503;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20504;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20506;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20507;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20508;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=20509;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19394;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19395;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19368;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=24868;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19374;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19370;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18939;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21777;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19373;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=19379;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19375;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21774;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22042;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21357;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=21050;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21061;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21462;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=21704;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20431;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22017;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22016;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=19824;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=22018;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21953;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19504;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=2.28571 WHERE `entry`=21648;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22070;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22066;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19626;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21744;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19628;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22071;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22211;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21955;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21954;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23443;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19521;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19518;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19625;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19520;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19627;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21766;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19517;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23434;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=2.85714 WHERE `entry`=21657;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20502;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19792;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19796;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=19806;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21293;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21450;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19825;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21385;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21384;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22138;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22139;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22146;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=22137;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19369;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19371;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21725;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21727;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21080;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=20887;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20878;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20872;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22024;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21359;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19341;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=21244;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=21245;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18745;
UPDATE `creature_template` SET `speed_walk`=0.8 WHERE `entry`=23102;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=22307;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=21661;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21660;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18305;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17135;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18369;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=17134;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=17156;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19402;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18124;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19706;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=20283;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21203;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=21189;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=21004;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21814;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22090;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=21944;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=21413;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21819;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21423;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21234;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21107;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21115;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=21935;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21755;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21691;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21824;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=21393;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21114;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21152;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21112;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21110;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21113;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21460;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21461;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21111;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21422;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21426;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.38571 WHERE `entry`=21427;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21118;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21441;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.99206 WHERE `entry`=21930;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=21447;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19979;
UPDATE `creature_template` SET `speed_walk`=0.944444,`speed_run`=0.95238 WHERE `entry`=19978;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.71429 WHERE `entry`=21032;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=20028;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18009;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18019;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18908;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18008;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=19722;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1 WHERE `entry`=18010;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=22485;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=30864;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29459;
UPDATE `creature_template` SET `speed_run`=1.07143 WHERE `entry`=29450;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29451;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29647;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=29133;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=28221;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28145;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28411;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=23776;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=23550;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23680;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23750;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23688;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=24238;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=23919;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=23875;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=24638;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=23919;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1 WHERE `entry`=24196;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23750;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=23882;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10360;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2965;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=2964;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=23131;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=26418;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=26814;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=26261;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26348;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=26786;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28387;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28863;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=28411;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28145;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=29133;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=30864;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=30849;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=29124;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=28113;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=24196;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=23875;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=24638;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24340;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=20159;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=16864;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=1201;
UPDATE `creature_template` SET `speed_run`=0.71429 WHERE `entry`=25823;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=32592;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7866;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=7545;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1540;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1538;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1549;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=1555;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1664;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=29399;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29793;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29792;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29586;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=29794;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29694;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=29755;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=30548;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=30040;
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=1.71429 WHERE `entry`=30881;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=29590;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26577;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=26575;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=26316;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32596;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=31070;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=33543;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33643;
UPDATE `creature_template` SET `speed_walk`=4.4,`speed_run`=1.57143 WHERE `entry`=33785;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32598;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=24228;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=27701;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=27120;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=26864;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=27836;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.14286 WHERE `entry`=27766;
UPDATE `creature_template` SET `speed_walk`=10,`speed_run`=3.57143 WHERE `entry`=30609;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=28080;
UPDATE `creature_template` SET `speed_walk`=0.666668,`speed_run`=0.99206 WHERE `entry`=28081;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=32534;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=21661;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=10986;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11675;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2258;
UPDATE `creature_template` SET `speed_run`=1.19048 WHERE `entry`=3284;
UPDATE `creature_template` SET `speed_walk`=1.388888 WHERE `entry`=11678;
UPDATE `creature_template` SET `speed_walk`=0.4,`speed_run`=0.45714 WHERE `entry`=89;
UPDATE `creature_template` SET `speed_run`=2.28571 WHERE `entry`=17076;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=4550;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2359;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=1.14286 WHERE `entry`=19668;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=15352;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32598;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32597;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=30531;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=3105;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=689;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1061;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1095;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=690;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1731;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=641;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=598;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=634;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=622;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=4416;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4417;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=4418;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=9219;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9259;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9261;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9262;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=10740;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9239;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9265;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9269;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9266;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9241;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16044;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9237;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10374;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10375;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10596;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9236;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9260;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9263;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9264;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10221;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10220;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=10268;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=10602;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=10601;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=10584;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8889;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8890;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=1.42857 WHERE `entry`=8921;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10116;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8912;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8891;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8892;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8909;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8910;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=9677;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9681;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8916;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8894;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8896;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8902;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8895;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8893;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9033;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8901;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8898;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8899;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8911;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=9016;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9678;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8904;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8920;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8906;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8900;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8907;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=10117;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=16079;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9319;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=9025;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8913;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8922;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8914;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9680;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9679;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8897;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9024;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8933;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9021;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9020;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9018;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=9023;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9022;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9032;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8983;
UPDATE `creature_template` SET `speed_walk`=0.72,`speed_run`=0.85714 WHERE `entry`=9500;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9543;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9499;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=28206;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=12944;
UPDATE `creature_template` SET `speed_walk`=0.8,`speed_run`=0.71429 WHERE `entry`=9503;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9502;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9017;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9156;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8908;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.85714 WHERE `entry`=9178;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9035;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9034;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9037;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9036;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9039;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9040;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9038;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9956;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8982;
UPDATE `creature_template` SET `speed_walk`=0.777776 WHERE `entry`=9938;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9019;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8903;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8915;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8929;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8905;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9056;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9041;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9042;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9476;
UPDATE `creature_template` SET `speed_walk`=10,`speed_run`=3.57143 WHERE `entry`=24769;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=26799;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=26803;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=26801;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=26798;
UPDATE `creature_template` SET `speed_run`=1.11111 WHERE `entry`=29875;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=29619;
UPDATE `creature_template` SET `speed_run`=1.38571 WHERE `entry`=32597;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=31769;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=1201;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=5843;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=9318;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5839;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5856;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8637;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5853;
UPDATE `creature_template` SET `speed_walk`=1,`speed_run`=0.71429 WHERE `entry`=8284;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=7868;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5833;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2736;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=8439;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11703;
UPDATE `creature_template` SET `speed_walk`=2 WHERE `entry`=8441;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=5474;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=5471;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=5427;
UPDATE `creature_template` SET `speed_walk`=1.4,`speed_run`=1.42857 WHERE `entry`=5430;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=5421;
UPDATE `creature_template` SET `speed_walk`=1.6 WHERE `entry`=34158;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=15545;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1708;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1715;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1707;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1711;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1666;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1717;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1663;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=1716;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=30041;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29997;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29839;
UPDATE `creature_template` SET `speed_walk`=1.444444 WHERE `entry`=29755;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29458;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29498;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=29592;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=29598;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=29605;
UPDATE `creature_template` SET `speed_walk`=2.8,`speed_run`=1.71429 WHERE `entry`=29809;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=34234;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33186;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=33216;
UPDATE `creature_template` SET `speed_run`=1.71429 WHERE `entry`=34069;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33329;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=34267;
UPDATE `creature_template` SET `speed_walk`=0.666668 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_walk`=1.555556 WHERE `entry`=2736;
UPDATE `creature_template` SET `speed_walk`=1.2 WHERE `entry`=24410;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=18600;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=19164;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=19163;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=19162;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=18146;
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=18337;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=33742;
UPDATE `creature_template` SET `speed_run`=0.42857 WHERE `entry`=33292;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=33134;
UPDATE `creature_template` SET `speed_walk`=1.666668 WHERE `entry`=33515;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=33213;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33242;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=33500;
UPDATE `creature_template` SET `speed_walk`=3.2,`speed_run`=2.28571 WHERE `entry`=33271;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=33772;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=33699;
UPDATE `creature_template` SET `speed_run`=2 WHERE `entry`=33722;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=33241;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=33244;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=33775;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=33774;
UPDATE `creature_template` SET `speed_run`=1.5873 WHERE `entry`=32867;
UPDATE `creature_template` SET `speed_walk`=1.6,`speed_run`=1.42857 WHERE `entry`=33890;
UPDATE `creature_template` SET `speed_walk`=1.2,`speed_run`=2.14286 WHERE `entry`=33441;
UPDATE `creature_template` SET `speed_walk`=2.4,`speed_run`=0.85714 WHERE `entry`=33881;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=31755;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32602;
UPDATE `creature_template` SET `speed_walk`=1.111112 WHERE `entry`=31229;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32596;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32597;
UPDATE `creature_template` SET `speed_run`=1.14286 WHERE `entry`=32600;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=33227;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=33121;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33846;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33388;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=33453;
UPDATE `creature_template` SET `speed_run`=2.14286 WHERE `entry`=34288;
UPDATE `creature_template` SET `speed_run`=0.42857 WHERE `entry`=33346;
UPDATE `creature_template` SET `speed_run`=0.42857 WHERE `entry`=33343;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=34199;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=34198;
UPDATE `creature_template` SET `speed_run`=0.99206 WHERE `entry`=34196;
UPDATE `creature_template` SET `speed_run`=1.28571 WHERE `entry`=32927;
UPDATE `creature_template` SET `speed_run`=1.42857 WHERE `entry`=32857;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=33809;
UPDATE `creature_template` SET `speed_run`=0.85714 WHERE `entry`=33661;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=32933;

-- The Mechanar Paths

-- Pathing for Sunseeker Engineer Entry: 20988
SET @NPC := 83213;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=215.6366,`position_y`=-57.85087,`position_z`=0.007587247 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,221.9379,-55.45426,0.008690897,0,0,0,100,0),
(@PATH,2,229.2718,-57.64629,0.009516931,0,0,0,100,0),
(@PATH,3,221.9379,-55.45426,0.008690897,0,0,0,100,0),
(@PATH,4,215.6366,-57.85087,0.007587247,0,0,0,100,0),
(@PATH,5,212.2958,-63.3326,0.007473905,0,0,0,100,0),
(@PATH,6,215.6366,-57.85087,0.007587247,0,0,0,100,0);

-- Pathing for Sunseeker Engineer Entry: 20988
SET @NPC := 83180;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=112.0698,`position_y`=40.35622,`position_z`=14.92426 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,101.2307,46.33547,14.9244,0,0,0,100,0),
(@PATH,2,102.2309,58.49025,14.93429,0,0,0,100,0),
(@PATH,3,110.5797,69.03175,14.91828,1000,0,0,100,0),
(@PATH,4,102.2309,58.49025,14.93429,0,0,0,100,0),
(@PATH,5,101.2307,46.33547,14.9244,0,0,0,100,0),
(@PATH,6,112.0698,40.35622,14.92426,2000,0,0,100,0);

-- Pathing for Sunseeker Engineer Entry: 20988
SET @NPC := 83224;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=103.1169,`position_y`=-38.39568,`position_z`=14.92465 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,115.3089,-32.14138,14.91936,0,0,0,100,0),
(@PATH,2,103.1169,-38.39568,14.92465,0,0,0,100,0),
(@PATH,3,100.0206,-48.74694,14.92466,0,0,0,100,0),
(@PATH,4,104.0157,-60.55514,14.92467,0,0,0,100,0),
(@PATH,5,101.5114,-74.89877,14.93021,1000,0,0,100,0),
(@PATH,6,104.0157,-60.55514,14.92467,0,0,0,100,0),
(@PATH,7,100.0206,-48.74694,14.92466,0,0,0,100,0),
(@PATH,8,103.1169,-38.39568,14.92465,0,0,0,100,0);

-- Pathing for Mechanar Tinkerer Entry: 19716
SET @NPC := 83168;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=173.9945,`position_y`=37.73192,`position_z`=1.01045 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,179.0216,40.52939,-0.006131659,0,0,0,100,0),
(@PATH,2,185.691,41.82604,-0.006107603,0,0,0,100,0),
(@PATH,3,193.5586,41.26056,-0.00603374,0,0,0,100,0),
(@PATH,4,197.7065,37.41517,-0.005917786,0,0,0,100,0),
(@PATH,5,193.5586,41.26056,-0.00603374,0,0,0,100,0),
(@PATH,6,185.691,41.82604,-0.006107603,0,0,0,100,0),
(@PATH,7,179.0216,40.52939,-0.006131659,0,0,0,100,0),
(@PATH,8,173.9945,37.73192,1.01045,1000,0,0,100,0);

-- Pathing for Mechanar Tinkerer Entry: 19716
SET @NPC := 83208;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=201.0571,`position_y`=-94.47349,`position_z`=0.005551513 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,200.5827,-87.17133,0.005753752,0,0,0,100,0),
(@PATH,2,208.2485,-83.39652,0.005116368,0,0,0,100,0),
(@PATH,3,213.2274,-75.13932,0.004827803,0,0,0,100,0),
(@PATH,4,208.2485,-83.39652,0.005116368,0,0,0,100,0),
(@PATH,5,200.5827,-87.17133,0.005753752,0,0,0,100,0),
(@PATH,6,201.0571,-94.47349,0.005551513,0,0,0,100,0),
(@PATH,7,211.3469,-101.7175,0.005551513,0,0,0,100,0),
(@PATH,8,221.7694,-105.0224,0.000142399,0,0,0,100,0),
(@PATH,9,211.3469,-101.7175,0.005551513,0,0,0,100,0),
(@PATH,10,201.0571,-94.47349,0.00555151,0,0,0,100,0);

-- Pathing for Gatewatcher Iron-Hand Entry: 19710
SET @NPC := 83240;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=167.8726,`position_y`=-78.7667,`position_z`=1.007633 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,181.8516,-77.11685,0.007727642,0,0,0,100,0),
(@PATH,2,193.6146,-39.96439,0.002376378,0,0,0,100,0),
(@PATH,3,189.3122,-44.15557,0,0,0,0,100,0),
(@PATH,4,193.6146,-39.96439,0.002376378,0,0,0,100,0),
(@PATH,5,181.8516,-77.11685,0.007727642,0,0,0,100,0),
(@PATH,6,167.8726,-78.7667,1.007633,0,0,0,100,0),
(@PATH,7,120.1477,-74.05254,14.92782,0,0,0,100,0),
(@PATH,8,167.8726,-78.7667,1.007633,0,0,0,100,0);

-- Pathing for Tempest-Forge Patroller Entry: 19166
SET @NPC := 83229;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=73.91813,`position_y`=-56.71242,`position_z`=14.92467 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,38.8435,-56.28604,0.2243272,0,0,0,100,0),
(@PATH,2,30.62484,-54.90739,0.2658595,0,0,0,100,0),
(@PATH,3,31.93092,-34.87634,0.01095478,0,0,0,100,0),
(@PATH,4,30.62484,-54.90739,0.2658595,0,0,0,100,0),
(@PATH,5,38.8435,-56.28604,0.2243272,0,0,0,100,0),
(@PATH,6,73.91813,-56.71242,14.92467,0,0,0,100,0);

-- Pathing for Tempest-Forge Patroller Entry: 19166
SET @NPC := 83189;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=38.19203,`position_y`=59.68785,`position_z`=0.1630622 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,30.01177,55.23014,0.1630622,0,0,0,100,0),
(@PATH,2,32.04149,39.38673,0.01430552,0,0,0,100,0),
(@PATH,3,30.01177,55.23014,0.1630622,0,0,0,100,0),
(@PATH,4,38.19203,59.68785,0.1630622,0,0,0,100,0),
(@PATH,5,72.142265,59.692062,14.924672,0,0,0,100,0),
(@PATH,6,76.85091,59.6219,14.92467,0,0,0,100,0),
(@PATH,7,72.142265,59.692062,14.924672,0,0,0,100,0),
(@PATH,8,38.19203,59.68785,0.1630622,0,0,0,100,0);

-- Pathing for Tempest-Forge Patroller Entry: 19166
SET @NPC := 83177;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=149.6304,`position_y`=81.24523,`position_z`=6.46902 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,169.9373,81.2677,0.3694459,0,0,0,100,0),
(@PATH,2,188.186,64.12248,-0.005838666,0,0,0,100,0),
(@PATH,3,186.6127,47.3467,-0.006220245,0,0,0,100,0),
(@PATH,4,164.6416,49.95449,-0.001837493,0,0,0,100,0),
(@PATH,5,186.6127,47.3467,-0.006220245,0,0,0,100,0),
(@PATH,6,188.186,64.12248,-0.005838666,0,0,0,100,0),
(@PATH,7,169.9373,81.2677,0.3694459,0,0,0,100,0),
(@PATH,8,149.6304,81.24523,6.46902,0,0,0,100,0),
(@PATH,9,117.6222,78.36094,14.92448,0,0,0,100,0),
(@PATH,10,149.6304,81.24523,6.46902,0,0,0,100,0);

-- Pathing for Tempest-Forge Patroller Entry: 19166
SET @NPC := 83197;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=43.61107,`position_y`=-26.75192,`position_z`=0.006033891 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,35.5806,-23.74641,-0.0007913045,0,0,0,100,0),
(@PATH,2,28.9233,-18.14311,-0.0005735573,0,0,0,100,0),
(@PATH,3,26.3567,-5.986794,-0.0003807611,9000,0,8319701,100,0),
(@PATH,4,29.69342,-15.44835,-0.0005828599,0,0,0,100,0),
(@PATH,5,35.8448,-23.9074,-0.000488915,0,0,0,100,0),
(@PATH,6,43.61107,-26.75192,0.006033891,15000,0,8319702,100,0);

-- Pathing for Tempest-Forge Patroller Entry: 19166
SET @NPC := 83195;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=41.32706,`position_y`=29.44866,`position_z`=0.006104112 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,32.22061,26.5157,0.007136924,0,0,0,100,0),
(@PATH,2,27.24365,18.83135,-0.0004997473,0,0,0,100,0),
(@PATH,3,24.29777,7.923412,-0.000286215,11000,0,8319501,100,0),
(@PATH,4,28.08634,21.93921,-0.0005085135,0,0,0,100,0),
(@PATH,5,41.32706,29.44866,0.006104112,13000,0,8319502,100,0);

DELETE FROM `waypoint_scripts` WHERE `guid` BETWEEN 817 AND 820;
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(8319701,0,30,0,0,3.333579,817),
(8319702,0,30,0,0,3.036873,818),
(8319501,0,30,0,0,2.96706,819),
(8319502,0,30,0,0,3.263766,820);

-- Pathing for Tempest-Forge Destroyer Entry: 19735
SET @NPC := 83173;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=233.3129,`position_y`=52.31844,`position_z`=0.02142466 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,203.6965,53.04169,-0.004259702,0,0,0,100,0),
(@PATH,2,233.3129,52.31844,0.02142466,0,0,0,100,0);

-- Pathing for Mechano-Lord Capacitus Entry: 19219
SET @NPC := 83160;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=209.7744,`position_y`=-12.69758,`position_z`=-2.192125 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,209.7744,-12.69758,-2.192125,2000,0,8316001,100,0),
(@PATH,2,228.1113,-0.829701,-0.8854336,0,0,0,100,0),
(@PATH,3,226.6032,19.45208,-1.726556,0,0,0,100,0),
(@PATH,4,204.9646,26.38312,-0.005853632,10000,0,0,100,0),
(@PATH,5,209.7744,-12.69758,-2.192125,2000,0,8316001,100,0),
(@PATH,6,228.1113,-0.829701,-0.8854336,0,0,0,100,0),
(@PATH,7,226.6032,19.45208,-1.726556,0,0,0,100,0),
(@PATH,8,204.9646,26.38312,-0.005853632,10000,0,0,100,0),
(@PATH,9,209.7744,-12.69758,-2.192125,2000,0,8316001,100,0),
(@PATH,10,224.3664,-23.35326,-2.192125,0,0,0,100,0),
(@PATH,11,231.1084,-38.22675,8.909556,14000,0,0,100,0),
(@PATH,12,209.7744,-12.69758,-2.192125,2000,0,8316001,100,0),
(@PATH,13,224.3664,-23.35326,-2.192125,0,0,0,100,0),
(@PATH,14,231.1084,-38.22675,8.909556,13000,0,0,100,0),
(@PATH,15,209.7744,-12.69758,-2.192125,2000,0,8316001,100,0),
(@PATH,16,189.2316,-17.36449,-2.192126,0,0,0,100,0),
(@PATH,17,185.7177,-4.297129,-1.142366,0,0,0,100,0),
(@PATH,18,191.9589,6.435908,-0.7838742,0,0,0,100,0),
(@PATH,19,196.1359,21.01234,-1.426585,0,0,0,100,0),
(@PATH,20,207.8954,18.24695,-2.192125,0,0,0,100,0),
(@PATH,21,213.9077,10.01895,-2.192125,8000,0,0,100,0),
(@PATH,22,209.7744,-12.69758,-2.192125,2000,0,8316001,100,0),
(@PATH,23,189.2316,-17.36449,-2.192126,0,0,0,100,0),
(@PATH,24,191.9589,6.435908,-0.7838742,0,0,0,100,0),
(@PATH,25,196.1359,21.01234,-1.426585,0,0,0,100,0),
(@PATH,26,207.8954,18.24695,-2.192125,0,0,0,100,0),
(@PATH,27,213.9077,10.01895,-2.192125,14000,0,0,100,0),
(@PATH,28,209.7744,-12.69758,-2.192125,2000,0,8316001,100,0),
(@PATH,29,224.3664,-23.35326,-2.192125,0,0,0,100,0),
(@PATH,30,231.1084,-38.22675,8.909556,14000,0,0,100,0),
(@PATH,31,209.7744,-12.69758,-2.192125,2000,0,8316001,100,0);
DELETE FROM `waypoint_scripts` WHERE `guid` BETWEEN 821 AND 821;
INSERT INTO `waypoint_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`o`,`guid`) VALUES
(8316001,1,30,0,0,3.141593,821);

-- Pathing for Mechanar Crusher Entry: 19231
SET @NPC := 83221;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=90.85117,`position_y`=-74.31637,`position_z`=14.92653 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,96.89394,-71.07658,14.92652,0,0,0,100,0),
(@PATH,2,105.0891,-74.9791,14.92981,0,0,0,100,0),
(@PATH,3,107.6678,-81.30888,14.93107,0,0,0,100,0),
(@PATH,4,105.0891,-74.9791,14.92981,0,0,0,100,0),
(@PATH,5,96.89394,-71.07658,14.92652,0,0,0,100,0),
(@PATH,6,90.85117,-74.31637,14.92653,0,0,0,100,0);

-- NPC Captured trapper for Q 12300 Test of Mettle
UPDATE `creature_template` SET `faction_A`=35,`faction_H`=35 WHERE `entry`=27497;

-- Fix Frozen Earth SAI
UPDATE `smart_scripts` SET `target_type`=1,`target_param1`=0,`target_param2`=0 WHERE `comment` LIKE 'Frozen Earth%' AND `action_param1`=51590;

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=9414 AND `text_id`=12657;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9414,12657);
DELETE FROM `gossip_menu` WHERE `entry`=9428 AND `text_id`=12678;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9428,12678);
DELETE FROM `gossip_menu` WHERE `entry`=9460 AND `text_id`=12720;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9460,12720);
DELETE FROM `gossip_menu` WHERE `entry`=9477 AND `text_id`=12735;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9477,12735);
DELETE FROM `gossip_menu` WHERE `entry`=9483 AND `text_id`=12751;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9483,12751);
DELETE FROM `gossip_menu` WHERE `entry`=9519 AND `text_id`=12824;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9519,12824);
DELETE FROM `gossip_menu` WHERE `entry`=9540 AND `text_id`=12853;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9540,12853);
DELETE FROM `gossip_menu` WHERE `entry`=9571 AND `text_id`=12906;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9571,12906);
DELETE FROM `gossip_menu` WHERE `entry`=9614 AND `text_id`=11607;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9614,11607);
DELETE FROM `gossip_menu` WHERE `entry`=9632 AND `text_id`=13033;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9632,13033);
DELETE FROM `gossip_menu` WHERE `entry`=9785 AND `text_id`=7778;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9785,7778);
DELETE FROM `gossip_menu` WHERE `entry`=10175 AND `text_id`=14122;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10175,14122);
DELETE FROM `gossip_menu` WHERE `entry`=10176 AND `text_id`=14121;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10176,14121);
DELETE FROM `gossip_menu` WHERE `entry`=10177 AND `text_id`=14120;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10177,14120);
DELETE FROM `gossip_menu` WHERE `entry`=10178 AND `text_id`=14119;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10178,14119);
DELETE FROM `gossip_menu` WHERE `entry`=10258 AND `text_id`=14245;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10258,14245);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=9821 WHERE `entry`=26721;
UPDATE `creature_template` SET `gossip_menu_id`=9614 WHERE `entry`=26709;
UPDATE `creature_template` SET `gossip_menu_id`=9617 WHERE `entry`=26379;
UPDATE `creature_template` SET `gossip_menu_id`=9460 WHERE `entry`=26985;
UPDATE `creature_template` SET `gossip_menu_id`=9428 WHERE `entry`=26415;
UPDATE `creature_template` SET `gossip_menu_id`=9540 WHERE `entry`=27243;
UPDATE `creature_template` SET `gossip_menu_id`=348 WHERE `entry`=27027;
UPDATE `creature_template` SET `gossip_menu_id`=9632 WHERE `entry`=27037;
UPDATE `creature_template` SET `gossip_menu_id`=9571 WHERE `entry`=26860;
UPDATE `creature_template` SET `gossip_menu_id`=9477 WHERE `entry`=27125;
UPDATE `creature_template` SET `gossip_menu_id`=9519 WHERE `entry`=27388;
UPDATE `creature_template` SET `gossip_menu_id`=10258 WHERE `entry`=26666;
UPDATE `creature_template` SET `gossip_menu_id`=344 WHERE `entry`=26680;
UPDATE `creature_template` SET `gossip_menu_id`=9785 WHERE `entry`=26853;
UPDATE `creature_template` SET `gossip_menu_id`=348 WHERE `entry`=24149;
UPDATE `creature_template` SET `gossip_menu_id`=9483 WHERE `entry`=27172;
UPDATE `creature_template` SET `gossip_menu_id`=10178 WHERE `entry`=30381;
UPDATE `creature_template` SET `gossip_menu_id`=344 WHERE `entry`=29971;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9614,348,344) AND `id` IN (0,1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9513,9632,9785,10178,10177,10176) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9460,9477) AND `id` IN (2);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9477) AND `id` IN (4);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (348,344) AND `id` IN (2,3);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (342) AND `id` IN (1);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9614,0,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(9614,1,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(9513,0,0, 'I am ready to be teleported to Dalaran.',1,1,0,0,0,0,0, ''),
(9460,2,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(348,0,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(348,1,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(9632,0,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(9477,2,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(9477,4,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(344,0,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(344,1,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(9785,0,2, 'Show me where I can fly.',4,8192,0,0,0,0,0, ''),
(10178,0,0, 'Tell me of yourself, Xarantaur. Why are you called the Witness?',1,1,10177,0,0,0,0, ''),
(10177,0,0, 'Please, go on.',1,1,10176,0,0,0,0, ''),
(10176,0,0, 'They?',1,1,10175,0,0,0,0, '');

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=10689 AND `text_id`=14824;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10689,14824);
DELETE FROM `gossip_menu` WHERE `entry`=7856 AND `text_id`=9618;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7856,9618);
DELETE FROM `gossip_menu` WHERE `entry`=7857 AND `text_id`=9620;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7857,9620);
DELETE FROM `gossip_menu` WHERE `entry`=9114 AND `text_id`=10249;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9114,10249);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=10689 WHERE `entry`=34771;
UPDATE `creature_template` SET `gossip_menu_id`=8903 WHERE `entry`=33971;
UPDATE `creature_template` SET `gossip_menu_id`=7856 WHERE `entry`=18245;
UPDATE `creature_template` SET `gossip_menu_id`=7857 WHERE `entry`=18913;
UPDATE `creature_template` SET `gossip_menu_id`=9114 WHERE `entry`=21088;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8903,9114) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7856,7857) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7856) AND `id` IN (2);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7857) AND `id` IN (6);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(8903,0,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(7856,1,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(7856,2,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7857,1,5, 'Make this inn your home.',8,65536,0,0,0,0,0, ''),
(7857,6,1, 'What do you have for sale?',3,128,0,0,0,0,0, ''),
(9114,0,5, 'Make this inn your home.',8,65536,0,0,0,0,0, '');

-- Misc Innkeepers SAI
SET @GOSSIP := 342;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (6272,6727,6740,6790,8931,24057,27066);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6272,6727,6740,6790,8931,24057,27066);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6272,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Janene - On gossip option 0 select - Close gossip'),
(6272,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Janene - On gossip option 0 select - Player cast Trick or Treat on self'),
(6727,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Brianna - On gossip option 0 select - Close gossip'),
(6727,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Brianna - On gossip option 0 select - Player cast Trick or Treat on self'),
(6740,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Allison - On gossip option 0 select - Close gossip'),
(6740,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Innkeeper Allison - On gossip option 0 select - Player cast Trick or Treat on self'),
(6790,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Trelayne - On gossip option 0 select - Close gossip'),
(6790,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Trelayne - On gossip option 0 select - Player cast Trick or Treat on self'),
(8931,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Heather - On gossip option 0 select - Close gossip'),
(8931,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Heather - On gossip option 0 select - Player cast Trick or Treat on self'),
(24057,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Christina Daniels - On gossip option 0 select - Close gossip'),
(24057,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Christina Daniels - On gossip option 0 select - Player cast Trick or Treat on self'),
(27066,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Jennifer Bell - On gossip option 0 select - Close gossip'),
(27066,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Jennifer Bell - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id`=3420;
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=10211;
DELETE FROM `gossip_scripts` WHERE `id`=1021101;

-- Misc Innkeepers SAI
SET @GOSSIP := 344;
SET @MENUID := 2;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (3934,7714,11116,26680,29971);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3934,7714,11116,26680,29971);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(3934,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Boorand Plainswind - On gossip option 2 select - Close gossip'),
(3934,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Boorand Plainswind - On gossip option 2 select - Player cast Trick or Treat on self'),
(7714,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Byula - On gossip option 2 select - Close gossip'),
(7714,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Byula - On gossip option 2 select - Player cast Trick or Treat on self'),
(11116,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Abeqwa - On gossip option 2 select - Close gossip'),
(11116,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Abeqwa - On gossip option 2 select - Player cast Trick or Treat on self'),
(26680,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Aiyan Coldwind - On gossip option 2 select - Close gossip'),
(26680,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Aiyan Coldwind - On gossip option 2 select - Player cast Trick or Treat on self'),
(29971,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Wabada Whiteflower - On gossip option 2 select - Close gossip'),
(29971,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Wabada Whiteflower - On gossip option 2 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 345;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (1464,5111,6734,7744,29926);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1464,5111,6734,7744,29926);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1464,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Helbrek - On gossip option 0 select - Close gossip'),
(1464,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Helbrek - On gossip option 0 select - Player cast Trick or Treat on self'),
(5111,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Firebrew - On gossip option 0 select - Close gossip'),
(5111,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Firebrew - On gossip option 0 select - Player cast Trick or Treat on self'),
(6734,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Hearthstove - On gossip option 0 select - Close gossip'),
(6734,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Hearthstove - On gossip option 0 select - Player cast Trick or Treat on self'),
(7744,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Thulfram - On gossip option 0 select - Close gossip'),
(7744,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Thulfram - On gossip option 0 select - Player cast Trick or Treat on self'),
(29926,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Gunda Boldhammer - On gossip option 0 select - Close gossip'),
(29926,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Gunda Boldhammer - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 1290;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (5814,6928,6930,7731,9356,12196,18957,19319,19470);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (5814,6928,6930,7731,9356,12196,18957,19319,19470);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(5814,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Thulbek - On gossip option 0 select - Close gossip'),
(5814,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Thulbek - On gossip option 0 select - Player cast Trick or Treat on self'),
(6928,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Grosk - On gossip option 0 select - Close gossip'),
(6928,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Grosk - On gossip option 0 select - Player cast Trick or Treat on self'),
(6930,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Karakul - On gossip option 0 select - Close gossip'),
(6930,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Karakul - On gossip option 0 select - Player cast Trick or Treat on self'),
(7731,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Jayka - On gossip option 0 select - Close gossip'),
(7731,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Jayka - On gossip option 0 select - Player cast Trick or Treat on self'),
(9356,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Shul''kar - On gossip option 0 select - Close gossip'),
(9356,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Shul''kar - On gossip option 0 select - Player cast Trick or Treat on self'),
(12196,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kaylisk - On gossip option 0 select - Close gossip'),
(12196,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kaylisk - On gossip option 0 select - Player cast Trick or Treat on self'),
(18957,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Grilka - On gossip option 0 select - Close gossip'),
(18957,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Grilka - On gossip option 0 select - Player cast Trick or Treat on self'),
(19319,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Darg Bloodclaw - On gossip option 0 select - Close gossip'),
(19319,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Darg Bloodclaw - On gossip option 0 select - Player cast Trick or Treat on self'),
(19470,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Gholah - On gossip option 0 select - Close gossip'),
(19470,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Gholah - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Innkeeper Shaussiy does not require script
UPDATE `creature_template` SET `ScriptName`= '' WHERE `entry` IN (6737);

-- Misc Innkeepers SAI
SET @GOSSIP := 348;
SET @MENUID := 2;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (6741,24342,27027,24149);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6741,24342,27027,24149);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6741,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Norman - On gossip option 2 select - Close gossip'),
(6741,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Norman - On gossip option 2 select - Player cast Trick or Treat on self'),
(24342,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Timothy Holland - On gossip option 2 select - Close gossip'),
(24342,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Timothy Holland - On gossip option 2 select - Player cast Trick or Treat on self'),
(27027,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Mrs. Winterby - On gossip option 2 select - Close gossip'),
(27027,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Mrs. Winterby - On gossip option 2 select - Player cast Trick or Treat on self'),
(24149,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Basil Osgood - On gossip option 2 select - Close gossip'),
(24149,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Basil Osgood - On gossip option 2 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 349;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (6791,6807,11118,29904);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6791,6807,11118,29904);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6791,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Wiley - On gossip option 0 select - Close gossip'),
(6791,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Wiley - On gossip option 0 select - Player cast Trick or Treat on self'),
(6807,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Skindle - On gossip option 0 select - Close gossip'),
(6807,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Skindle - On gossip option 0 select - Player cast Trick or Treat on self'),
(11118,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Vizzie - On gossip option 0 select - Close gossip'),
(11118,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Vizzie - On gossip option 0 select - Player cast Trick or Treat on self'),
(29904,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Smilin'' Slirk Brassknob - On gossip option 0 select - Close gossip'),
(29904,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Smilin'' Slirk Brassknob - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 1291;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (295,2352);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (295,2352);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(295,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Farley - On gossip option 0 select - Close gossip'),
(295,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Farley - On gossip option 0 select - Player cast Trick or Treat on self'),
(2352,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Anderson - On gossip option 0 select - Close gossip'),
(2352,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Anderson - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 1293;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (6736,19495);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6736,19495);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6736,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Keldamyr - On gossip option 0 select - Close gossip'),
(6736,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Keldamyr - On gossip option 0 select - Player cast Trick or Treat on self'),
(19495,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Shaunessy - On gossip option 0 select - Close gossip'),
(19495,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Shaunessy - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 1294;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (6747);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6747);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6747,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kauth - On gossip option 0 select - Close gossip'),
(6747,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kauth - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 1296;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (2388,5688,6739,25278);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2388,5688,6739,25278);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2388,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Shay - On gossip option 0 select - Close gossip'),
(2388,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Shay - On gossip option 0 select - Player cast Trick or Treat on self'),
(5688,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Renee - On gossip option 0 select - Close gossip'),
(5688,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Renee - On gossip option 0 select - Player cast Trick or Treat on self'),
(6739,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Bates - On gossip option 0 select - Close gossip'),
(6739,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Bates - On gossip option 0 select - Player cast Trick or Treat on self'),
(25278,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Williamson - On gossip option 0 select - Close gossip'),
(25278,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Williamson - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 1297;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (1247);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1247);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(1247,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Belm - On gossip option 0 select - Close gossip'),
(1247,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Belm - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 1581;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (6735,7736,16458,6738,11103);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6735,7736,16458,6738,11103);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6735,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Saelienne - On gossip option 0 select - Close gossip'),
(6735,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Saelienne - On gossip option 0 select - Player cast Trick or Treat on self'),
(7736,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Shyria - On gossip option 0 select - Close gossip'),
(7736,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Shyria - On gossip option 0 select - Player cast Trick or Treat on self'),
(16458,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Faralia - On gossip option 0 select - Close gossip'),
(16458,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Faralia - On gossip option 0 select - Player cast Trick or Treat on self'),
(6738,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kimlya - On gossip option 0 select - Close gossip'),
(6738,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kimlya - On gossip option 0 select - Player cast Trick or Treat on self'),
(11103,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Lyshaerya - On gossip option 0 select - Close gossip'),
(11103,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Lyshaerya - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 441;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (6929);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6929);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(6929,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Gryshka - On gossip option 0 select - Close gossip'),
(6929,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Gryshka - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,23,1637,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 6525;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (15174);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (15174);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(15174,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Calandrath - On gossip option 0 select - Close gossip'),
(15174,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Calandrath - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 6620;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (15433);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (15433);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(15433,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Delaniel - On gossip option 0 select - Close gossip'),
(15433,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Delaniel - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 7173;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (16256);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (16256);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(16256,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Jessica Chambers - On gossip option 0 select - Close gossip'),
(16256,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Jessica Chambers - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 7288;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (17630,16618,16542);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (17630,16618,16542);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(17630,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Jovia - On gossip option 0 select - Close gossip'),
(17630,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Jovia - On gossip option 0 select - Player cast Trick or Treat on self'),
(16618,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Velandra - On gossip option 0 select - Close gossip'),
(16618,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Velandra - On gossip option 0 select - Player cast Trick or Treat on self'),
(16542,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kalarin - On gossip option 0 select - Close gossip'),
(16542,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kalarin - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 7301;
SET @MENUID := 2;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (16826);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (16826);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(16826,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Sid Limbardi - On gossip option 0 select - Close gossip'),
(16826,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Sid Limbardi - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 7324;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (15397);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (15397);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(15397,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Marniel Amberlight - On gossip option 0 select - Close gossip'),
(15397,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Marniel Amberlight - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 7468;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (16553);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (16553);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(16553,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Caregiver Chellan - On gossip option 0 select - Close gossip'),
(16553,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Caregiver Chellan - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 7481;
SET @MENUID := 0;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (18914,18908);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (18914,18908);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18914,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Caregiver Isel - On gossip option 0 select - Close gossip'),
(18914,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Caregiver Isel - On gossip option 0 select - Player cast Trick or Treat on self'),
(18908,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kerp - On gossip option 0 select - Close gossip'),
(18908,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Kerp - On gossip option 0 select - Player cast Trick or Treat on self');
-- Add Gossip option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Misc Innkeepers SAI
SET @GOSSIP := 7855;
SET @MENUID := 2;
UPDATE `creature_template` SET `AIName`= 'SmartAI',`ScriptName`= '' WHERE `entry` IN (18907);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (18907);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18907,0,0,1,62,0,100,0,@GOSSIP,@MENUID,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Coryth Stoktron - On gossip option 0 select - Close gossip'),
(18907,0,1,0,61,0,100,0,0,0,0,0,85,24751,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Innkeeper Coryth Stoktron - On gossip option 0 select - Player cast Trick or Treat on self');
DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP AND `id`=@MENUID;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,@MENUID,0, 'Trick or Treat!',1,1,0,0,0,0,0, '');
-- Add Gossip condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP AND `SourceEntry`=@MENUID;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,@GOSSIP,@MENUID,0,11,24755,0,0,0,'',NULL),(15,@GOSSIP,@MENUID,0,12,12,0,0,0,'',NULL);

-- Handler Marnlek SAI
SET @ENTRY  := 40204;
SET @GOSSIP := 11345;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,62,0,100,0,@GOSSIP,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Handler Marnlek - On gossip option 0 select - Close gossip'),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,11,74978,3,0,0,0,0,7,0,0,0,0,0,0,0, 'Handler Marnlek - On gossip option 0 select - Cast Echo Isles: Unlearned Spy Frog Taxi on player'),
(@ENTRY,0,2,3,62,0,100,0,@GOSSIP,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Handler Marnlek - On gossip option 1 select - Close gossip'),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,11,75421,3,0,0,0,0,7,0,0,0,0,0,0,0, 'Handler Marnlek - On gossip option 1 select - Cast Echo Isles: Unlearned Troll Recruit Taxi on player'),
(@ENTRY,0,4,5,62,0,100,0,@GOSSIP,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Handler Marnlek - On gossip option 2 select - Close gossip'),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,11,75422,3,0,0,0,0,7,0,0,0,0,0,0,0, 'Handler Marnlek - On gossip option 2 select - Cast Echo Isles: Unlearned Troll Battle Taxi on player');
-- Cleanup gossip
UPDATE `gossip_menu_option` SET `action_script_id`=0 WHERE `menu_id`=@GOSSIP;
DELETE FROM `gossip_scripts` WHERE `id` IN (1134500,1134501,1134502);

-- Focus Wizard fix flags
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~536870912 WHERE `entry`=26816;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`&~262144 WHERE `entry`=26816;
-- Focus Wizard SAI
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=26816;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=26816;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26816,0,0,0,1,0,100,1,1000,1000,1000,1000,11,46906,1,0,0,0,0,11,23837,15,0,0,0,0,0,'Focus Wizard - On reset - Cast Surge Needle Beam'),
(26816,0,1,0,4,0,100,0,0,0,0,0,11,51777,3,0,0,0,0,1,0,0,0,0,0,0,0,'Focus Wizard - On aggro - Aura Arcane Focus'),
(26816,0,2,0,0,0,100,0,0,0,3000,3000,11,51779,0,0,0,0,0,2,0,0,0,0,0,0,0,'Focus Wizard - Combat - Cast Frostfire Bolt on victim');

-- Rotting Storm Giant SAI 
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=27270;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-108034,-108035,-108036,-108037,-203372,-203373);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-108034,0,0,1,1,0,100,1,1000,1000,1000,1000,11,50389,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-108034,0,1,0,61,0,100,1,0,0,0,0,11,50390,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-108034,0,2,3,4,0,100,0,0,0,0,0,28,50389,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-108034,0,3,0,61,0,100,0,0,0,0,0,28,50390,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-108035,0,0,1,1,0,100,1,1000,1000,1000,1000,11,50389,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-108035,0,1,0,61,0,100,1,0,0,0,0,11,50390,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-108035,0,2,3,4,0,100,0,0,0,0,0,28,50389,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-108035,0,3,0,61,0,100,0,0,0,0,0,28,50390,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-108036,0,0,1,1,0,100,1,1000,1000,1000,1000,11,50389,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-108036,0,1,0,61,0,100,1,0,0,0,0,11,50390,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-108036,0,2,3,4,0,100,0,0,0,0,0,28,50389,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-108036,0,3,0,61,0,100,0,0,0,0,0,28,50390,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-108037,0,0,1,1,0,100,1,1000,1000,1000,1000,11,50389,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-108037,0,1,0,61,0,100,1,0,0,0,0,11,50390,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-108037,0,2,3,4,0,100,0,0,0,0,0,28,50389,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-108037,0,3,0,61,0,100,0,0,0,0,0,28,50390,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-203372,0,0,1,1,0,100,1,1000,1000,1000,1000,11,50389,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-203372,0,1,0,61,0,100,1,0,0,0,0,11,50390,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-203372,0,2,3,4,0,100,0,0,0,0,0,28,50389,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-203372,0,3,0,61,0,100,0,0,0,0,0,28,50390,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-203373,0,0,1,1,0,100,1,1000,1000,1000,1000,11,50389,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-203373,0,1,0,61,0,100,1,0,0,0,0,11,50390,1,0,0,0,0,1,0,0,0,0,0,0,0,'Rotting Storm Giant - On reset - Cast Flesh Construct Test'),
(-203373,0,2,3,4,0,100,0,0,0,0,0,28,50389,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test'),
(-203373,0,3,0,61,0,100,0,0,0,0,0,28,50390,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Rotting Storm Giant - On Aggro - Remove Flesh Construct Test');
-- Remove auras from creature addon
UPDATE `creature_addon` SET `auras`= '' WHERE `guid` IN (108034,108035,108036,108037,203372,203373);

-- Unbound Trickster SAI
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=30856;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=30856;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=30856;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(30856,0,0,0,0,0,100,0,5000,9000,9000,12000,11,13341,1,0,0,0,0,2,0,0,0,0,0,0,0,'Unbound Trickster - Combat - Cast Fire Blast'),
(30856,0,1,0,0,0,100,0,5000,9000,9000,12000,11,11976,1,0,0,0,0,2,0,0,0,0,0,0,0,'Unbound Trickster - Combat - Cast Strike');

-- SAI for Invisible Location Trigger
SET @ENTRY := 19656;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (-70100,-70101,-70104,-70104);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-70100,0,0,0,1,0,100,1,1000,1000,1000,1000,11,33346,2,0,0,0,0,10,70102,@ENTRY,0,0,0,0,0,'Invisible Location Trigger - OOC once - Cast Green Beam on target'),
(-70101,0,0,0,1,0,100,1,1000,1000,1000,1000,11,33346,2,0,0,0,0,10,70102,@ENTRY,0,0,0,0,0,'Invisible Location Trigger - OOC once - Cast Green Beam on target'),
(-70103,0,0,0,1,0,100,1,1000,1000,1000,1000,11,33346,2,0,0,0,0,10,70102,@ENTRY,0,0,0,0,0,'Invisible Location Trigger - OOC once - Cast Green Beam on target'),
(-70104,0,0,0,1,0,100,1,1000,1000,1000,1000,11,33346,2,0,0,0,0,10,70102,@ENTRY,0,0,0,0,0,'Invisible Location Trigger - OOC once - Cast Green Beam on target');

-- SAI for Fulgorge
SET @ENTRY := 18678;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature` SET `spawndist`=20,`MovementType`=1 WHERE `id`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,100,1,0,0,0,0,11,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - OOC - Cast Submerge Visual'),
(@ENTRY,0,1,0,61,0,100,1,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - OOC - Set Unselectable and Unattackable Flags'),
(@ENTRY,0,2,3,0,0,100,1,0,0,0,0,28,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - On Aggro - Remove Submerge Visual'),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - On Aggro - Remove Unselectable and Unattackable Flags'),
(@ENTRY,0,4,5,61,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - On Aggro - Prevent Combat Movement'),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - On Aggro - Set Phase 1'),
(@ENTRY,0,6,7,0,1,100,0,1000,1000,2100,4500,11,31747,1,0,0,0,0,2,0,0,0,0,0,0,0,'Fulgorge - Combat - Cast Poison (Phase 1)'),
(@ENTRY,0,7,0,61,1,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - Combat - Prevent Combat Movement (Phase 1)'),
(@ENTRY,0,8,0,0,1,100,0,20400,20400,45000,50000,11,32738,1,0,0,0,0,2,0,0,0,0,0,0,0,'Fulgorge - Combat - Cast Bore (Phase 1)'),
(@ENTRY,0,9,10,9,1,100,0,20,60,0,0,11,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 20 - 60 Yards Range - Cast Submerge Visual (Phase 1)'),
(@ENTRY,0,10,0,61,1,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 20 - 60 Yards Range - Set Phase 2 (Phase 1)'),
(@ENTRY,0,11,12,9,2,100,0,0,8,0,0,28,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 0 - 8 Yards - Remove Submerge Visual (Phase 2)'),
(@ENTRY,0,12,13,61,2,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - Combat - Prevent Combat Movement (Phase 2)'),
(@ENTRY,0,13,14,61,2,100,0,0,8,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 0 - 8 Yards - Remove Unselectable and Unattackable Flags (Phase 2)'),
(@ENTRY,0,14,0,61,2,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fulgorge - At 20 - 60 Yards Range - Set Phase 1 (Phase 2)');

UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=26917;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=38017 AND `id`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=4625 AND `id`=1;

-- SAI for Beryl Hound
SET @ENTRY := 25355;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,50637,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Beryl Hound - On spawn - Cast Mana Break on self');

-- SAI for Tundra Penguin
SET @ENTRY := 28440;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,51583,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tundra Penguin - On spawn - Cast [DND] Creature Random Size (0 - 50) on self');

-- SAI for Spearfang Worg
SET @ENTRY := 24677;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,44366,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Spearfang Worg - On spawn - Cast Howling Fjord - Quest - Predator Dummy Periodic on self');

-- SAI for Scourging Crystal
SET @ENTRY := 24464;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,43874,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Scourging Crystal - On spawn - Cast Scourge Mur''gul Camp: Force Shield Arcane Purple x3 on self');

-- SAI for Moa'ki Bottom Thresher
SET @ENTRY := 26511;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,8876,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Moa''ki Bottom Thresher - On spawn - Cast Thrash on self');

-- SAI for Tuskarr Turtle Rider
SET @ENTRY := 29953;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,55587,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tuskarr Turtle Rider - On spawn - Cast Tuskarr Turtle Rider CustomSpell01 on self');

-- SAI for Snowfall Glade Reaver
SET @ENTRY := 26197;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,15088,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Snowfall Glade Reaver - On spawn - Cast Flurry on self');

-- SAI for Conquest Hold Berserker
SET @ENTRY := 27500;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,15088,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Conquest Hold Berserker - On spawn - Cast Flurry on self'),
(@ENTRY,0,1,0,0,0,100,0,1000,3000,12000,20000,11,31403,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Conquest Hold Berserker - Combat - Cast Battle Shout on self');

-- SAI for Indu'le Fisherman
SET @ENTRY := 26343;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,32423,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Indu''le Fisherman - On spawn - Cast Blue Radiation on self');

-- SAI for Vengeful Taunka Spirit
SET @ENTRY := 25668;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,46695,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Vengeful Taunka Spirit - On spawn - Cast Soul Separation on self');

-- SAI for Steam Frog
SET @ENTRY := 25679;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,36151,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Steam Frog - On spawn - Cast Cosmetic: Steam Aura on self');

-- SAI for Steam Rager
SET @ENTRY := 24601;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,36151,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Steam Rager - On spawn - Cast Cosmetic: Steam Aura on self'),
(@ENTRY,0,1,0,0,0,100,0,4000,8000,11000,14000,11,50375,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Steam Rager - Combat - Cast Steam Blast on victom');

-- SAI for Big Electromental Flavor
SET @ENTRY := 21757;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,37248,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Big Electromental Flavor - On spawn - Cast Power Converters: Electromental Visual on self');

-- Crusader Bridenbrad
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=30562; -- Remove EAI
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|32768,`ScriptName`='',`AIName`='' WHERE `entry`=30562;
UPDATE `creature_model_info` SET `bounding_radius`=0.306,`combat_reach`=1.5,`gender`=0 WHERE `modelid`=27123;
DELETE FROM `creature_template_addon` WHERE `entry`=30562;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(30562,0,65536,1,0, '57744 57626');

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=7333 AND `text_id`=8717;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7333,8717);
DELETE FROM `gossip_menu` WHERE `entry`=7334 AND `text_id`=8718;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7334,8718);
DELETE FROM `gossip_menu` WHERE `entry`=7335 AND `text_id`=8719;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7335,8719);
DELETE FROM `gossip_menu` WHERE `entry`=7348 AND `text_id`=8767;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7348,8767);
DELETE FROM `gossip_menu` WHERE `entry`=7420 AND `text_id`=8962;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7420,8962);
DELETE FROM `gossip_menu` WHERE `entry`=7825 AND `text_id`=9574;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7825,9574);
DELETE FROM `gossip_menu` WHERE `entry`=7878 AND `text_id`=9642;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7878,9642);
DELETE FROM `gossip_menu` WHERE `entry`=7893 AND `text_id`=9657;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7893,9657);
DELETE FROM `gossip_menu` WHERE `entry`=7955 AND `text_id`=9771;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7955,9771);
DELETE FROM `gossip_menu` WHERE `entry`=7967 AND `text_id`=9801;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7967,9801);
DELETE FROM `gossip_menu` WHERE `entry`=7967 AND `text_id`=10027;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7967,10027);
DELETE FROM `gossip_menu` WHERE `entry`=8069 AND `text_id`=9969;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8069,9969);
DELETE FROM `gossip_menu` WHERE `entry`=8085 AND `text_id`=9995;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8085,9995);
DELETE FROM `gossip_menu` WHERE `entry`=8086 AND `text_id`=9996;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8086,9996);
DELETE FROM `gossip_menu` WHERE `entry`=8087 AND `text_id`=9997;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8087,9997);
DELETE FROM `gossip_menu` WHERE `entry`=8089 AND `text_id`=10004;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8089,10004);
DELETE FROM `gossip_menu` WHERE `entry`=8090 AND `text_id`=10003;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8090,10003);
DELETE FROM `gossip_menu` WHERE `entry`=8091 AND `text_id`=10005;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8091,10005);
DELETE FROM `gossip_menu` WHERE `entry`=8269 AND `text_id`=10293;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8269,10293);
DELETE FROM `gossip_menu` WHERE `entry`=8272 AND `text_id`=10301;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8272,10301);
DELETE FROM `gossip_menu` WHERE `entry`=8274 AND `text_id`=10306;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8274,10306);
DELETE FROM `gossip_menu` WHERE `entry`=8495 AND `text_id`=10610;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8495,10610);
DELETE FROM `gossip_menu` WHERE `entry`=8505 AND `text_id`=10636;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8505,10636);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=6944 WHERE `entry`=19558;
UPDATE `creature_template` SET `gossip_menu_id`=7333 WHERE `entry`=16584;
UPDATE `creature_template` SET `gossip_menu_id`=7334 WHERE `entry`=16574;
UPDATE `creature_template` SET `gossip_menu_id`=7335 WHERE `entry`=16576;
UPDATE `creature_template` SET `gossip_menu_id`=7348 WHERE `entry`=16858;
UPDATE `creature_template` SET `gossip_menu_id`=7420 WHERE `entry`=17493;
UPDATE `creature_template` SET `gossip_menu_id`=7691 WHERE `entry`=18748;
UPDATE `creature_template` SET `gossip_menu_id`=7810 WHERE `entry`=16588;
UPDATE `creature_template` SET `gossip_menu_id`=7816 WHERE `entry`=18754;
UPDATE `creature_template` SET `gossip_menu_id`=7825 WHERE `entry`=17558;
UPDATE `creature_template` SET `gossip_menu_id`=7878 WHERE `entry`=16915;
UPDATE `creature_template` SET `gossip_menu_id`=7893 WHERE `entry`=18267;
UPDATE `creature_template` SET `gossip_menu_id`=7955 WHERE `entry`=19273;
UPDATE `creature_template` SET `gossip_menu_id`=7957 WHERE `entry`=19315;
UPDATE `creature_template` SET `gossip_menu_id`=7960 WHERE `entry`=19344;
UPDATE `creature_template` SET `gossip_menu_id`=7965 WHERE `entry`=19367;
UPDATE `creature_template` SET `gossip_menu_id`=7967 WHERE `entry`=19401;
UPDATE `creature_template` SET `gossip_menu_id`=8069 WHERE `entry`=19254;
UPDATE `creature_template` SET `gossip_menu_id`=8085 WHERE `entry`=3230;
UPDATE `creature_template` SET `gossip_menu_id`=8086 WHERE `entry`=19253;
UPDATE `creature_template` SET `gossip_menu_id`=8087 WHERE `entry`=19255;
UPDATE `creature_template` SET `gossip_menu_id`=8091 WHERE `entry`=19256;
UPDATE `creature_template` SET `gossip_menu_id`=8269 WHERE `entry`=21257;
UPDATE `creature_template` SET `gossip_menu_id`=8272 WHERE `entry`=21279;
UPDATE `creature_template` SET `gossip_menu_id`=8274 WHERE `entry`=21283;
UPDATE `creature_template` SET `gossip_menu_id`=8495 WHERE `entry`=22107;
UPDATE `creature_template` SET `gossip_menu_id`=8505 WHERE `entry`=22231;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7938,7842,7450,7957,7967,7893,8085,8090,6944,7810,7691,6647) AND `id` IN (0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7938,7816,7967,7810,6647) AND `id` IN (1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7967) AND `id` IN (4,5);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7938,0,2, 'Show me where I can fly.',4,8192,0,0,0,0,0, ''),
(7938,1,2, 'Send me to Thrallmar!',4,8192,0,0,0,0,0, ''),
(7842,0,3, 'Train me.',5,16,0,0,0,0,0, ''),
(7816,1,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7450,0,1, 'Show me what I''ve earned the right to purchase.',3,128,0,0,0,0,0, ''),
(7957,0,1, 'What do you have for sale?',3,128,0,0,0,0,0, ''),
(7967,4,0, 'Lend me a Windrider.  I''m going to Spinebreaker Post!',1,1,0,0,0,0,0, ''),
(7967,5,0, 'I''m on a bombing mission for Forward Commander To''arch.  I need a wyvern destroyer!',1,1,0,0,0,0,0, ''),
(7967,0,0, 'Send me to the Abyssal Shelf!',1,1,0,0,0,0,0, ''),
(7967,1,0, 'Send me to the Abyssal Shelf!',1,1,0,0,0,0,0, ''),
(7893,0,1, 'I have marks to redeem!',3,128,0,0,0,0,0, ''),
(8085,0,0, 'Tell me more of our mission here, Nazgrel.',1,1,8090,0,0,0,0, ''),
(8090,0,0, '<Keep Listening>',1,1,8089,0,0,0,0, ''),
(6944,0,2, 'Show me where I can fly.',4,8192,0,0,0,0,0, ''),
(7810,0,3, 'I would like to train.',5,16,0,0,0,0,0, ''),
(7810,1,1, 'Let me browse your goods.',3,128,0,0,0,0,0, ''),
(7691,0,3, 'Train me.',5,16,6647,0,0,0,0, ''),
(6647,0,3, 'I would like to train further in the ways of the Light.',5,16,7938,0,0,0,0, ''),
(6647,1,0, 'I wish to unlearn my talents.',16,16,0,0,0,0,0, '');

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=7348 AND `text_id`=9619;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7348,9619);
DELETE FROM `gossip_menu` WHERE `entry`=8524 AND `text_id`=10659;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8524,10659);
DELETE FROM `gossip_menu` WHERE `entry`=8510 AND `text_id`=10643;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8510,10643);
DELETE FROM `gossip_menu` WHERE `entry`=7375 AND `text_id`=8813;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7375,8813);
DELETE FROM `gossip_menu` WHERE `entry`=7372 AND `text_id`=8810;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7372,8810);
DELETE FROM `gossip_menu` WHERE `entry`=7373 AND `text_id`=8811;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7373,8811);
DELETE FROM `gossip_menu` WHERE `entry`=12594 AND `text_id`=17713;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (12594,17713);
DELETE FROM `gossip_menu` WHERE `entry`=7342 AND `text_id`=8751;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7342,8751);
DELETE FROM `gossip_menu` WHERE `entry`=7345 AND `text_id`=8756;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7345,8756);
DELETE FROM `gossip_menu` WHERE `entry`=7881 AND `text_id`=9644;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7881,9644);
DELETE FROM `gossip_menu` WHERE `entry`=7312 AND `text_id`=8680;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7312,8680);
DELETE FROM `gossip_menu` WHERE `entry`=7317 AND `text_id`=8685;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7317,8685);
DELETE FROM `gossip_menu` WHERE `entry`=7189 AND `text_id`=8469;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7189,8469);
DELETE FROM `gossip_menu` WHERE `entry`=7880 AND `text_id`=9643;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7880,9643);
DELETE FROM `gossip_menu` WHERE `entry`=7963 AND `text_id`=9788;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7963,9788);
DELETE FROM `gossip_menu` WHERE `entry`=8081 AND `text_id`=9988;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8081,9988);

-- Creature Gossip_menu_id Update from sniff
UPDATE `creature_template` SET `gossip_menu_id`=8524 WHERE `entry`=22258;
UPDATE `creature_template` SET `gossip_menu_id`=7375 WHERE `entry`=16845;
UPDATE `creature_template` SET `gossip_menu_id`=7372 WHERE `entry`=17123;
UPDATE `creature_template` SET `gossip_menu_id`=7373 WHERE `entry`=16848;
UPDATE `creature_template` SET `gossip_menu_id`=7342 WHERE `entry`=17015;
UPDATE `creature_template` SET `gossip_menu_id`=7345 WHERE `entry`=17046;
UPDATE `creature_template` SET `gossip_menu_id`=7881 WHERE `entry`=18997;
UPDATE `creature_template` SET `gossip_menu_id`=7312 WHERE `entry`=16792;
UPDATE `creature_template` SET `gossip_menu_id`=7317 WHERE `entry`=16794;
UPDATE `creature_template` SET `gossip_menu_id`=7288 WHERE `entry`=18905;
UPDATE `creature_template` SET `gossip_menu_id`=7880 WHERE `entry`=17277;
UPDATE `creature_template` SET `gossip_menu_id`=8081 WHERE `entry`=20159;

-- Creature Gossip_menu_option Update from sniff
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8510,7881,7880,7964,8081) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(8510,0,0, 'Yes, Scryer.  You may possess me.',1,1,0,0,0,0,0, ''),
(7881,0,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(7880,0,1, 'I want to browse your goods.',3,128,0,0,0,0,0, ''),
(7964,0,0, 'Why don''t you escape?',1,1,7963,0,0,0,0, ''),
(8081,0,0, 'Magistrix Carinda has sent me to ask you about Arelion''s secret.  Who was he seeing?',1,1,0,0,0,0,0, ''); -- http://old.wowhead.com/quest=10286 needs scripting http://old.wowhead.com/npc=20159

-- NPC talk text insert from sniff for http://old.wowhead.com/quest=10286
DELETE FROM `creature_text` WHERE `entry` IN (20159) AND `groupid` IN (0,1);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(20159,0,0, 'If you think I''ll betray my friend that easily, think again!  Face me, you scoundrel!',12,1,100,0,0,0, 'Magister Aledis'),
(20159,1,0, 'Spare my life!  I will tell you about Arelion''s secret.',12,1,100,0,0,0, 'Magister Aledis');

-- Gossip Menu insert from sniff
DELETE FROM `gossip_menu` WHERE `entry`=7953 AND `text_id`=10109;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7953,10109);

-- SAI for Wing Commamder Brack
SET @ENTRY := 19401;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,7967,0,0,0,11,33825,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Wing Commamder Brack - On gossip option 0 select - Cast Aerial Assault Flight (Horde)'),
(@ENTRY,0,1,0,62,0,100,0,7967,1,0,0,11,33825,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Wing Commamder Brack - On gossip option 1 select - Cast Aerial Assault Flight (Horde)'),
(@ENTRY,0,2,0,62,0,100,0,7967,4,0,0,11,34578,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Wing Commamder Brack - On gossip option 4 select - Cast Taxi - Reaver''s Fall to Spinebreaker Ridge'),
(@ENTRY,0,3,0,62,0,100,0,7967,5,0,0,11,33659,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Wing Commamder Brack - On gossip option 5 select - Cast Gateways Murket and Shaadraz');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=7967;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,7967,0,0,9,10162,0,0,0,'','Show gossip option 0 if player has Quest 10162 "Mission: The Abyssal Shelf"'),
(15,7967,1,0,9,10347,0,0,0,'','Show gossip option 1 if player has Quest 10347 "Return to the Abyssal Shelf"'),
(15,7967,4,0,9,10242,0,0,0,'','Show gossip option 4 if player has Quest 10242 "Spinebreaker Post"'),
(15,7967,5,0,9,10129,0,0,0,'','Show gossip option 5 if player has Quest 10129 "Mission: Gateways Murketh and Shaadraz"'),
(15,8081,0,0,9,10286,0,0,0,'','Show gossip option 0 if player has Quest 10286 "Arelion''s Secret"'),
(15,7938,1,0,9,10289,0,0,0,'','Show gossip option 0 if player has Quest 10289 "Journey to Thrallmar"');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=7953;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,7953,10109,0,8,10162,0,0,0,'','Show gossip text 10109 if player has rewarded Quest 10349 "The Earthbinder"');

-- SAI for Vlagga Freyfeather <Wind Rider Master>
SET @ENTRY := 18930;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,7938,1,0,0,11,34924,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Vlagga Freyfeather - On gossip option 1 select - Cast Stair of Destiny to Thrallmar');

-- SAI for Marcella Bloom
SET @ENTRY := 32421;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5717.51,`position_y`=688.2948,`position_z`=645.7512 WHERE `guid`=111385;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - On spawn - Start WP movement'),
(@ENTRY,0,1,0,40,0,100,0,1,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 1 - pause path'),
(@ENTRY,0,2,0,40,0,100,0,6,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 6 - pause path'),
(@ENTRY,0,3,4,40,0,100,0,11,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 11 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.577925, 'Marcella Bloom - Reach wp 11 - turm to'),
(@ENTRY,0,5,0,40,0,100,0,19,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 19 - pause path'),
(@ENTRY,0,6,7,40,0,100,0,23,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 23 - pause path'),
(@ENTRY,0,7,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.710423, 'Marcella Bloom - Reach wp 23 - turm to'),
(@ENTRY,0,8,0,40,0,100,0,28,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 28 - pause path'),
(@ENTRY,0,9,10,40,0,100,0,29,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 29 - pause path'),
(@ENTRY,0,10,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.689773, 'Marcella Bloom - Reach wp 29 - turm to');
-- Waypoints for Marcella Bloom from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5716.89,687.1589,645.7512, 'Marcella Bloom'),
(@ENTRY,2,5718.788,687.6731,645.7512, 'Marcella Bloom'),
(@ENTRY,3,5720.209,685.3612,645.7512, 'Marcella Bloom'),
(@ENTRY,4,5719.699,682.4218,645.7512, 'Marcella Bloom'),
(@ENTRY,5,5717.591,679.3567,645.7512, 'Marcella Bloom'),
(@ENTRY,6,5720.298,678.0955,646.5342, 'Marcella Bloom'),
(@ENTRY,7,5718.915,679.5812,645.7512, 'Marcella Bloom'),
(@ENTRY,8,5719.611,681.8755,645.7512, 'Marcella Bloom'),
(@ENTRY,9,5722.21,685.3296,645.7512, 'Marcella Bloom'),
(@ENTRY,10,5724.167,689.1262,645.7512, 'Marcella Bloom'),
(@ENTRY,11,5721.995,691.3812,645.7512, 'Marcella Bloom'),
(@ENTRY,12,5722.081,690.9567,645.7512, 'Marcella Bloom'),
(@ENTRY,13,5723.241,689.3571,645.7512, 'Marcella Bloom'),
(@ENTRY,14,5722.383,687.1551,645.7512, 'Marcella Bloom'),
(@ENTRY,15,5720.378,686.7902,645.7512, 'Marcella Bloom'),
(@ENTRY,16,5718.554,688.1351,645.7512, 'Marcella Bloom'),
(@ENTRY,17,5716.704,689.7863,645.7512, 'Marcella Bloom'),
(@ENTRY,18,5714.546,691.0844,645.7512, 'Marcella Bloom'),
(@ENTRY,19,5712.564,690.2685,645.7512, 'Marcella Bloom'),
(@ENTRY,20,5712.319,692.1107,645.7512, 'Marcella Bloom'),
(@ENTRY,21,5710.912,694.2338,645.7512, 'Marcella Bloom'),
(@ENTRY,22,5707.329,693.1917,645.7512, 'Marcella Bloom'),
(@ENTRY,23,5705.615,695.2361,645.7512, 'Marcella Bloom'),
(@ENTRY,24,5706.731,693.772,645.7512, 'Marcella Bloom'),
(@ENTRY,25,5708.21,694.3374,645.7512, 'Marcella Bloom'),
(@ENTRY,26,5709.226,695.5887,645.7512, 'Marcella Bloom'),
(@ENTRY,27,5711.422,696.0734,645.7512, 'Marcella Bloom'),
(@ENTRY,28,5713.526,695.2763,645.7512, 'Marcella Bloom'),
(@ENTRY,29,5713.636,691.7002,645.7512, 'Marcella Bloom'),
(@ENTRY,30,5716.311,690.1725,645.7512, 'Marcella Bloom'),
(@ENTRY,31,5717.51,688.2948,645.7512, 'Marcella Bloom');

-- SAI for Inzi Charmlight
SET @ENTRY := 28682;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5715.564,`position_y`=678.4122,`position_z`=645.7512 WHERE `guid`=97343;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - On spawn - Start WP movement'),
(@ENTRY,0,1,0,40,0,100,0,6,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 6 - pause path'),
(@ENTRY,0,2,0,40,0,100,0,18,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 18 - pause path'),
(@ENTRY,0,3,4,40,0,100,0,21,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 21 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.426008, 'Marcella Bloom - Reach wp 21 - turm to'),
(@ENTRY,0,5,0,40,0,100,0,22,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 22 - pause path'),
(@ENTRY,0,6,0,40,0,100,0,27,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Marcella Bloom - Reach wp 27 - pause path');
-- Waypoints for Inzi Charmlight from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5719.897,682.5544,645.7512, 'Inzi Charmlight'),
(@ENTRY,2,5719.891,686.0665,645.7512, 'Inzi Charmlight'),
(@ENTRY,3,5717.111,689.0646,645.7512, 'Inzi Charmlight'),
(@ENTRY,4,5711.454,694.7701,645.7512, 'Inzi Charmlight'),
(@ENTRY,5,5711.846,699.7839,645.7512, 'Inzi Charmlight'),
(@ENTRY,6,5709.633,700.0297,645.7512, 'Inzi Charmlight'),
(@ENTRY,7,5711.143,699.2699,645.7512, 'Inzi Charmlight'),
(@ENTRY,8,5712.436,694.9948,645.7512, 'Inzi Charmlight'),
(@ENTRY,9,5714.122,692.908,645.7512, 'Inzi Charmlight'),
(@ENTRY,10,5716.777,690.9016,645.7512, 'Inzi Charmlight'),
(@ENTRY,11,5718.896,688.1526,645.7512, 'Inzi Charmlight'),
(@ENTRY,12,5720.531,686.9282,645.7512, 'Inzi Charmlight'),
(@ENTRY,13,5722.85,687.8686,645.7512, 'Inzi Charmlight'),
(@ENTRY,14,5726.107,690.4207,645.7512, 'Inzi Charmlight'),
(@ENTRY,15,5727.03,694.2952,645.7512, 'Inzi Charmlight'),
(@ENTRY,16,5711.432,707.4515,653.6919, 'Inzi Charmlight'),
(@ENTRY,17,5708.918,708.4698,653.7011, 'Inzi Charmlight'),
(@ENTRY,18,5708.552,708.3618,653.7029, 'Inzi Charmlight'),
(@ENTRY,19,5709.459,706.2948,653.7265, 'Inzi Charmlight'),
(@ENTRY,20,5707.508,704.3312,653.7484, 'Inzi Charmlight'),
(@ENTRY,21,5705.197,703.1964,653.7423, 'Inzi Charmlight'),
(@ENTRY,22,5702.96,703.35,653.7493, 'Inzi Charmlight'),
(@ENTRY,23,5703.561,701.5987,653.7566, 'Inzi Charmlight'),
(@ENTRY,24,5703,699.5547,653.7488, 'Inzi Charmlight'),
(@ENTRY,25,5700.375,698.8538,653.7443, 'Inzi Charmlight'),
(@ENTRY,26,5697.52,698.8721,653.7496, 'Inzi Charmlight'),
(@ENTRY,27,5697.274,696.8895,653.7393, 'Inzi Charmlight'),
(@ENTRY,28,5697.476,697.3153,653.7394, 'Inzi Charmlight'),
(@ENTRY,29,5699.13,698.1936,653.7425, 'Inzi Charmlight'),
(@ENTRY,30,5700.803,696.9131,653.7471, 'Inzi Charmlight'),
(@ENTRY,31,5700.124,694.2091,653.7356, 'Inzi Charmlight'),
(@ENTRY,32,5698.897,690.7084,653.7178, 'Inzi Charmlight'),
(@ENTRY,33,5715.564,678.4122,645.7512, 'Inzi Charmlight');

-- SAI for Katherine Lee
SET @ENTRY := 28705;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5707.611,`position_y`=715.5347,`position_z`=642.4725 WHERE `guid`=98952;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Katherine Lee - On spawn - Start WP movement'),
(@ENTRY,0,1,2,40,0,100,0,5,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Katherine Lee - Reach wp 5 - pause path'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.8377581, 'Katherine Lee - Reach wp 5 - turm to'),
(@ENTRY,0,3,4,40,0,100,0,10,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Katherine Lee - Reach wp 10 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.408554, 'Katherine Lee - Reach wp 10 - turm to');
-- Waypoints for Katherine Lee from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5708.027,715.2877,642.4726, 'Katherine Lee'),
(@ENTRY,2,5707.466,713.4067,642.4758, 'Katherine Lee'),
(@ENTRY,3,5705.038,713.5079,642.4757, 'Katherine Lee'),
(@ENTRY,4,5702.446,715.9288,642.4717, 'Katherine Lee'),
(@ENTRY,5,5700.928,718.1786,642.4681, 'Katherine Lee'),
(@ENTRY,6,5702.446,715.9288,642.4717, 'Katherine Lee'),
(@ENTRY,7,5705.038,713.5079,642.4757, 'Katherine Lee'),
(@ENTRY,8,5707.466,713.4067,642.4758, 'Katherine Lee'),
(@ENTRY,9,5708.027,715.2877,642.4726, 'Katherine Lee'),
(@ENTRY,10,5707.611,715.5347,642.4725, 'Katherine Lee');

-- SAI for Laire Brewgold
SET @ENTRY := 32424;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5639.154,`position_y`=728.4048,`position_z`=641.61 WHERE `guid`=111730;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Laire Brewgold - On spawn - Start WP movement'),
(@ENTRY,0,1,2,40,0,100,0,1,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Laire Brewgold - Reach wp 1 - pause path'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.8377581, 'Laire Brewgold - Reach wp 1 - turm to'),
(@ENTRY,0,3,4,40,0,100,0,2,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Laire Brewgold - Reach wp 2 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.122173, 'Laire Brewgold - Reach wp 2 - turm to'),
(@ENTRY,0,5,6,40,0,100,0,10,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Laire Brewgold - Reach wp 10 - pause path'),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.583087, 'Laire Brewgold - Reach wp 10 - turm to');
-- Waypoints for Laire Brewgold from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5635.932,732.4274,641.7092, 'Laire Brewgold'),
(@ENTRY,2,5633.13,729.802,641.7224, 'Laire Brewgold'),
(@ENTRY,3,5632.857,730.7568,641.7197, 'Laire Brewgold'),
(@ENTRY,4,5638.495,728.9272,641.6107, 'Laire Brewgold'),
(@ENTRY,5,5642.401,730.9983,641.6825, 'Laire Brewgold'),
(@ENTRY,6,5645.889,733.0624,641.682, 'Laire Brewgold'),
(@ENTRY,7,5655.076,730.4822,641.6819, 'Laire Brewgold'),
(@ENTRY,8,5661.111,726.7043,641.6643, 'Laire Brewgold'),
(@ENTRY,9,5663.163,728.8862,641.6496, 'Laire Brewgold'),
(@ENTRY,10,5661.848,731.7643,641.6437, 'Laire Brewgold'),
(@ENTRY,11,5661.233,732.0867,641.6819, 'Laire Brewgold'),
(@ENTRY,12,5661.178,729.5889,641.6537, 'Laire Brewgold'),
(@ENTRY,13,5659.352,724.879,641.6767, 'Laire Brewgold'),
(@ENTRY,14,5656.774,721.9439,641.6959, 'Laire Brewgold'),
(@ENTRY,15,5653.122,721.5146,641.6296, 'Laire Brewgold'),
(@ENTRY,16,5649.408,722.6322,641.5455, 'Laire Brewgold'),
(@ENTRY,17,5645.466,725.3781,641.6395, 'Laire Brewgold'),
(@ENTRY,18,5639.154,728.4048,641.61, 'Laire Brewgold');

-- SAI for Coira Longrifle
SET @ENTRY := 32426;
UPDATE `creature` SET `spawndist`=0,`MovementType`=0,`position_x`=5644.824,`position_y`=730.5149,`position_z`=641.6822 WHERE `guid`=111940;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY; 
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,53,0,@ENTRY,1,0,0,0,1,0,0,0,0,0,0,0, 'Coira Longrifle - On spawn - Start WP movement'),
(@ENTRY,0,1,2,40,0,100,0,5,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coira Longrifle - Reach wp 5 - pause path'),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.740167, 'Coira Longrifle - Reach wp 5 - turm to'),
(@ENTRY,0,3,4,40,0,100,0,14,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coira Longrifle - Reach wp 14 - pause path'),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.996804, 'Coira Longrifle - Reach wp 14 - turm to'),
(@ENTRY,0,5,6,40,0,100,0,20,@ENTRY,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Coira Longrifle - Reach wp 20 - pause path'),
(@ENTRY,0,6,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.864306, 'Coira Longrifle - Reach wp 20 - turm to');
-- Waypoints for Coira Longrifle from sniff
DELETE FROM `waypoints` WHERE `entry`=@ENTRY;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ENTRY,1,5643.844,727.0675,641.6488, 'Coira Longrifle'),
(@ENTRY,2,5650.929,722.0482,641.5745, 'Coira Longrifle'),
(@ENTRY,3,5656.711,719.6259,641.5991, 'Coira Longrifle'),
(@ENTRY,4,5658.714,721.329,641.6793, 'Coira Longrifle'),
(@ENTRY,5,5658.198,724.0913,641.6834, 'Coira Longrifle'),
(@ENTRY,6,5658.953,723.9452,641.6814, 'Coira Longrifle'),
(@ENTRY,7,5661.61,728.0839,641.6577, 'Coira Longrifle'),
(@ENTRY,8,5664.91,733.9921,641.6255, 'Coira Longrifle'),
(@ENTRY,9,5663.366,736.1543,641.5908, 'Coira Longrifle'),
(@ENTRY,10,5660.653,736.6083,641.6053, 'Coira Longrifle'),
(@ENTRY,11,5659.226,737.1793,641.6076, 'Coira Longrifle'),
(@ENTRY,12,5656.145,740.5176,641.5779, 'Coira Longrifle'),
(@ENTRY,13,5652.403,743.0245,641.5914, 'Coira Longrifle'),
(@ENTRY,14,5648.907,746.6327,641.6072, 'Coira Longrifle'),
(@ENTRY,15,5648.699,746.1017,641.6102, 'Coira Longrifle'),
(@ENTRY,16,5648.634,743.4974,641.6179, 'Coira Longrifle'),
(@ENTRY,17,5647.743,739.7487,641.6585, 'Coira Longrifle'),
(@ENTRY,18,5645.861,735.217,641.6819, 'Coira Longrifle'),
(@ENTRY,19,5644.097,732.8497,641.6823, 'Coira Longrifle'),
(@ENTRY,20,5645.18,730.3257,641.6822, 'Coira Longrifle'),
(@ENTRY,21,5644.824,730.5149,641.6822, 'Coira Longrifle');

-- Defines
SET @WHITEBARK_SPIRIT_ENTRY := 19456;
SET @SPELL_ENTANGLING_ROOTS := 31287;
SET @SPELL_WITHERED_TOUCH := 11442;
-- Template
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WHITEBARK_SPIRIT_ENTRY;
-- Delete old data
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@WHITEBARK_SPIRIT_ENTRY;
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-1051,-1052);
-- Texts
DELETE FROM `creature_text` WHERE `entry`=@WHITEBARK_SPIRIT_ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@WHITEBARK_SPIRIT_ENTRY,0,0,'What good does this violence serve?  What is done is done.  I have failed my people.',12,0,50,0,0,0,'Whitebark''s Spirit - 19456'),
(@WHITEBARK_SPIRIT_ENTRY,0,1,'Haven''t you done enough harm?  Must you also disturb my slumber?',12,0,50,0,0,0,'Whitebark''s Spirit - 19456');
-- Script
DELETE FROM `smart_scripts` WHERE `entryorguid`=@WHITEBARK_SPIRIT_ENTRY;
INSERT INTO `smart_scripts`
(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@WHITEBARK_SPIRIT_ENTRY,0,0,0,0,0,100,0,2500,5500,12000,14500,11,@SPELL_ENTANGLING_ROOTS,0,0,0,0,0,2,0,0,0,0,0,0,0,'Whitebark''s Spirit - Casts Entangling Roots'),
(@WHITEBARK_SPIRIT_ENTRY,0,1,0,0,0,100,0,7500,7500,9500,16000,11,@SPELL_WITHERED_TOUCH,0,0,0,0,0,2,0,0,0,0,0,0,0,'Whitebark''s Spirit - Casts Withered Touch'),
(@WHITEBARK_SPIRIT_ENTRY,0,2,0,2,0,100,1,0,25,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whitebark''s Spirit - Say At 25% HP'),
(@WHITEBARK_SPIRIT_ENTRY,0,3,4,2,0,100,1,0,20,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whitebark''s Spirit - At 20% HP change faction to friendly'),
(@WHITEBARK_SPIRIT_ENTRY,0,4,0,61,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whitebark''s Spirit - At 20% HP - evade'),
(@WHITEBARK_SPIRIT_ENTRY,0,5,0,1,0,100,0,15000,15000,15000,15000,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whitebark''s Spirit - after 15sec OOC  - despawn');

UPDATE `creature_template` SET `baseattacktime`=2000,`speed_run`=0.99206 WHERE `entry`=35321;
UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000,`spell1`=51421 WHERE `entry`=28366;
UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000,`exp`=2,`minlevel`=75,`maxlevel`=75,`baseattacktime`=2000,`speed_run`=3.42857,`VehicleId`=107 WHERE `entry`=35299;
UPDATE `creature_model_info` SET `bounding_radius`=0.3055,`combat_reach`=1,`gender`=2 WHERE `modelid`=27101;
UPDATE `creature_model_info` SET `bounding_radius`=0.434,`combat_reach`=1.4,`gender`=0 WHERE `modelid`=29862;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=35299;
INSERT INTO `npc_spellclick_spells` VALUES
(35299,46598,0,0,0,1,0,0,0);

DELETE FROM `npc_text` WHERE `ID` IN (14121,14122,17713) AND `WDBVerified`=-1;
INSERT INTO `npc_text` (`ID`,`text0_0`,`WDBVerified`) VALUES -- needs dataz
(14121, '<Placeholder>', -1),
(14122, '<Placeholder>', -1),
(17713, '<Placeholder>', -1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=342 AND `SourceEntry`=1;

UPDATE `version` SET `db_version`='TDB 335.11.41' LIMIT 1;

UPDATE `creature_template` SET `baseattacktime`=2000,`speed_run`=0.99206 WHERE `entry`=35321;
UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000,`spell1`=51421 WHERE `entry`=28366;
UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000,`exp`=2,`minlevel`=75,`maxlevel`=75,`baseattacktime`=2000,`speed_run`=3.42857,`VehicleId`=107 WHERE `entry`=35299;
UPDATE `creature_model_info` SET `bounding_radius`=0.3055,`combat_reach`=1,`gender`=2 WHERE `modelid`=27101;
UPDATE `creature_model_info` SET `bounding_radius`=0.434,`combat_reach`=1.4,`gender`=0 WHERE `modelid`=29862;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=35299;
INSERT INTO `npc_spellclick_spells` VALUES
(35299,46598,0,0,0,1,0,0,0);

-- SAI for Lieutenant Commander Thalvos
SET @ENTRY := 16978;
UPDATE `creature_template` SET `ScriptName`='',`AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY; -- Remove EAI
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,10848,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Lieutenant Commander Thalvos - On spawn - Cast Shroud of Death on self'),
(@ENTRY,0,1,0,0,0,50,0,4000,4000,8000,8000,11,8242,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Lieutenant Commander Thalvos - Combat - Cast Shield Slam on victim'),
(@ENTRY,0,2,0,0,0,50,0,5000,5000,10000,10000,11,11976,1,0,0,0,0,2,0,0,0,0,0,0,0, 'Lieutenant Commander Thalvos - Combat - Cast Strike on victim');

-- Pathing for Lieutenant Commander Thalvos Entry: 16978
SET @NPC := 59381;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1402.399,`position_y`=2707.896,`position_z`=-27.4831 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1400.287,2711.631,-27.80707,0,0,0,100,0),
(@PATH,2,-1401.863,2713.817,-28.77578,0,0,0,100,0),
(@PATH,3,-1400.287,2711.631,-27.80707,0,0,0,100,0),
(@PATH,4,-1402.399,2707.896,-27.4831,0,0,0,100,0);

DELETE FROM `spell_script_names` WHERE `ScriptName`= 'spell_gen_shroud_of_death';

