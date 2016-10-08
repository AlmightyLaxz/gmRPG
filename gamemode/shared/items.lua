gmRPG.items = gmRPG.items or {}

function gmRPG.items:beer()
    local function useBeer(ply)
    	ply:ChatPrint("You drink Beer")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply.isDrunk = true

    	net.Start("rpgDrunkify")
    	net.Send(ply)

    	if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    	timer.Simple(60, function()
    		net.Start("rpgUndrunkify")
    		net.Send(ply)
    		ply.isDrunk = false
    	end)
    end
	local itemdata = {
		name = "Beer",
		price = 10,
		merchant = "bar",
		model = "models/props_junk/garbage_glassbottle003a.mdl",
        itemfunc = useBeer
	}
	return itemdata
end

function gmRPG.items:strongbeer()
    function useStrongBeer(ply)
    	ply:ChatPrint("You drink Strong Beer")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	net.Start("rpgDrunkify")
    	net.Send(ply)
    	ply.isDrunk = true
    	if ply:Health() < 100 then ply:SetHealth(ply:Health() + 10) end
    	timer.Simple(60, function()
    		net.Start("rpgUndrunkify")
    		net.Send(ply)
    		ply.isDrunk = false
    	end)
    end
    local itemdata = {
        name = "Strong Beer",
        price = 15,
        merchant = "bar",
        model = "models/props_junk/garbage_glassbottle001a.mdl",
        itemfunc = useStrongBeer
    }
    return itemdata
end

function gmRPG.items:caffeine()
    local function useCaffeinePills(ply)
    	ply:ChatPrint("You swallow Caffeine Pills")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply:setEnergy(6)
    	ply.caffeine = ply.caffeine + 1
    	if ply.caffeine >= 4 then
    		ply:TakeDamage(20, game.GetWorld(), game.GetWorld())
    		ply:ChatPrint("You are intaking too much caffeine, sleep it off!")
    	end
    end
    local itemdata = {
        name = "Caffeine Pills",
        price = 10,
        merchant = "drug",
        model = "models/props_lab/jar01b.mdl",
        itemfunc = useCaffeinePills
    }
    return itemdata
end

function gmRPG.items:coffee()
    local function useCoffee(ply)
    	ply:ChatPrint("You drink Coffee")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply:setEnergy(3)
    	ply.coffeeDrank = ply.coffeeDrank + 1
    	if ply.coffeeDrank >= 4 then
    		ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
    		ply:ChatPrint("You are drinking too much coffee, sleep it off!")
    	end
    end
    local itemdata = {
        name = "Coffee",
        price = 5,
        merchant =  "cafe",
        model = "models/props_junk/garbage_coffeemug001a.mdl",
        itemfunc = useCoffee
    }
    return itemdata
end

function gmRPG.items:energydrink()
    local function useEnergyDrink(ply)
    	ply:ChatPrint("You drink an Energy Drink")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply:setEnergy(1)
        ply:SetRunSpeed(350)
        timer.Simple(60, function()
            ply:SetRunSpeed(300)
        end)
    end
    local itemdata = {
        name = "Energy Drink",
        price = 5,
        merchant = "vending",
        model = "models/props_junk/PopCan01a.mdl",
        itemfunc = useEnergyDrink
    }
    return itemdata
end

function gmRPG.items:noodles()
    local function useNoodles(ply)
    	ply:ChatPrint("You eat Noodles")
    	ply:EmitSound("eating_and_drinking/eating.wav")
    	if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Noodles",
        price = 5,
        merchant = "cafe",
        model = "models/props_junk/garbage_takeoutcarton001a.mdl",
        itemfunc = useNoodles
    }
    return itemdata
end

function gmRPG.items:strongcoffee()
    local function useStrongCoffee(ply)
        ply:ChatPrint("You drink Strong Coffee")
    	ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
    	ply:setEnergy(5)
    	ply.coffeeDrank = ply.coffeeDrank + 1
    	if ply.coffeeDrank >= 4 then
    		ply:TakeDamage(10, game.GetWorld(), game.GetWorld())
    		ply:ChatPrint("You are drinking too much coffee, sleep it off!")
    	end
    end
    local itemdata = {
        name = "Strong Coffee",
        price = 5,
        merchant = "cafe",
        model = "models/props_junk/garbage_coffeemug001a.mdl",
        itemfunc = useStrongCoffee
    }
    return itemdata
end

function gmRPG.items:fries()
    local function useFries(ply)
        ply:ChatPrint("You eat Fries")
        ply:EmitSound("eating_and_drinking/eating.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Fries",
        price = 2,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/mcdfrenchfries.mdl",
        itemfunc = useFries
    }
    return itemdata
