local text = ' Spawned Item '
local time = 10  -- time in seconds, or whatever unit is expected
createBubble(me, text, me, time)

setMe()
x,y=playerMouse(me)
obj = createObject('ForceWand',x,y)
itemEnchants(obj, "", "", "ContinualReplenishment4", "")


--Рекция на нажатия игрока, например клик мыши (правый, это будет c==2). В pl игрок, а в targ что у него мышкой выделенно.

-- Имена зачарований ПРЕДМЕТОВ (enchantments) Nox берет из файлика modifier.db (который я прикрепил к сообщению)
-- Смотри секцию ENCHANTMENT.
-- Зачаровать меч на огонь 4-го уровня можно командой
-- itemEnchants(obj, "", "", "Fire4", "")
-- Пустые строчки обозначают что этот слот зачарования не используется.
-- Расстановка зачарований. Nox очень придирчив к порядку в котором зачарования накладываются на вещи
-- itemEnchants(?, {Тут WeaponPower# или ArmorQuality#}, {UserColor#}, {Enchantment}, {Enchantment})