print('Mana Regen')
-- local text = ' Mana Regen Activated '
-- local time = 10  -- time in seconds, or whatever unit is expected
-- createBubble(me, text, me, time)

-- Assuming these functions are defined elsewhere in your environment
-- getPtrPtr, getPtrShort, setPtrShort, setTimeout

local player = me

local startTime = os.time()

function regenMana()
  if os.difftime(os.time(), startTime) >= 30 then
    return
  end

  local currentMana = unitMana(player)
  if currentMana < 85 then
    unitMana(player, math.min(85, currentMana + 4))
  end
  setTimeout(regenMana, 30)
end

setTimeout(regenMana, 30)

function unitMana(obj, amount)
  local uc = getPtrPtr(obj, 0x2EC)
  if amount == nil then
    return getPtrShort(uc, 4)
  else
    if amount <= -1 then
      print("The unit's mana value must be higher than -1.")
      return
    end
    setPtrShort(uc, 4, amount)
    return 1
  end
end

function unitMaxMana(obj, amount)
  local uc = getPtrPtr(obj, 0x2EC)
  if amount == nil then
    return getPtrShort(uc, 8)
  else
    if amount <= -1 then
      print("The unit's mana value cannot be negative.")
      return
    end
    if amount > 9000 then
      print("The unit's mana value must be lower than 9000.")
      return
    end
    setPtrShort(uc, 8, amount)
    return 1
  end
end
