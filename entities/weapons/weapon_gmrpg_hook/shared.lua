if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
	SWEP.HoldType			= "melee"
end


SWEP.ViewModel 				= "models/weapons/c_crowbar.mdl"
SWEP.WorldModel 			= "models/props_junk/meathook001a.mdl"

SWEP.VElements = {
	["hook"] = { type = "Model", model = "models/props_junk/meathook001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.675, 2, -3.636), angle = Angle(0, 71.299, 9), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["hook"] = { type = "Model", model = "models/props_junk/meathook001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.714, 1.557, -5.715), angle = Angle(0, 80.649, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.Base					= "weapon_gmrpg_melee_base"

SWEP.HoldType 				= "melee"
SWEP.ViewModelFOV 			= 55
SWEP.ViewModelFlip 			= false
SWEP.UseHands 				= true
SWEP.ShowViewModel 			= false
SWEP.ShowWorldModel 		= false
SWEP.ViewModelBoneMods 		= {}

SWEP.Primary.Delay			= 1
SWEP.Primary.Damage 		= 60

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"
 
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.Spawnable 				= true
SWEP.AdminSpawnable 		= true

SWEP.PrintName 				= "Hook"
SWEP.Category 				= "gmRPG"
SWEP.Author 				= "Almighty Laxz";
SWEP.Contact 				= "";
SWEP.Purpose 				= "slap people";
SWEP.Instructions 			= "Left click to slap";
SWEP.Slot 					= 0