hook.Add("PlayerDeath", "gmrpg_blood", function(ply)
	local x = ply:GetPos().x
	local y = ply:GetPos().y
	local z = ply:GetPos().z
	BroadcastLua("util.Decal(\"Blood\", Vector(" .. x .. "," .. y .. "," .. z .. "), Vector(" .. x .. "," .. y .. "," .. z .. ") - Vector(0, 0, 100))")
end)