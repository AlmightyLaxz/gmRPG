local meta = FindMetaTable("Player")

/*/////////////////////////////////////////
            Money PData Functions
/////////////////////////////////////////*/

function meta:setMoney(money)
    self:SetPData("gmrpg_money", self:GetPData("gmrpg_money", 0) + money)
    self:sendStats()
end

function meta:getMoney()
    return self:GetPData("gmrpg_money", 0)
end

/*/////////////////////////////////////////
            Energy PData Functions
/////////////////////////////////////////*/

function meta:setEnergy(energy)
    self:SetPData("gmrpg_energy", self:GetPData("gmrpg_energy", 0) + energy)
    if tonumber(self:GetPData("gmrpg_energy", 0)) > 10 then
        self:SetPData("gmrpg_energy", 10)
    end
    self:sendStats()
end

function meta:getEnergy()
    return self:GetPData("gmrpg_energy", 0)
end


/*/////////////////////////////////////////
            Stats PData Functions
/////////////////////////////////////////*/

util.AddNetworkString("rpgSendStats")

function meta:setStrength(strength)
    self:SetPData("gmrpg_strength", self:GetPData("gmrpg_strength", 5) + strength)
    self:sendStats()
end

function meta:getStrength()
    return self:GetPData("gmrpg_strength", 5)
end

function meta:setIntelligence(intelligence)
    self:SetPData("gmrpg_intelligence", self:GetPData("gmrpg_intelligence", 5) + intelligence)
    self:sendStats()
end

function meta:getIntelligence()
    return self:GetPData("gmrpg_intelligence", 5)
end

function meta:resetStats()
    self:SetPData("gmrpg_strength", 5)
    self:SetPData("gmrpg_intelligence", 5)
end

function meta:sendStats()
    net.Start("rpgSendStats")
        net.WriteString(self:getMoney())
        net.WriteString(self:getEnergy())
        net.WriteString(self:getStrength())
        net.WriteString(self:getIntelligence())
    net.Send(self)
end

/*/////////////////////////////////////////
        Inventory PData Functions
/////////////////////////////////////////*/

util.AddNetworkString("rpgRequestInventory")
util.AddNetworkString("rpgSendInventory")

function meta:getInventory()
    return util.JSONToTable(self:GetPData("gmrpg_inventory"))
end

function meta:addInventory(item)
    local newInv = self:getInventory()
    if newInv == nil then
        newInv = {}
    end
    if #newInv >= 6 then
        self:ChatPrint("Your inventory is full.")
        return false
    else
        table.insert(newInv, item)
        self:SetPData("gmrpg_inventory", util.TableToJSON(newInv))
        self:updateInventory()
        return true
    end
end

function meta:resetInventory()
    self:SetPData("gmrpg_inventory", util.TableToJSON({}))
    self:updateInventory()
end

function meta:removeItem(item)
    local inv = self:getInventory()

    local remove = table.RemoveByValue(inv, item)
    if remove != false then
        self:SetPData("gmrpg_inventory", util.TableToJSON(inv))
        self:updateInventory()
        return true
    end
    return false
end

function meta:updateInventory()
    net.Start("rpgSendInventory")
        net.WriteString(util.TableToJSON(self:getInventory()))
    net.Send(self)
end

net.Receive("rpgRequestInventory", function(len, ply)
    net.Start("rpgSendInventory")
        net.WriteString(util.TableToJSON(ply:getInventory()))
    net.Send(ply)
end)

/*/////////////////////////////////////////
            Employment PData
/////////////////////////////////////////*/

function meta:getEmployment(employer)
    return self:GetPData("gmrpg_employment_" .. employer, 0)
end

function meta:setEmployment(employer, new)
    self:SetPData("gmrpg_employment_" .. employer, self:GetPData("gmrpg_employment_" .. employer, 0) + new)
end

function meta:getExperience(employer)
    return self:GetPData("gmrpg_employment_exp_" .. employer, 0)
end

function meta:setExperience(employer, new)
    self:SetPData("gmrpg_employment_exp_" .. employer, self:GetPData("gmrpg_employment_exp_" .. employer, 0) + new)
end

/*/////////////////////////////////////////
                ATM PData
/////////////////////////////////////////*/
util.AddNetworkString("rpgSendBankMoney")
util.AddNetworkString("rpgRequestBankMoney")

function meta:getBankMoney()
    return self:GetPData("gmrpg_bankmoney", 0)
end

function meta:setBankMoney(new)
    self:SetPData("gmrpg_bankmoney", self:GetPData("gmrpg_bankmoney", 0) + new)
end

function meta:updateBankMoney()
    net.Start("rpgSendBankMoney")
        net.WriteString(tostring(self:getBankMoney()))
    net.Send(self)
end

net.Receive("rpgRequestBankMoney", function(len, ply)
    net.Start("rpgSendBankMoney")
        net.WriteString(tostring(ply:getBankMoney()))
    net.Send(ply)
end)

/*/////////////////////////////////////////
                Storage
/////////////////////////////////////////*/
util.AddNetworkString("rpgRequestStorage")
util.AddNetworkString("rpgSendStorage")

function meta:getStorage()
    return util.JSONToTable(self:GetPData("gmrpg_storage"))
end

function meta:addStorage(item)
    local newInv = self:getStorage()
    if newInv == nil then
        newInv = {}
    end
    if #newInv >= 6 then
        self:ChatPrint("Your storage is full.")
        return false
    else
        table.insert(newInv, item)
        self:SetPData("gmrpg_storage", util.TableToJSON(newInv))
        self:updateStorage()
        return true
    end
end

function meta:resetStorage()
    self:SetPData("gmrpg_storage", util.TableToJSON({}))
    self:updateStorage()
end

function meta:removeStorage(item)
    local inv = self:getStorage()

    local remove = table.RemoveByValue(inv, item)
    if remove != false then
        self:SetPData("gmrpg_storage", util.TableToJSON(inv))
        self:updateStorage()
        return true
    end
    return false
end

function meta:updateStorage()
    net.Start("rpgSendStorage")
        net.WriteString(util.TableToJSON(self:getStorage()))
    net.Send(self)
end

net.Receive("rpgRequestStorage", function(len, ply)
    net.Start("rpgSendStorage")
        net.WriteString(util.TableToJSON(ply:getStorage()))
    net.Send(ply)
end)