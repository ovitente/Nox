SYS_PLR_MAXHP   = {[0]=150,[1]=75,[2]=100}
SYS_PLR_MAXMANA = {[0]=0,[1]=150,[2]=125}

function revive(plr)
	if(isPlayer(plr)==false) then
		print('Only players can be revived.')
		return 0
	end
	if(unitState(plr)~=4) then
		print('This player is alive.')
		return 0
	end
	setPtrInt(plr,0x10, 150995460)
	unitHP(plr, SYS_PLR_MAXHP[getPlayerClass(plr)])
	unitMana(plr, SYS_PLR_MAXMANA[getPlayerClass(plr)])
	unitState(plr, 0) -- ћен€ем состо€ние с DEAD на WALK, дабы игрок не мог игнорировать опасные поверхности от которых он умер (огонь, лава, шипы и пр.). ≈сли это не требуетс€, то надо прописывать IDLE
	--unitPrevState(plr, 13) -- ћы не умирали! ћы сто€ли до этого (сообщаем предыдущее состо€ние - IDLE)
end

--»зменение класса текущего игрока. 0 - Warrior, 1 - Wizard, 2 - Conjurer, 3-255 - None (cannot pickup anything)
function setPlayerClass(plr, val)
	if plr==nil then plr=getHost() end
	if not isPlayer(plr) then print('Only players can change their class') return 0 end
	if val==nil then return 0 end
	local uc=getPtrPtr(plr,0x2EC)
	local uc2=getPtrPtr(uc,0x114)
	setPtrByte(uc2,0x8CB,val)
	return 1
end

-- ласс текущего игрока.
function getPlayerClass(plr)
	if not isPlayer(plr) then print('Only players can have class') return 0 end
	if plr==nil then plr=getHost() end
	local uc=getPtrPtr(plr,0x2EC)
	local uc2=getPtrPtr(uc,0x114)
	local plrclass=getPtrByte(uc2,0x8CB)
	return plrclass
end

--ѕол текущего игрока. 0 - мужской персонаж, 1 - женский персонаж
function setGender(plr,gender)
	if(gender < 0) then gender=0
	elseif(gender > 1) then gender=1 end
    
	local uc=getPtrPtr(plr,0x2EC)
    local plri=getPtrPtr(uc,0x114)
    setPtrByte(plri,0x8CC,gender)
	return 1
end

--—имулировать урон. ѕредел: 32768 (значени€ выше просто не высвечиваютс€)
--[[
Player damage types (classification: damageamount)
 0.000% -   0.096% (   29/30000) : Very light damage (damage amount is too low to be nervous about - it even has no sound)
 0.100% -   7.096% ( 2129/30000) : Light damage
 7.100% -  45.096% (13529/30000) : Medium damage
45.100% - 100.000% (30000/30000) : Heavy damage

When user's health is lower than 40%, he will hear heartbeat
]]--
function simulateDamage(obj, amount)
local useoverheal = false
local timertorestore = nil
	SYS_DAMAGE_SIMULATION_STARTAMOUNT = unitHP(obj)
	if(amount>=32769 or amount<=0) then return 0 end
	if(amount>SYS_DAMAGE_SIMULATION_STARTAMOUNT) then useoverheal = true end
	if(useoverheal) then
		unitHP(obj,amount+1)
		setTimeout(function () unitHP(obj,1) end,1)
		timertorestore = 2
	else
		unitHP(obj,SYS_DAMAGE_SIMULATION_STARTAMOUNT-amount)
		timertorestore = 1
	end
	setTimeout(function() 
		unitHP(obj, SYS_DAMAGE_SIMULATION_STARTAMOUNT)
		SYS_DAMAGE_SIMULATION_STARTAMOUNT=nil
	end,timertorestore)
end

function unitMana(obj,amount)
	local uc=getPtrPtr(obj,0x2EC)
	if(amount==nil) then
		return getPtrShort(uc,4)
	else
		if amount<=-1 then print("The unit's mana value must be highter than -1.") return end
		setPtrShort(uc,4,amount)
		return 1
	end
end

function unitMaxMana(obj,amount)
	local uc=getPtrPtr(obj,0x2EC)
	if(amount==nil) then
		return getPtrShort(uc,8)
	else
		if amount<=-1 then print("The unit's mana value cannot be negative.") return end
		if amount>9000 then print("The unit's mana value must be lower than 9000.") return end
		setPtrShort(uc,8,amount)
		return 1
	end
end

