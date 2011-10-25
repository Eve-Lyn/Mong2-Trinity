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
#include "drak_tharon_keep.h"

#define SPELL_ARCANE_BLAST                          DUNGEON_MODE(49198,59909)
#define SPELL_ARCANE_FIELD                          47346
#define SPELL_BLIZZARD                              DUNGEON_MODE(49034,59854)
#define SPELL_FROSTBOLT                             DUNGEON_MODE(49037,59855)
#define SPELL_WARTH_OF_MISERY                       DUNGEON_MODE(50089,59856)
#define SPELL_SUMMON_MINIONS                        59910

//not in db
enum Yells
{
    SAY_AGGRO                                     = -1600000,
    SAY_KILL                                      = -1600001,
    SAY_DEATH                                     = -1600002,
    SAY_NECRO_ADD                                 = -1600003,
    SAY_REUBBLE_1                                 = -1600004,
    SAY_REUBBLE_2                                 = -1600005
};

enum Creatures
{
    CREATURE_RISEN_SHADOWCASTER                   = 27600,
    CREATURE_FETID_TROLL_CORPSE                   = 27598,
    CREATURE_HULKING_CORPSE                       = 27597,
    CREATURE_CRYSTAL_HANDLER                      = 26627
};

enum CombatPhase
{
    IDLE,
    PHASE_1,
    PHASE_2
};

enum Achievements
{
    ACHIEV_OH_NOVOS                               = 2057
};

enum Events
{
    EVENT_NONE,
    EVENT_CRYSTAL,
    EVENT_SUMMON,
    EVENT_BLIZZARD,
    EVENT_BLAST,
    EVENT_BOLT,
    EVENT_CURSE,
    EVENT_HERO_SUMMON
};

#define MAX_SUMMONS                            5

static Position AddSpawnPoint                = { -379.20f, -816.76f, 59.70f };
static Position CrystalHandlerSpawnPoint     = { -326.626343f, -709.956604f, 27.813314f };
static Position AddDestinyPoint              = { -379.314545f, -772.577637f, 28.58837f };

