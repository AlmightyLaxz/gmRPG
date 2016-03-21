AddCSLuaFile()

ENT.Base            = "rpg_npc_merchant_base"
ENT.Type            = "ai"

ENT.PrintName       = "Vending Machine"
ENT.Author          = "Almighty Laxz"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "gmRPG"

ENT.Spawnable       = true

local titleText    = "Vending Machine"
local merchantText = "INSERT COINS"
// for items
local merchantid   = "vending"

if SERVER then
    function ENT:Initialize( )
    	self:SetModel("models/props_interiors/VendingMachineSoda01a.mdl")
    	self:SetSolid(SOLID_VPHYSICS)
    	self:SetUseType(SIMPLE_USE)
    	self:DropToFloor()
    end

    function ENT:AcceptInput( Name, Activator, Caller )

    	if !Activator.cantUse and Activator:IsPlayer() then
    		Activator.cantUse = true
            net.Start("rpgMerchantDermaStart")
                net.WriteString(titleText)
                net.WriteString(merchantText)
                net.WriteString(merchantid)
                net.WriteEntity(self)
            net.Send(Activator)
    		timer.Simple(1, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
