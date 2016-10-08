gmRPG = gmRPG or {}

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("client/hud.lua")
AddCSLuaFile("client/derma/derma.lua")
AddCSLuaFile("client/derma/dialogue.lua")
AddCSLuaFile("client/derma/merchants.lua")
AddCSLuaFile("client/derma/inventory.lua")
AddCSLuaFile("client/pp.lua")
AddCSLuaFile("client/building.lua")
AddCSLuaFile("client/cleandecals.lua")
AddCSLuaFile("shared/items.lua")

include("shared.lua")
include("server/pdata.lua")
include("server/player.lua")
include("server/npc_handling.lua")
include("server/merchant_items.lua")
include("server/map_ents.lua")
include("server/blood.lua")
include("server/hurtsounds.lua")
include("shared/items.lua")

util.AddNetworkString("rpgDrunkify")
util.AddNetworkString("rpgUndrunkify")
util.AddNetworkString("rpgUpdateInventory")

function GM:PlayerInitialSpawn(ply)
	ply:sendStats()
	ply:updateInventory()
	ply:updateBankMoney()
	ply.entCount = 0
	ply.ents = {}
end

function GM:PlayerSpray(ply)
	return true
end