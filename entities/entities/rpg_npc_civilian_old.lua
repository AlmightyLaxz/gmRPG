AddCSLuaFile()

ENT.Base            = "rpg_npc_base"
ENT.Type            = "ai"

ENT.PrintName       = "NPC Civilian"
ENT.Author          = "Almighty Laxz"
ENT.Contact         = ""
ENT.Purpose         = ""
ENT.Instructions    = ""
ENT.Category        = "gmRPG"

ENT.Spawnable       = true

ENT.randText        = {}
ENT.randText[0]     = "Hello, what's up?"
ENT.randText[1]     = "Can I help you?"
ENT.randText[2]     = "Do I know you?"
ENT.randText[3]     = "Do you need something?"
ENT.randText[4]     = "What do you want?"

ENT.civModels       = {}
ENT.civModels[0]    = "models/humans/group01/female_01.mdl"
ENT.civModels[1]    = "models/humans/group01/female_02.mdl"
ENT.civModels[2]    = "models/humans/group01/female_03.mdl"
ENT.civModels[3]    = "models/humans/group01/female_04.mdl"
ENT.civModels[4]    = "models/humans/group01/female_06.mdl"
ENT.civModels[5]    = "models/humans/group01/female_07.mdl"
ENT.civModels[6]    = "models/humans/group01/male_01.mdl"
ENT.civModels[7]    = "models/humans/group01/male_02.mdl"
ENT.civModels[8]    = "models/humans/group01/male_03.mdl"
ENT.civModels[9]    = "models/humans/group01/male_04.mdl"
ENT.civModels[10]   = "models/humans/group01/male_05.mdl"
ENT.civModels[11]   = "models/humans/group01/male_06.mdl"
ENT.civModels[12]   = "models/humans/group01/male_07.mdl"
ENT.civModels[13]   = "models/humans/group01/male_08.mdl"
ENT.civModels[14]   = "models/humans/group01/male_09.mdl"

ENT.titleText       = "Civilian"

if SERVER then
    function ENT:Initialize()
    	self:SetModel(self.civModels[math.random(0, 14)])
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
            net.Start("rpgSingleDialogueDermaStart")
                net.WriteString(self.titleText)
                net.WriteString(self.randText[math.random(0, 4)])
                net.WriteString("Close")
                net.WriteEntity(self)
            net.Send(Activator)
    		timer.Simple(1, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
