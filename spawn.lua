setMe()
x,y=playerMouse(me)

-- objectname='ForceWand'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor13", "ContinualReplenishment4", "Replenishment1")

-- objectname='FireStormWand'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor13", "ContinualReplenishment1", "Replenishment1")

-- objectname='StaffWooden'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor17", "Lightning3", "FireRing3")

-- objectname='StaffWooden'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor13", "Lightning3", "Vampirism4")

-- objectname='MedievalShirt'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor17", "", "Regeneration4", "UserColor17")

objectname='MedievalPants'
obj = createObject(objectname,x,y)
itemEnchants(obj, "UserColor17", "", "Regeneration4", "UserColor17")

-- Colors:
-- RED
-- 1 light red
-- 9 blood red
-- 10 light red
-- 17 dark red
-- 18 darker colorless red

-- GREEN
-- 2 swamp green
-- 3 light broun
-- 4 good green
-- 11 swamp green2
-- 27 true swamp green3
-- 12 bright green
-- 20 dark green

-- BLUE 
-- 13 nice blue
-- 13 dark blue
-- 5 teal blue

-- BROWN
-- 15 true brown wood
-- 19 brown bit brighter
-- 23 dark brown
-- 7 brown

-- GREY
-- 8 grey
-- 16 dark grey
-- 24 darker grey

-- OTHER
-- 6 pink
-- 14 bright pink
-- 22 violet
















-- Имена зачарований ПРЕДМЕТОВ (enchantments) Nox берет из файлика modifier.db 
-- Смотри секцию ENCHANTMENT.
-- Зачаровать меч на огонь 4-го уровня можно командой
-- itemEnchants(obj, "", "", "Fire4", "")
-- Пустые строчки обозначают что этот слот зачарования не используется.
-- Расстановка зачарований. Nox очень придирчив к порядку в котором зачарования накладываются на вещи
-- itemEnchants(?, {Тут WeaponPower# или ArmorQuality#}, {UserColor#}, {Enchantment}, {Enchantment})