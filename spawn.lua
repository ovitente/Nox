setMe()
x,y=playerMouse(me)

-- WARRIOR 
--- THIS IS WORKING FOR TWO ENCHS
-- objectname='OrnateHelm'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor13", "UserColor5", "Regeneration4", "Brilliance1")
-------
-- objectname='Breastplate'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor5", "UserColor5", "MagicReflection1", "")

-- objectname='PlateBoots'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor5", "UserColor5", "Speed4", "FireProtect4")

-- objectname='PlateArms'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor5", "UserColor5", "LightningProtect4", "Regeneration4")

-- objectname='GreatSword'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor5", "BlueFireRing4", "Lightning4", "UserColor13")

-- ==========================================================


-- objectname='DeathRayWand'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "ContinualReplenishment3", "Replenishment1")

-- objectname='InfinitePainWand'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor4", "ContinualReplenishment1", "Replenishment1")

-- objectname='FieldGuide'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor13", "105", "")

-- objectname='ForceWand'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor13", "ContinualReplenishment4", "Replenishment1")

-- objectname='RoundChakram'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor17", "Fire3", "Lightning3")

-- objectname='OblivionOrb'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor13", "ContinualReplenishment4", "Replenishment1")

-- objectname='LesserFireballWand'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor13", "ContinualReplenishment3", "Replenishment1")

-- objectname='FireStormWand'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor13", "ContinualReplenishment1", "Replenishment1")

-- objectname='WarHammer'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor17", "Lightning3", "FireRing3")

-- objectname='StaffWooden'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor17", "Lightning3", "FireRing3")

-- objectname='StaffWooden'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "", "UserColor13", "Lightning3", "Vampirism4")

-- objectname='MedievalShirt'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor13", "UserColor13", "", "Regeneration4")

-- objectname='MedievalPants'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor13", "UserColor13", "", "Regeneration4")

-- objectname='MedievalCloak'
-- obj = createObject(objectname,x,y)
-- itemEnchants(obj, "UserColor17", "", "Regeneration4", "UserColor17")


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