class boss_novos : public CreatureScript
{
public:
    boss_novos() : CreatureScript("boss_novos") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new boss_novosAI (pCreature);
    }

    struct boss_novosAI : public Scripted_NoMovementAI
    {
        boss_novosAI(Creature* c) : Scripted_NoMovementAI(c), lSummons(me)
        {
            pInstance = c->GetInstanceScript();
        }

        InstanceScript* pInstance;

        bool achiev;
        uint8 crystalHandlerAmount;

        SummonList lSummons;
        EventMap events;
        CombatPhase Phase;

        std::list<uint64> luiCrystals;

        void Reset()
        {
            Phase = IDLE;
            luiCrystals.clear();
            achiev = true;
            me->CastStop();
            lSummons.DespawnAll();
            crystalHandlerAmount = 0;
            events.Reset();

            if (me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE))
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
            if (me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            if (me->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE))
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

            if (pInstance)
            {
                pInstance->SetData(DATA_NOVOS_EVENT, NOT_STARTED);
                luiCrystals.push_back(pInstance->GetData64(DATA_NOVOS_CRYSTAL_1));
                luiCrystals.push_back(pInstance->GetData64(DATA_NOVOS_CRYSTAL_2));
                luiCrystals.push_back(pInstance->GetData64(DATA_NOVOS_CRYSTAL_3));
                luiCrystals.push_back(pInstance->GetData64(DATA_NOVOS_CRYSTAL_4));
                for (std::list<uint64>::const_iterator itr = luiCrystals.begin(); itr != luiCrystals.end(); ++itr)
                {
                    if (GameObject* go = pInstance->instance->GetGameObject(*itr))
                        go->SetGoState(GO_STATE_READY);
                }
            }
        }

        void EnterCombat(Unit * /*who*/)
        {
            DoScriptText(SAY_AGGRO, me);
            Phase = PHASE_1;
            events.ScheduleEvent(EVENT_CRYSTAL, 30*IN_MILLISECONDS);
            events.ScheduleEvent(EVENT_SUMMON, 1*IN_MILLISECONDS);

            me->RemoveAllAuras();
            DoCast(SPELL_ARCANE_FIELD);
            if (pInstance)
            {
                for (std::list<uint64>::const_iterator itr = luiCrystals.begin(); itr != luiCrystals.end(); ++itr)
                {
                    if (GameObject* go = pInstance->instance->GetGameObject(*itr))
                        go->SetGoState(GO_STATE_ACTIVE);
                }
                pInstance->SetData(DATA_NOVOS_EVENT, IN_PROGRESS);
            }
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);

            DoAttackerAreaInCombat(me, 100.0f);
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            events.Update(diff);

            if (me->HasUnitState(UNIT_STAT_CASTING) && Phase != PHASE_1)
                return;

            while (uint32 eventId = events.ExecuteEvent())
            {
                switch (eventId)
                {
                    case EVENT_CRYSTAL:
                        if (crystalHandlerAmount < 4)
                        {
                            DoScriptText(SAY_NECRO_ADD, me);
                            me->SummonCreature(CREATURE_CRYSTAL_HANDLER, CrystalHandlerSpawnPoint, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 20*IN_MILLISECONDS);
                            events.ScheduleEvent(EVENT_CRYSTAL, 20*IN_MILLISECONDS);
                        }
                        break;
                    case EVENT_SUMMON:
                        me->SummonCreature(RAND(CREATURE_FETID_TROLL_CORPSE, CREATURE_HULKING_CORPSE, CREATURE_RISEN_SHADOWCASTER), AddSpawnPoint,
                            TEMPSUMMON_CORPSE_TIMED_DESPAWN, 20*IN_MILLISECONDS);
                        events.ScheduleEvent(EVENT_SUMMON, 4*IN_MILLISECONDS);
                        break;
                    case EVENT_HERO_SUMMON:
                        for (int i = 0; i < MAX_SUMMONS; i++)
                            me->SummonCreature(CREATURE_FETID_TROLL_CORPSE, me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0,
                            TEMPSUMMON_CORPSE_TIMED_DESPAWN, 1*IN_MILLISECONDS);
                        events.ScheduleEvent(EVENT_HERO_SUMMON, urand(20*IN_MILLISECONDS, 30*IN_MILLISECONDS));
                        break;
                    case EVENT_BLIZZARD:
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                            DoCast(target, SPELL_BLIZZARD);
                        events.ScheduleEvent(EVENT_BLIZZARD, 15*IN_MILLISECONDS);
                        break;
                    case EVENT_BOLT:
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                            DoCast(target, SPELL_FROSTBOLT);
                        events.ScheduleEvent(EVENT_BOLT, urand(3*IN_MILLISECONDS, 4*IN_MILLISECONDS));
                        break;
                    case EVENT_CURSE:
                        if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                            DoCast(target, SPELL_WARTH_OF_MISERY);
                        events.ScheduleEvent(EVENT_CURSE, 9*IN_MILLISECONDS);
                        break;
                    case EVENT_BLAST:
                        DoCast(SPELL_ARCANE_BLAST);
                        events.ScheduleEvent(EVENT_BLAST, urand(20*IN_MILLISECONDS, 30*IN_MILLISECONDS));
                        break;
                }
            }
        }

        void JustDied(Unit * /*killer*/)
        {
            DoScriptText(SAY_DEATH, me);
            if (pInstance)
            {
                pInstance->SetData(DATA_NOVOS_EVENT, DONE);

                if (IsHeroic() && achiev)
                    pInstance->DoCompleteAchievement(ACHIEV_OH_NOVOS);
            }
            lSummons.DespawnAll();
        }

        void KilledUnit(Unit* victim)
        {
            if (victim == me)
                return;
            DoScriptText(SAY_KILL, me);
        }

        void JustSummoned(Creature* summon)
        {
            switch (summon->GetEntry())
            {
                case CREATURE_CRYSTAL_HANDLER:
                    crystalHandlerAmount++;
                    summon->GetMotionMaster()->MovePoint(0, AddDestinyPoint);
                    break;
                case CREATURE_FETID_TROLL_CORPSE:
                case CREATURE_HULKING_CORPSE:
                case CREATURE_RISEN_SHADOWCASTER:
                    summon->GetMotionMaster()->MovePoint(0, AddDestinyPoint);
                    break;
                default:
                    break;
            }
            lSummons.Summon(summon);
        }

        void RemoveCrystal()
        {
            if (!luiCrystals.empty())
            {
                if (pInstance)
                    if (GameObject* go = pInstance->instance->GetGameObject(luiCrystals.back()))
                        go->SetGoState(GO_STATE_READY);
                luiCrystals.pop_back();
            }
            if (luiCrystals.empty())
            {
                me->CastStop();
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                Phase = PHASE_2;
                events.Reset();
                events.ScheduleEvent(EVENT_BLIZZARD, 0);
                events.ScheduleEvent(EVENT_BLAST, urand(20*IN_MILLISECONDS, 30*IN_MILLISECONDS));
                events.ScheduleEvent(EVENT_CURSE, 5*IN_MILLISECONDS);
                events.ScheduleEvent(EVENT_BOLT, 2*IN_MILLISECONDS);

                if (IsHeroic())
                    events.ScheduleEvent(EVENT_HERO_SUMMON, 0);
            }
        }

        Unit* GetRandomTarget()
        {
            return SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true);
        }
    };
};

