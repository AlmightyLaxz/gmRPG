util.AddNetworkString("rpgEmploymentDermaStart")
util.AddNetworkString("rpgGymDermaStart")
util.AddNetworkString("rpgSchoolDermaStart")
util.AddNetworkString("rpgBarDermaStart")
util.AddNetworkString("rpgCafeDermaStart")
util.AddNetworkString("rpgCivilianDermaStart")
util.AddNetworkString("rpgDrugDermaStart")
util.AddNetworkString("rpgDialogueDermaStart")
util.AddNetworkString("rpgSingleDialogueDermaStart")
util.AddNetworkString("rpgATMDermaStart")

util.AddNetworkString("requestEmployment")
util.AddNetworkString("requestWork")
util.AddNetworkString("requestPromotion")
util.AddNetworkString("requestGym")
util.AddNetworkString("requestSchool")
util.AddNetworkString("requestSlots")
util.AddNetworkString("requestDeposit")
util.AddNetworkString("requestWithdraw")
util.AddNetworkString("requestMission")
util.AddNetworkString("requestStore")
util.AddNetworkString("requestFromStorage")

util.AddNetworkString("rpgEmploymentResultDermaStart")

net.Receive("requestEmployment", function(len, ply)
    local npcEnt = net.ReadEntity()
    local title = npcEnt.titleText

    if !IsValid(ply) || !IsValid(npcEnt) || ply:GetPos():Distance(npcEnt:GetPos()) > 128 then return false end

    if tonumber(ply:getIntelligence()) < npcEnt.levels[1].intelligenceRequired then
        ply:ChatPrint( "You don't have the required intelligence!" )
        return false
    end
    
    ply:setEmployment(npcEnt.shortName, 1)

    net.Start("rpgSingleDialogueDermaStart")
        net.WriteString(title)
        net.WriteString(npcEnt.hiredText)
        net.WriteString("Thanks!")
        net.WriteEntity(npcEnt)
    net.Send(ply)
end)

net.Receive("requestWork", function(len, ply)
    local npcEnt = net.ReadEntity()

    local selectedOutcome = math.random(0, 2)

    if !IsValid(ply) || !IsValid(npcEnt) || ply:GetPos():Distance(npcEnt:GetPos()) > 128 then return false end

    local plyLevel = tonumber(ply:getEmployment(npcEnt.shortName))

    if tonumber(ply:getEnergy()) >= npcEnt.levels[1].energyRequired && !ply.isDrunk then
        ply:Lock()
        ply:ScreenFade(SCREENFADE.OUT, Color(0,0,0), 1, 1)
        timer.Simple(1, function()
        ply:UnLock()
        ply:setMoney(npcEnt.levels[plyLevel].wage * 3 + npcEnt.levels[plyLevel].outcomeBonus[selectedOutcome])
        ply:setEnergy(-npcEnt.levels[plyLevel].energyRequired)
        ply:setExperience(npcEnt.shortName, 1)

        net.Start("rpgEmploymentResultDermaStart")
            net.WriteString(npcEnt.levels[plyLevel].outcomes[selectedOutcome])
        net.Send(ply)
        ply:EmitSound("ambient/office/coinslot1.wav")
        return true
        end)
        else if tonumber(ply:getEnergy()) < npcEnt.levels[plyLevel].energyRequired then
            ply:ChatPrint( "You don't have enough energy for that!" )
            return false
        else
            ply:ChatPrint( "You can't work while drunk!" )
            return false
        end
    end
end)

net.Receive("requestPromotion", function(len, ply)
    local npcEnt = net.ReadEntity()
    local title = npcEnt.titleText

    if !IsValid(ply) || !IsValid(npcEnt) || ply:GetPos():Distance(npcEnt:GetPos()) > 128 then return false end

    local plyLevel = tonumber(ply:getEmployment(npcEnt.shortName))

    if npcEnt.levels[plyLevel + 1] != nil then 
        if tonumber(ply:getIntelligence()) >= npcEnt.levels[plyLevel + 1].intelligenceRequired then
            if tonumber(ply:getStrength()) >= npcEnt.levels[plyLevel + 1].strengthRequired then 
                if tonumber(ply:getExperience(npcEnt.shortName)) >= npcEnt.levels[plyLevel + 1].experienceRequired then

                    net.Start("rpgSingleDialogueDermaStart")
                        net.WriteString(title)
                        net.WriteString(npcEnt.promotionText .. "\n\nYou are now a: " .. npcEnt.levels[plyLevel + 1].name)
                        net.WriteString("Thanks!")
                        net.WriteEntity(npcEnt)
                    net.Send(ply)

                    ply:setEmployment(npcEnt.shortName, 1)

                    return true
                end
            end
        end
    end

    if npcEnt.levels[plyLevel + 1] == nil then
        net.Start("rpgSingleDialogueDermaStart")
            net.WriteString(title)
            net.WriteString("You're already the highest job!")
            net.WriteString("Okay")
            net.WriteEntity(npcEnt)
        net.Send(ply)
        return false
    end

    net.Start("rpgSingleDialogueDermaStart")
        net.WriteString(title)
        net.WriteString(npcEnt.promotionFailText)
        net.WriteString("Okay")
        net.WriteEntity(npcEnt)
    net.Send(ply)
end)

