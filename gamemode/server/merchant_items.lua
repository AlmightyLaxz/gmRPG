util.AddNetworkString("requestPurchase")
util.AddNetworkString("requestUse")
util.AddNetworkString("requestInspect")
util.AddNetworkString("requestSell")
util.AddNetworkString("requestDestruction")
util.AddNetworkString("rpgMerchantDermaStart")
util.AddNetworkString("rpgSellDermaStart")
util.AddNetworkString("rpgInspectDermaStart")

net.Receive("requestUse", function(len, ply)
    if !IsValid(ply) then return false end
    local item = net.ReadString()
    local requestedItem = gmRPG.items[item]()

    if ply:removeItem(item) then
        requestedItem.itemfunc(ply)
        ply.couldBePlacing = item
     else
        ply:ChatPrint("Item does not exist in inventory.")
    end
end)

net.Receive("requestPurchase", function(len, ply)
    if !IsValid(ply) then return false end
    local item = net.ReadString()
    local requestedItem = gmRPG.items[item]()

    if tonumber(ply:getMoney()) < requestedItem.price then
        ply:ChatPrint("You don't have enough money for that.")
    else
        if ply:addInventory(item) then
            ply:setMoney(-requestedItem.price)
            ply:EmitSound("ambient/office/coinslot1.wav")
        end
    end
end)

net.Receive("requestSell", function(len, ply)
    if !IsValid(ply) then return false end
    local item = net.ReadString()
    local requestedItem = gmRPG.items[item]()

    local itemExists = false

    for k,v in pairs(ply:getInventory()) do
        print(gmRPG.items[v]())
        if (v == gmRPG.items[v]()) != nil then
            itemExists = true
        end
    end

    if !itemExists then
        return false
    end

    ply:removeItem(item)
    ply:setMoney(requestedItem.price / 2)
    ply:EmitSound("ambient/office/coinslot1.wav")
end)

net.Receive("requestDestruction", function(len, ply)
    if !IsValid(ply) then return false end
    local item = net.ReadString()
    local requestedItem = gmRPG.items[item]()
    ply:removeItem(item)
    ply:ChatPrint("You dispose of the " .. gmRPG.items[item]().name)
end)
