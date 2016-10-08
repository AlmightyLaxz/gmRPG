AddCSLuaFile()

ENT.Base            = "rpg_npc_merchant_base"
ENT.Type            = "ai"

ENT.PrintName       = "NPC Hardware Store Worker"
ENT.Author          = "Almighty Laxz"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "gmRPG"

ENT.Spawnable       = true

local titleText    = "Hardware Store Worker"
local merchantText = "Got anything to sell?"
// for items
local merchantid   = "hardware_b"

if SERVER then
    function ENT:Initialize()
    	self:SetModel("models/monk.mdl")
    	self:SetHullType( HULL_HUMAN )
    	self:SetHullSizeNormal( )
    	self:SetNPCState( NPC_STATE_SCRIPT )
    	self:SetSolid(  SOLID_BBOX )
    	self:CapabilitiesAdd( CAP_ANIMATEDFACE, CAP_TURN_HEAD )
    	self:SetUseType( SIMPLE_USE )
    	self:DropToFloor()
    end

    function ENT:AcceptInput( Name, Activator, Caller )

    	if !Activator.cantUse and Activator:IsPlayer() then
    		Activator.cantUse = true
            net.Start("rpgSellDermaStart")
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