net.Receive("requestGym", function(len, ply)

    local npcEnt = net.ReadEntity()

    local selectedOutcome = math.random(0, 2)

    if !IsValid(ply) || !IsValid(npcEnt) || ply:GetPos():Distance(npcEnt:GetPos()) > 128 then return false end

    if tonumber(ply:getEnergy()) >= npcEnt.energyRequired && tonumber(ply:getMoney()) > npcEnt.cost then
        ply:setMoney(-npcEnt.cost)
        ply:setEnergy(-npcEnt.energyRequired)
        ply:setStrength(npcEnt.outcomeStrength[selectedOutcome])
        net.Start("rpgSingleDialogueDermaStart")
            net.WriteString(npcEnt.titleText)
            net.WriteString(npcEnt.outcomes[selectedOutcome])
            net.WriteString("Close")
            net.WriteEntity(npcEnt)
        net.Send(ply)
        else if tonumber(ply:getEnergy()) < npcEnt.energyRequired then
            ply:ChatPrint( "You don't have enough energy for that!" )
        else
            ply:ChatPrint( "You don't have enough money for that!" )
        end
    end
end)

net.Receive("requestSchool", function(len, ply)

    local npcEnt = net.ReadEntity()

    local selectedOutcome = math.random(0, 2)

    if !IsValid(ply) || !IsValid(npcEnt) || ply:GetPos():Distance(npcEnt:GetPos()) > 128 then return false end

    if tonumber(ply:getEnergy()) >= npcEnt.energyRequired && tonumber(ply:getMoney()) > npcEnt.cost then
        ply:setMoney(-npcEnt.cost)
        ply:setEnergy(-npcEnt.energyRequired)
        ply:setIntelligence(npcEnt.outcomeIntelligence[selectedOutcome])
         net.Start("rpgSingleDialogueDermaStart")
            net.WriteString(npcEnt.titleText)
            net.WriteString(npcEnt.outcomes[selectedOutcome])
            net.WriteString("Close")
            net.WriteEntity(npcEnt)
        net.Send(ply)
    else if tonumber(ply:getEnergy()) < npcEnt.energyRequired then
            ply:ChatPrint( "You don't have enough energy for that!" )
        else
            ply:ChatPrint( "You don't have enough money for that!" )
        end
    end
end)

net.Receive("requestSlots", function(len, ply)
    local npcEnt = net.ReadEntity()
    if !IsValid(ply) || !IsValid(npcEnt) then return false end
    if tonumber(ply:getMoney()) > npcEnt.cost then
        ply:setMoney(-npcEnt.cost)
        ply:EmitSound("ambient/office/coinslot1.wav")
        local selectedOutcome = math.random(0, 6)
        if selectedOutcome == 2 then
            net.Start("rpgSingleDialogueDermaStart")
                net.WriteString(npcEnt.titleText)
                net.WriteString(npcEnt.winText)
                net.WriteString("Close")
                net.WriteEntity(npcEnt)
            net.Send(ply)
            ply:setMoney(npcEnt.winAmount)
        elseif selectedOutcome == 3 then
            net.Start("rpgSingleDialogueDermaStart")
                net.WriteString(npcEnt.titleText)
                net.WriteString(npcEnt.jackpotText)
                net.WriteString("Close")
                net.WriteEntity(npcEnt)
            net.Send(ply)
            ply:setMoney(npcEnt.jackpot)
        else
            net.Start("rpgSingleDialogueDermaStart")
                net.WriteString(npcEnt.titleText)
                net.WriteString(npcEnt.loseText)
                net.WriteString("Close")
                net.WriteEntity(npcEnt)
            net.Send(ply)
        end
    end
end)

net.Receive("requestDeposit", function(len, ply)
    local amount = math.Clamp(net.ReadUInt(32), 0, 900000000)
    local npcEnt = net.ReadEntity()
    if !IsValid(ply) || !IsValid(npcEnt) then return false end
    if tonumber(ply:getMoney()) < amount then ply:ChatPrint("You can't deposit what you don't have!") return false end
    ply:setMoney(-amount)
    ply:setBankMoney(amount)
end)

net.Receive("requestWithdraw", function(len, ply)
    local amount = math.Clamp(net.ReadUInt(32), 0, 900000000)
    local npcEnt = net.ReadEntity()
    if !IsValid(ply) || !IsValid(npcEnt) then return false end
    if tonumber(ply:getBankMoney()) < amount then ply:ChatPrint("You can't withdraw what you don't have!") return false end
    ply:setMoney(amount)
    ply:setBankMoney(-amount)
end)

net.Receive("requestMisison", function(len, ply)
    local npcEnt = net.ReadEntity()
    if !IsValid(ply) || !IsValid(npcEnt) then return false end
end)

net.Receive("requestStore", function(len, ply)
    local item = net.ReadString()
    if ply:addStorage(item) then
        ply:ChatPrint("Put " .. item .. " in storage")
    end
end)

net.Receive("requestFromStorage", function(len, ply)
    local item = net.ReadString()
    if ply:removeStorage(item) then
        ply:ChatPrint("Took " .. item .. " out of storage")
    end
end)

timer.Create("rpgBankInterest", 60, 0, function()
    for k,v in pairs(player.GetAll()) do
        local new = v:getBankMoney() * 0.015
        v:setBankMoney(math.floor(new))
    end
end)