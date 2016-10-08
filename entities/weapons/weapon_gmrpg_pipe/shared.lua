if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
	SWEP.HoldType			= "melee"
end


SWEP.ViewModel 				= "models/weapons/c_crowbar.mdl"
SWEP.WorldModel 			= "models/props_canal/mattpipe.mdl"

SWEP.VElements = {
	["pipe"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.596, 1.557, -4.676), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 0.699), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}



SWEP.WElements = {
	["pipe"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.635, 1.557, -6.753), angle = Angle(0, 0, 0), size = Vector(0.699, 0.699, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.Base					= "weapon_gmrpg_melee_base"

SWEP.HoldType 				= "melee"
SWEP.ViewModelFOV 			= 55
SWEP.ViewModelFlip 			= false
SWEP.UseHands 				= true
SWEP.ShowViewModel 			= false
SWEP.ShowWorldModel 		= false
SWEP.ViewModelBoneMods 		= {}

SWEP.Primary.Delay			= 0.6
SWEP.Primary.Damage 		= 25

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

SWEP.PrintName 				= "Pipe"
SWEP.Category 				= "gmRPG"
SWEP.Author 				= "Almighty Laxz";
SWEP.Contact 				= "";
SWEP.Purpose 				= "slap people";
SWEP.Instructions 			= "Left click to slap";
SWEP.Slot 					= 0