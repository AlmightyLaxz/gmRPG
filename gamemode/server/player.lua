util.AddNetworkString("rpgShowProgress")
util.AddNetworkString("RequestPVP")

function GM:PlayerInitialSpawn(ply)
	ply:resetInventory()
end

function GM:PlayerSpawn(ply)
	ply:StripWeapons()
	ply:SetHealth(100)
	ply:SetJumpPower(250)
	//ply:Give("weapon_physgun")
	ply:SetModel(player_manager.TranslatePlayerModel(ply:GetInfo("cl_playermodel")))

	local col = ply:GetInfo("cl_playercolor")
	ply:SetPlayerColor(Vector(col))

	local wcol = ply:GetInfo("cl_weaponcolor")
	ply:SetWeaponColor(Vector(wcol))

	ply.coffeeDrank = 0
	ply.caffeine = 0

	ply.pvp = false

	ply.ents = {}

	ply:SetTeam(TEAM_STANDARD)

	ply:Give("weapon_gmrpg_unarmed")
	ply:Give("weapon_fists")
end

function GM:PlayerDeath(victim, inflictor, attacker)
    if tonumber(victim:getMoney()) > 20 then
        victim:setMoney(-20)
    end
	net.Start("rpgUndrunkify")
	net.Send(victim)
end

function GM:PlayerDisconnected(ply)
	for _,v in pairs(ply.ents) do
		v:Remove()
	end
end

function GM:EntityTakeDamage(target, dmg)
	if !target:IsPlayer() then
		return false
	elseif target.pvp && dmg:GetAttacker().pvp then
		return false
	elseif dmg:GetAttacker():IsPlayer() && target:IsPlayer() then
		if !dmg:GetAttacker().pvp then
			dmg:GetAttacker():ChatPrint("You are not in PVP mode")
		elseif !target.pvp then
			dmg:GetAttacker():ChatPrint("This person is not in PVP mode")
			return false
		end
	else
		return true
	end
end

net.Receive("RequestPVP", function(len, ply)
	ply.pvp = true
	ply:SetTeam(TEAM_PVP)
	ply:ChatPrint("PVP Enabled until death")
end)