enum CrystalHandlerSpells
{
    SPELL_FLASH_OF_DARKNESS                       = 49668,
    H_SPELL_FLASH_OF_DARKNESS                     = 59004
};

class mob_crystal_handler : public CreatureScript
{
public:
    mob_crystal_handler() : CreatureScript("mob_crystal_handler") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_crystal_handlerAI (pCreature);
    }

    struct mob_crystal_handlerAI : public ScriptedAI
    {
        mob_crystal_handlerAI(Creature* c) : ScriptedAI(c)
        {
            pInstance = c->GetInstanceScript();
        }

        uint32 uiFlashOfDarknessTimer;
        InstanceScript* pInstance;

        void Reset()
        {
            uiFlashOfDarknessTimer = 5*IN_MILLISECONDS;
        }

        void JustDied(Unit * /*killer*/)
        {
            if (Creature* novos = Unit::GetCreature(*me, pInstance ? pInstance->GetData64(DATA_NOVOS) : 0))
                CAST_AI(boss_novos::boss_novosAI, novos->AI())->RemoveCrystal();
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            if (uiFlashOfDarknessTimer <= diff)
            {
                DoCast(me->getVictim(), DUNGEON_MODE(SPELL_FLASH_OF_DARKNESS, H_SPELL_FLASH_OF_DARKNESS));
                uiFlashOfDarknessTimer = 5*IN_MILLISECONDS;
            } else uiFlashOfDarknessTimer -= diff;

            DoMeleeAttackIfReady();
        }

        void MovementInform(uint32 type, uint32 id)
        {
            if (type != POINT_MOTION_TYPE || id != 0)
                return;

            if (Creature* novos = Unit::GetCreature(*me, pInstance ? pInstance->GetData64(DATA_NOVOS) : 0))
                if (Unit* target = CAST_AI(boss_novos::boss_novosAI, novos->AI())->GetRandomTarget())
                    AttackStart(target);
        }
    };
};

class mob_novos_minion : public CreatureScript
{
public:
    mob_novos_minion() : CreatureScript("mob_novos_minion") { }

    CreatureAI* GetAI(Creature* pCreature) const
    {
        return new mob_novos_minionAI (pCreature);
    }

    struct mob_novos_minionAI : public ScriptedAI
    {
        mob_novos_minionAI(Creature* c) : ScriptedAI(c)
        {
            pInstance = c->GetInstanceScript();
        }

        InstanceScript* pInstance;

        void MovementInform(uint32 type, uint32 id)
        {
            if (type != POINT_MOTION_TYPE || id != 0)
                return;

            if (Creature* novos = Unit::GetCreature(*me, pInstance ? pInstance->GetData64(DATA_NOVOS) : 0))
            {
                CAST_AI(boss_novos::boss_novosAI, novos->AI())->achiev = false;
                if (Unit* target = CAST_AI(boss_novos::boss_novosAI, novos->AI())->GetRandomTarget())
                    AttackStart(target);
            }
        }
    };
};

void AddSC_boss_novos()
{
    new boss_novos();
    new mob_crystal_handler();
    new mob_novos_minion();
}