end

function gmRPG.items:chickenwing()
    local function useChickenWing(ply)
        ply:ChatPrint("You eat Chicken Wing")
        ply:EmitSound("eating_and_drinking/eating.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Chicken Wing",
        price = 2,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/mcdfriedchickenleg.mdl",
        itemfunc = useChickenWing
    }
    return itemdata
end

function gmRPG.items:cheeseburger()
    local function useCheeseburger(ply)
        ply:ChatPrint("You eat Cheeseburger")
        ply:EmitSound("eating_and_drinking/eating_long.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Cheeseburger",
        price = 2,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/burgersims2.mdl",
        itemfunc = useCheeseburger
    }
    return itemdata
end

function gmRPG.items:doublecheeseburger()
    local function useDoubleCheeseburger(ply)
        ply:ChatPrint("You eat Double Cheeseburger")
        ply:EmitSound("eating_and_drinking/eating_long.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 10) end
    end
    local itemdata = {
        name = "Double Cheeseburger",
        price = 4,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/mcdburger.mdl",
        itemfunc = useDoubleCheeseburger
    }
    return itemdata
end

function gmRPG.items:shake()
    local function useShake(ply)
        ply:ChatPrint("You drink Shake")
        ply:EmitSound("eating_and_drinking/straw.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Shake",
        price = 2,
        merchant = "fastfood",
        model = "models/foodnhouseholditems/mcddrink.mdl",
        itemfunc = useShake
    }
    return itemdata
end

function gmRPG.items:cola()
    local function useCola(ply)
        ply:ChatPrint("You drink Cola")
        ply:EmitSound("eating_and_drinking/soda.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
    end
    local itemdata = {
        name = "Cola",
        price = 1,
        merchant = "vending",
        model = "models/foodnhouseholditems/cola.mdl",
        itemfunc = useCola
    }
    return itemdata
end

function gmRPG.items:largecola()
    local function useLargeCola(ply)
        ply:ChatPrint("You drink Large Cola")
        ply:EmitSound("eating_and_drinking/soda.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 10) end
    end
    local itemdata = {
        name = "Large Cola",
        price = 2,
        merchant = "vending",
        model = "models/foodnhouseholditems/colabig.mdl",
        itemfunc = useLargeCola
    }
    return itemdata
end

function gmRPG.items:water()
    local function useWater(ply)
        ply:ChatPrint("You drink Water")
        ply:EmitSound("npc/barnacle/barnacle_gulp1.wav")
        if ply:Health() < 100 then ply:SetHealth(ply:Health() + 5) end
        ply:addInventory("waterempty")
    end
    local itemdata = {
        name = "Water",
        price = 2,
        merchant = "vending",
        model = "models/props/cs_office/Water_bottle.mdl",
        itemfunc = useWater
    }
    return itemdata
end

function gmRPG.items:waterempty()
    local function useWaterEmpty(ply)
        if ply:WaterLevel() == 0 then
            ply:ChatPrint("You can't fill the bottle here!")
            ply:addInventory("waterempty")
        else
            net.Start("rpgShowProgress")
                net.WriteUInt(3, 16)
            net.Send(ply)
            timer.Simple(3, function()
                if ply:WaterLevel() > 0 then
                    ply:ChatPrint("You fill the bottle")
                    ply:addInventory("water")
                else
                    ply:ChatPrint("You can't fill the bottle here!")
                    ply:addInventory("waterempty")
                end
            end)
        end
    end
    local itemdata = {
        name = "Water (Empty)",
        price = 2,
        merchant = "",
        model = "models/props/cs_office/Water_bottle.mdl",
        itemfunc = useWaterEmpty
    }
    return itemdata
end

function gmRPG.items:axe()
    local function useAxe(ply)
        ply:Give("weapon_gmrpg_axe")
    end
    local itemdata = {
        name = "Axe",
        price = 90,
        merchant = "hardware",
        sellableto = "hardware_b",
        model = "models/props/CS_militia/axe.mdl",
        itemfunc = useAxe
    }
    return itemdata
end

function gmRPG.items:pot()
    local function usePot(ply)
        ply:Give("weapon_gmrpg_pot")
    end
    local itemdata = {
        name = "Pot",
        price = 20,
        merchant = "supermarket",
        sellableto = "hardware_b",
        model = "models/props_interiors/pot02a.mdl",
        itemfunc = usePot
    }
    return itemdata
end

function gmRPG.items:frypan()
    local function useFrypan(ply)
        ply:Give("weapon_gmrpg_frypan")
    end
    local itemdata = {
        name = "Frypan",
        price = 20,
        merchant = "supermarket",
        sellableto = "hardware_b",
        model = "models/props_c17/metalPot002a.mdl",
        itemfunc = useFrypan
    }
    return itemdata
end

function gmRPG.items:pipe()
    local function usePipe(ply)
        ply:Give("weapon_gmrpg_pipe")
    end
    local itemdata = {
        name = "Pipe",
        price = 10,
        merchant = "hardware",
        sellableto = "hardware_b",
        model = "models/props_canal/mattpipe.mdl",
        itemfunc = usePipe
    }
    return itemdata
end

function gmRPG.items:wood()
    local function useWood(ply)
        ply:addInventory("wood")
    end
    local itemdata = {
        name = "Wood",
        price = 10,
        merchant = "",
        sellableto = "hardware_b",
        model = "models/props/de_prodigy/wood_pallet_debris_07.mdl",
        itemfunc = useWood
    }
    return itemdata
end

function gmRPG.items:rock()
    local function useRock(ply)
        ply:addInventory("rock")
    end
    local itemdata = {
        name = "Rock",
        price = 10,
        merchant = "",
        sellableto = "hardware_b",
        model = "models/props_junk/rock001a.mdl",
        itemfunc = useRock
    }
    return itemdata
end

function gmRPG.items:revolver()
    local function useRevolver(ply)
        ply:Give("weapon_357")
    end
    local itemdata = {
        name = "Revolver",
        price = 400,
        merchant = "armsdealer",
        model = "models/weapons/w_357.mdl",
        itemfunc = useRevolver
    }
    return itemdata
end

function gmRPG.items:revolverammo()
    local function useRevolverammo(ply)
        ply:GiveAmmo(6, "357", false)
    end
    local itemdata = {
        name = "Revolver Ammo",
        price = 50,
        merchant = "armsdealer",
        model = "models/Items/357ammo.mdl",
        itemfunc = useRevolverammo
    }
    return itemdata
end

function gmRPG.items:smg()
    local function useSmg(ply)
        ply:Give("weapon_smg1")
    end
    local itemdata = {
        name = "SMG",
        price = 600,
        merchant = "armsdealer",
        model = "models/weapons/w_smg1.mdl",
        itemfunc = useSmg
    }
    return itemdata
end

function gmRPG.items:smgammo()
    local function useSmgammo(ply)
        ply:GiveAmmo(30, "SMG1", false)
    end
    local itemdata = {
        name = "SMG Ammo",
        price = 60,
        merchant = "armsdealer",
        model = "models/Items/BoxMRounds.mdl",
        itemfunc = useSmgammo
    }
    return itemdata
end

function gmRPG.items:armour()
    local function useArmour(ply)
        ply:SetArmor(100)
        ply:EmitSound("items/gunpickup2.wav", 100, 100)
    end
    local itemdata = {
        name = "Armour",
        price = 300,
        merchant = "armsdealer",
        model = "models/props_c17/SuitCase001a.mdl",
        itemfunc = useArmour
    }
    return itemdata
end

function gmRPG.items:camera()
    local function useCamera(ply)
        ply:Give("weapon_gmrpg_camera")
    end
    local itemdata = {
        name = "Camera",
        price = 150,
        merchant = "",
        model = "models/MaxOfS2D/camera.mdl",
        itemfunc = useCamera
    }
    return itemdata
end

function gmRPG.items:vendingmachine()
    local function useVendingMachine(ply)
        ply:SendLua('placeObject("models/props_interiors/VendingMachineSoda01a.mdl", Vector(0, 0, 0), "vendingmachine")')
    end
    local itemdata = {
        name = "Vending Machine",
        price = 500,
        merchant = "",
        model = "models/props_interiors/VendingMachineSoda01a.mdl",
        itemfunc = useVendingMachine,
        ent = "rpg_vendingmachine"
    }
    return itemdata
end

function gmRPG.items:bed()
    local function useBed(ply)
        ply:SendLua('placeObject("models/props/de_inferno/bed.mdl", Vector(0, 0, -60), "bed")')
    end
    local itemdata = {
        name = "Bed",
        price = 500,
        merchant = "",
        model = "models/props/de_inferno/bed.mdl",
        itemfunc = useBed,
        ent = "rpg_bed"
    }
    return itemdata
end

// not in use
function gmRPG.items:id()
    local function useID(ply)
    end
    local itemdata = {
        name = "ID",
        price = 150,
        merchant = "police",
        model = "models/props_c17/paper01.mdl",
    }
    return itemdata
end