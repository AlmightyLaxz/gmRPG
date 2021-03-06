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
ENT.randText[0]     = "You can destroy items in your inventory by right clicking and pressing destroy."
ENT.randText[1]     = "Drunk too much caffeine? Go to sleep so it wears off."
ENT.randText[2]     = "You can enter PVP mode through the character menu."
ENT.randText[3]     = "Not enough energy? You can get more energy by training at the gym."
ENT.randText[4]     = "You can reset your zoom level with the left arrow key."
ENT.randText[5]     = "Water bottles can be refilled when standing in water sources."

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

ENT.titleText       = "Helpful Civilian"

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
                net.WriteString(self.randText[math.random(0, #self.randText)])
                net.WriteString("Close")
                net.WriteEntity(self)
            net.Send(Activator)
    		timer.Simple(0.01, function()
    			Activator.cantUse = false
    		end)
    	end
    end
end