--WARNING!!! FULL OBJECT CONTROL!
--[[
”правление\получение анимации игрока. «адание текущего состо€ни€ приводит к изменению следующей байтовой переменной.
ѕо сути состо€ние игрока это список из двух элементов - текущее состо€ние и прошлое состо€ние

ѕолный список состо€ний (stateidx, animation name, description):

0 - [WALK] - Walking (Moving slow. In this condition, object can run, but will remain the same animation)
1 - <Attack animations> Attacking
2 - [CAST_SPELL] Casting spell (Object just reading a spell)
3 - [DIE] - Dying (Falling on the groud. If player - you can't do anything with you character)
4 - [DEAD] - Dead (ALREADY felt on the groud. In this condition players can respawn themselves by clicking ATTACK button)
5 - [RUN] - Running (Moving fast. In this condition, object can't walk)
10 - [CAST_SPELL] Continues to cast spell (While casting spells like lightning)
12 - [JUMP] - Jumping (funny thing - if object forced to remain this condition after jump, its animation will stuck and it will move in "Running" style.
13 - [IDLE] - Idle state (Object is standing still)
14 - [SHOOT_BOW] - Finished shoot with bow (player moving down his bow after shot)
15 - [RAISE_SHIELD] - Covering with shield (moving ahead) (if object is player - this state will be raised when object just stand still with equipped shield)
16 - [RAISE_SHIELD] - Covered with shield (object is ready to block with its shield)
17 - [RAISE_SHIELD] - Uncovering (shield) (object just started to move after block state with its shield)
18 - [GREAT_SWORD_BLOCK_RIGHT] - Blocking attack with Great Sword (arms position: right)
19 - [GREAT_SWORD_BLOCK_DOWN] - Blocking attack with Great Sword (arms position: down)
20 - [GREAT_SWORD_BLOCK_LEFT] - Blocking attack with Great Sword (arms position: left)
21 - [STAFF_BLOCK] - Blocking attack with Staff (any staff)
23 - [ELECTRIC_ZAP] - Getting hit by lightning (animation only)
24 - [TALK] - Talking (chat)
25 - [TAUNT] - Taunting
26 - [LAUGH] - Laughing
27 - [POINT] - Pointing at object (with sound)
28 - [POINT] - Still pointing at object (no sound, one-frame pointing animation (arm, pointing at object))
29 - [POINT] - Finished pointing at object (moving down arm)
30 - [RECOIL] - Got damaged by deathray\sentry\crossbow\warhammer\greatsword\shock
32 - [HARPOONTHROW] - Throwing a harpoon
33 - [IDLE] - Finished throwing a harpoon (animation ended)

6,7,8,9,11,22, 31,34-255 [IDLE] - Unknown (Same as Idle)
]]--
function unitState(obj,newstate)
	local uc=getPtrPtr(obj,0x2EC)
	if (newstate==nil) then
		return getPtrByte(uc,0x58)
	else
		unitPrevState(obj,unitState(obj))
		setPtrByte(uc,0x58,newstate)
		return 0
	end
end

function unitPrevState(obj,newstate)
	local uc=getPtrPtr(obj,0x2EC)
	if (newstate==nil) then
		return getPtrByte(uc,0x59)
	else
		setPtrByte(uc,0x59,newstate)
	end
end

function unitSetAnimationFrame(obj,frame)
	local uc=getPtrPtr(obj,0x2EC)
	if (frame==nil) then
		return getPtrByte(uc,0xEC)
	else
		setPtrByte(uc,0xEC,frame)
		return 0
	end
end

slstate=0
slobj=nil
slframe=0
function lockState(obj,state,frame)
slobj=obj
slstate=state
	function SYS_LOCK_STATE_ENGINE()
	unitState(slobj,slstate)
	--unitSetAnimationFrame(obj,slframe)
	setTimeout(SYS_LOCK_STATE_ENGINE,1)
	end
	SYS_LOCK_STATE_ENGINE()
end
function unlockState()
SYS_LOCK_STATE_ENGINE=nil
print('Animation unlocked')
end


--[[
«адаЄт готовность оружи€ (тот самый круговой сектор, который высвечиваетс€ при атаке
любым оружием в ближнем бою (кроме кулаков), а также метательные оружи€ и лук\арбалет.
===========
100% - Required for jumping
 42% - One swing with Staff
  7% - One shot with bow
  0% - Bare hands only (feeble?)
]]--
function unitReadiness(obj,percent)
	local uc=getPtrPtr(obj,0x2EC)
	if (percent==nil) then
		return getPtrByte(uc,0x5b)
	else
		if(percent<=-1) then print('Readiness percent value cannot be negative number.') return end
		if(percent>255) then print('Readiness percent value cannot be higher than 255%') return end
		setPtrByte(uc,0x5b,percent)
	end
end

function limitReadiness(who, percent)
SYS_READINESS_TARGET = who
SYS_READINESS=function() if(unitReadiness(SYS_READINESS_TARGET)>=percent) then unitReadiness(SYS_READINESS_TARGET, percent) end; setTimeout(SYS_READINESS,1) end
SYS_READINESS()
end

--to fix
function unitSetMaxHealth(obj,amount)
  if amount<=-1 then print("The maximum health value must be highter than -1.") return end
  local uc=getPtrPtr(obj,0x2EC)
  setPtrShort(uc,580,amount)
end

print('Player manipulation script. Version 1.0 ENG')