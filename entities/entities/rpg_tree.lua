AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "base_anim"

ENT.PrintName = "Tree"
ENT.Author = "Iced Coffee"

ENT.Spawnable = true
ENT.Category = "gmRPG"

if SERVER then

	function ENT:Initialize()
		self:SetModel("models/props_foliage/tree_deciduous_01a-lod.mdl")
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:DrawShadow(true)
		self:SetHealth(1)
		self.Physgunnable = false
	
		local physicsObject = self:GetPhysicsObject()
		if (IsValid(physicsObject)) then
			physicsObject:Wake()
			physicsObject:EnableMotion(false)
		end
	end
	
	function ENT:OnTakeDamage(dmg)
		local ply = dmg:GetAttacker()
		if ply:GetActiveWeapon():GetClass() == "weapon_gmrpg_axe" then
			ply:addInventory("wood")
		else
			ply:ChatPrint("You need an Axe")
		end
	end
end