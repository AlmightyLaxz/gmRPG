CreateConVar( "sv_hurtsounds", "1", { FCVAR_REPLICATED, FCVAR_NOTIFY } )

local women = {
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_06.mdl",
	"models/player/group03/female_01.mdl",
	"models/player/group03/female_02.mdl",
	"models/player/group03/female_03.mdl",
	"models/player/group03/female_04.mdl",
	"models/player/group03/female_06.mdl",
	"models/player/group03m/female_01.mdl",
	"models/player/group03m/female_02.mdl",
	"models/player/group03m/female_03.mdl",
	"models/player/group03m/female_04.mdl",
	"models/player/group03m/female_05.mdl",
	"models/player/mossman.mdl",
	"models/player/p2_chell.mdl",
	"models/player/mossman_arctic.mdl",
	"<Your custom model",
	"<Your custom model 2",
	"<Your custom model 3"
}
local masked = {
	"models/player/combine_soldier.mdl",
	"models/player/combine_soldier_prisonguard.mdl",
	"models/player/combine_super_soldier.mdl",
	"models/player/gasmask.mdl",
	"models/player/riot.mdl",
	"models/player/swat.mdl",
	"models/player/urban.mdl"
}
local metrocops = {
	"models/player/police.mdl",
	"models/player/police_fem.mdl"
}
local zombies = {
	"models/player/zombie_fast.mdl",
	"models/player/zombie_classic.mdl",
	"models/player/skeleton.mdl",
	"models/player/charple.mdl",
	"models/player/corpse1.mdl"
}
local hostages = {
	"models/player/hostage/hostage_01.mdl",
	"models/player/hostage/hostage_02.mdl",
	"models/player/hostage/hostage_03.mdl",
	"models/player/hostage/hostage_04.mdl"
}

local function DeathSounds(ply)
	if GetConVarNumber( "sv_hurtsounds" ) == 1 then
	if table.HasValue(metrocops, string.lower(ply:GetModel())) then
	ply:EmitSound("npc/metropolice/die"..math.random( 1, 4 )..".wav")
	elseif table.HasValue(masked, string.lower(ply:GetModel())) then
	ply:EmitSound("npc/combine_soldier/die"..math.random( 1, 3 )..".wav")
	elseif table.HasValue(zombies, string.lower(ply:GetModel())) then
	ply:EmitSound("npc/zombie/zombie_die"..math.random( 1, 3 )..".wav")
	elseif ply:GetModel() == "models/player/zombie_soldier.mdl" then
	ply:EmitSound("npc/zombine/zombine_die"..math.random(1,2)..".wav")
	end
	end
end
hook.Add("DoPlayerDeath", "gmrpg_DeathSounds", DeathSounds)

local function HurtSounds(ply)
	if GetConVarNumber( "sv_hurtsounds" ) == 1 then
	if not ply.NoSpam then
	if table.HasValue(women, string.lower(ply:GetModel())) then
	if ply:LastHitGroup() == HITGROUP_LEFTLEG and math.random(1,4) == 1 or ply:LastHitGroup() == HITGROUP_RIGHTLEG and math.random(1,4) == 1 then
	ply:EmitSound("vo/npc/female01/myleg0" .. math.random( 1, 2 ) .. ".wav")
	elseif ply:LastHitGroup() == HITGROUP_LEFTARM and math.random(1,4) == 1 or ply:LastHitGroup() == HITGROUP_RIGHTARM and math.random(1,4) == 1 then
	ply:EmitSound("vo/npc/female01/myarm0" .. math.random( 1, 2 ) .. ".wav")
	else
	ply:EmitSound("vo/npc/female01/pain0" .. math.random( 1, 9 ) .. ".wav")
	end
	elseif table.HasValue(masked, string.lower(ply:GetModel())) then
	ply:EmitSound("npc/combine_soldier/pain"..math.random(1,3)..".wav")
	elseif ply:GetModel() == "models/player/alyx.mdl" then
	ply:EmitSound("vo/npc/alyx/hurt0"..math.random(4,8)..".wav")
	elseif ply:GetModel() == "models/player/barney.mdl" then
	ply:EmitSound("vo/npc/barney/ba_pain0"..math.random(1,9)..".wav")
	elseif ply:GetModel() == "models/player/monk.mdl" then
	ply:EmitSound("vo/ravenholm/monk_pain0"..math.random(1,9)..".wav")
	elseif table.HasValue(metrocops, string.lower(ply:GetModel())) then
	ply:EmitSound("npc/metropolice/pain"..math.random(1,4)..".wav")
	elseif table.HasValue(zombies, string.lower(ply:GetModel())) then
	ply:EmitSound("npc/zombie/zombie_pain"..math.random(1,6)..".wav")
	elseif ply:GetModel() == "models/player/zombie_soldier.mdl" then
	ply:EmitSound("npc/zombine/zombine_pain"..math.random(1,4)..".wav")
	elseif table.HasValue(hostages, string.lower(ply:GetModel())) then
	ply:EmitSound("hostage/hpain/hpain"..math.random(1,6)..".wav")
	else
	if ply:LastHitGroup() == HITGROUP_LEFTLEG and math.random(1,4) == 1 or ply:LastHitGroup() == HITGROUP_RIGHTLEG and math.random(1,4) == 1 then
	ply:EmitSound("vo/npc/male01/myleg0" .. math.random( 1, 2 ) .. ".wav")
	elseif ply:LastHitGroup() == HITGROUP_LEFTARM and math.random(1,4) == 1 or ply:LastHitGroup() == HITGROUP_RIGHTARM and math.random(1,4) == 1 then
	ply:EmitSound("vo/npc/male01/myarm0" .. math.random( 1, 2 ) .. ".wav")
	else
	ply:EmitSound("vo/npc/male01/pain0" .. math.random( 1, 9 ) .. ".wav")
	end
	end
	ply.NoSpam = true
	timer.Create("reset"..ply:EntIndex(),0.6,1,function() ply.NoSpam = false end)
	end
end
end
hook.Add( "PlayerHurt", "gmrpg_HurtSounds", HurtSounds )