-- Fix Quest 10526 The Thunderspike

UPDATE `gameobject_template` SET `data5`=1, `AIName`= 'SmartGameObjectAI' WHERE `entry` =184729;

UPDATE `gameobject` SET `spawntimesecs` = 30 WHERE `id` = 184729;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 21319;

DELETE FROM `smart_scripts` WHERE entryorguid = 184729 AND source_type = 1;
DELETE FROM `smart_scripts` WHERE entryorguid = 18472900 AND source_type = 9;
DELETE FROM `smart_scripts` WHERE entryorguid = 21319 AND source_type = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(184729,1,0,0,64,0,100,0,0,0,0,0,80,18472900,0,2,0,0,0,1,0,0,0,0,0,0,0, 'on Gossip Hello - Start Timed Actionlist'),
(18472900, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 12, 21319, 1, 60000, 0, 0, 0, 8, 0, 0, 0, 1315.9, 6690.4, -18.5, 0, 'on Gossip Hello - Summon Gor Grimgut'),

(21319,0,0,0,2,0,100,0,0,70,12000,12000,11,35491,2,0,0,0,0,1,0,0,0,0,0,0,0,'Below 70% HP - Cast Furious Rage');
