print('Mana Regen')
print('RUN ONLY ONCE')
-- Initialize global variable maxmana
setMe() -- MUST BE TO USE me


player = me
-- startTime = os.time()

function regenMana()
  -- if os.difftime(os.time(), startTime) >= 30 then
  --   return
  -- end

  local currentMana = unitMana(player)
  maxmana = unitMaxMana(me)
  if currentMana < maxmana then
    unitMana(player, math.min(maxmana, currentMana + 3))
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
