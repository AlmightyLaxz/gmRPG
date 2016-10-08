util.AddNetworkString("rpgRequestRoofTable")
util.AddNetworkString("rpgRoofTable")
util.AddNetworkString("rpgRequestZoneTable")
util.AddNetworkString("rpgZoneTable")
util.AddNetworkString("rpgRequestPlaceObject")

// client cannot see mapping name for entities
hook.Add("InitPostEntity", "rpgAddRoof", function()
	roofTable = {}
	for _,v in pairs(ents.GetAll()) do
		if v:GetClass() == "func_brush" && v:GetName() == "roof" then
			v:SetRenderMode(RENDERMODE_TRANSALPHA)
			table.insert(roofTable, v)
		end
	end
end)

net.Receive("rpgRequestRoofTable", function(len, ply)
	net.Start("rpgRoofTable")
		net.WriteTable(roofTable)
	net.Send(ply)
end)

hook.Add("InitPostEntity", "rpgAddZone", function()
	zoneTable = {}
	for _,v in pairs(ents.GetAll()) do
		if v:GetClass() == "func_brush" && v:GetName() == "buildingzone" then
			v:SetTrigger(true)
			table.insert(zoneTable, v)
		end
	end
end)

net.Receive("rpgRequestZoneTable", function(len, ply)
	net.Start("rpgZoneTable")
		net.WriteTable(zoneTable)
	net.Send(ply)
end)

net.Receive("rpgRequestPlaceObject", function(len, ply)
	local i = net.ReadString()
	local item = gmRPG.items[i]()
	local pos = net.ReadVector()
	local rot = net.ReadAngle()

	if ply.couldBePlacing != i then
		return
	end

	if ply.entCount > 9 then
		ply:ChatPrint("You have too many objects!")
		ply:addInventory(i)
		return
	end

	for _,v in pairs(zoneTable) do
		local min, max = v:WorldSpaceAABB()
		entInBox = pos:WithinAABox(min, max)
		if entInBox then break end
	end
	if !entInBox then
		ply:ChatPrint("You cannot place that here!")
		ply:addInventory(i)
		return 
	end

	local ent = ents.Create(item.ent)
	if !IsValid(ent) then return end
	ent:SetPos(pos)
	ent:SetAngles(rot)
	ent:SetOwner(ply)
	ent:Spawn()
	table.insert(ply.ents, ent)
	ply.entCount = ply.entCount + 1
end)