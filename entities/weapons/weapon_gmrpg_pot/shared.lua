if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
	SWEP.HoldType			= "melee"
end


SWEP.ViewModel 				= "models/weapons/c_crowbar.mdl"
SWEP.WorldModel 			= "models/props_interiors/pot02a.mdl"

SWEP.VElements = {
	["frypan"] = { type = "Model", model = "models/props_interiors/pot02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.596, 0.4, -5.715), angle = Angle(0, -180, -80), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["frypan"] = { type = "Model", model = "models/props_interiors/pot02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.635, 0.518, -5.715), angle = Angle(0, -180, -80), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.Base					= "weapon_gmrpg_melee_base"

SWEP.HoldType 				= "melee"
SWEP.ViewModelFOV 			= 55
SWEP.ViewModelFlip 			= false
SWEP.UseHands 				= true
SWEP.ShowViewModel 			= false
SWEP.ShowWorldModel 		= false
SWEP.ViewModelBoneMods 		= {}

SWEP.Primary.Delay			= 0.4
SWEP.Primary.Damage 		= 20

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

SWEP.PrintName 				= "Pot"
SWEP.Category 				= "gmRPG"
SWEP.Author 				= "Almighty Laxz";
SWEP.Contact 				= "";
SWEP.Purpose 				= "slap people";
SWEP.Instructions 			= "Left click to slap";
SWEP.Slot 					= 0