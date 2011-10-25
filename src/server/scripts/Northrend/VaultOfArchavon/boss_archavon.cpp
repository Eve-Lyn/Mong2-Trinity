/*
 * Copyright (C) 2008-2011 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "ScriptPCH.h"
#include "vault_of_archavon.h"

#define EMOTE_BERSERK           -1590002

// Spells Archavon
#define SPELL_ROCK_SHARDS        58678
#define SPELL_CRUSHING_LEAP      RAID_MODE(58960, 60894)
#define SPELL_STOMP              RAID_MODE(58663, 60880)
#define SPELL_IMPALE             RAID_MODE(58666, 60882)
#define SPELL_BERSERK            47008
// Spells Archavon Warders
#define SPELL_ROCK_SHOWER        RAID_MODE(60919, 60923)
#define SPELL_SHIELD_CRUSH       RAID_MODE(60897, 60899)
#define SPELL_WHIRL              RAID_MODE(60902, 60916)

// 4 Warders spawned
#define ARCHAVON_WARDER          32353 // npc 32353

// Yell
#define SAY_LEAP "Archavon the Stone Watcher lunges for $N!" // $N should be the target

enum Events
{
    // Archavon
    EVENT_ROCK_SHARDS = 1,
    EVENT_LEAP,
    EVENT_STOMP,
    EVENT_BERSERK,

    // Warders
    EVENT_ROCK_SHOWER,
    EVENT_SHIELD_CRUSH,
    EVENT_WHIRL
};

class boss_archavon : public CreatureScript
{
    public:
        boss_archavon() : CreatureScript("boss_archavon") { }

        struct boss_archavonAI : public BossAI
        {
            boss_archavonAI(Creature* creature) : BossAI(creature, DATA_ARCHAVON)
            {
            }

            void PassengerBoarded(Unit* who, int8 /*seatId*/, bool apply)
            {
                if (!who->ToPlayer())
                    return;

                if (apply)
                {
                    // try to prevent evade in UpdateVictim()
                    who->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_ALL, true);
                    me->SetInCombatWithZone();
                }
                else
                {
                    me->resetAttackTimer();
                    who->ApplySpellImmune(0, IMMUNITY_DAMAGE, SPELL_SCHOOL_MASK_ALL, false);
                    DoCast(who, SPELL_IMPALE, true);
                }
            }

            void EnterCombat(Unit* /*who*/)
            {
                events.ScheduleEvent(EVENT_ROCK_SHARDS, 15000, 1);
                events.ScheduleEvent(EVENT_LEAP, 30000);
                events.ScheduleEvent(EVENT_STOMP, 45000);
                events.ScheduleEvent(EVENT_BERSERK, 300000);

                _EnterCombat();
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);
                _DoAggroPulse(diff);

                if (me->HasUnitState(UNIT_STAT_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_ROCK_SHARDS:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                DoCast(target, SPELL_ROCK_SHARDS);
                            events.ScheduleEvent(EVENT_ROCK_SHARDS, 15000, 1);
                            break;
                        case EVENT_LEAP:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, -10, true))
                            {
                                DoCast(target, SPELL_CRUSHING_LEAP);
                                events.ScheduleEvent(EVENT_LEAP, 30000);
                            }
                            else
                                events.ScheduleEvent(EVENT_LEAP, 3000);
                            break;
                        case EVENT_STOMP:
                            DoCast(SPELL_STOMP);
                            events.DelayEvents(3000, 1);
                            events.ScheduleEvent(EVENT_STOMP, 45000);
                            break;
                        case EVENT_BERSERK:
                            DoCast(me, SPELL_BERSERK, true);
                            DoScriptText(EMOTE_BERSERK, me);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new boss_archavonAI(creature);
        }
};

/*######
##  Mob Archavon Warder
######*/
class mob_archavon_warder : public CreatureScript
{
    public:
        mob_archavon_warder() : CreatureScript("mob_archavon_warder") { }

        struct mob_archavon_warderAI : public ScriptedAI // npc 32353
        {
            mob_archavon_warderAI(Creature* creature) : ScriptedAI(creature)
            {
            }

            EventMap events;

            void Reset()
            {
                events.Reset();
                events.ScheduleEvent(EVENT_ROCK_SHOWER, 2000);
                events.ScheduleEvent(EVENT_SHIELD_CRUSH, 20000);
                events.ScheduleEvent(EVENT_WHIRL, 7500);
            }

            void EnterCombat(Unit* /*who*/)
            {
                DoZoneInCombat();
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STAT_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_ROCK_SHOWER:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                                DoCast(target, SPELL_ROCK_SHOWER);
                            events.ScheduleEvent(EVENT_ROCK_SHARDS, 6000);
                            break;
                        case EVENT_SHIELD_CRUSH:
                            DoCastVictim(SPELL_SHIELD_CRUSH);
                            events.ScheduleEvent(EVENT_SHIELD_CRUSH, 20000);
                            break;
                        case EVENT_WHIRL:
                            DoCastVictim(SPELL_WHIRL);
                            events.ScheduleEvent(EVENT_WHIRL, 8000);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new mob_archavon_warderAI(creature);
        }
};

void AddSC_boss_archavon()
{
    new boss_archavon();
    new mob_archavon_warder();
}
