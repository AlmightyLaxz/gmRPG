function placeObject(model, offset, item)
	local ply = LocalPlayer()
	ghost = ents.CreateClientProp()
	ghost:SetModel(model)
	ghost:SetPos(ply:EyePos() + ply:EyeAngles():Forward() * 200)
	ghost:SetAngles(Angle(0, 0, 0))
	ghost:Spawn()
	
	ghost:SetSolid(SOLID_VPHYSICS)
	ghost:SetMoveType(MOVETYPE_NONE)
	ghost:SetNotSolid(true)
	ghost:SetRenderMode(RENDERMODE_TRANSALPHA)
	ghost:SetColor(Color(255, 255, 255, 150))
	hook.Add("Think", "gmrpg_ghost", function()
		local ppos = ply:GetPos():ToScreen() // ToScreen is a broken piece of shit
		local dist = math.Distance(940, 547, gui.MouseX(), gui.MouseY())
		local newpos = ply:EyePos() + ply:EyeAngles():Forward() * dist / 2

		ghost:SetPos(Vector(newpos.x, newpos.y, 94) + offset)
		ghost:SetAngles(ply:EyeAngles() + Angle(0, 180, 0))

		for _,v in pairs(zoneTable) do
			local min, max = v:WorldSpaceAABB()
			ghostInBox = ghost:GetPos():WithinAABox(min, max)
		end

		if !ghostInBox then
			ghost:SetColor(Color(255, 0, 0, 150))
		else
			ghost:SetColor(Color(255, 255, 255, 150))
		end

		if input.IsMouseDown(MOUSE_LEFT) then
			hook.Remove("Think", "gmrpg_ghost")
			net.Start("rpgRequestPlaceObject")
				net.WriteString(item)
				net.WriteVector(ghost:GetPos())
				net.WriteAngle(ghost:GetAngles())
			net.SendToServer()
			ghost:Remove()
		end
	end)
end

hook.Add("InitPostEntity", "rpgAddBuildingZones", function()
	zoneTable = {}
	for k,v in pairs(ents.GetAll()) do
		if v:GetClass() == "trigger_proximity" then
			table.insert(zoneTable, v)
		end
	end
end)

hook.Add("Think", "rpgZoneTest", function()
	for _,v in pairs(zoneTable) do
		local ply = LocalPlayer()
		local min, max = v:WorldSpaceAABB()
		local plyInBox = ply:GetPos():WithinAABox(min, max)
	end
end)