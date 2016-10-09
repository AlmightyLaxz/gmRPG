net.Receive("rpgMerchantDermaStart", function()
	local title = net.ReadString()
	local text = net.ReadString()
	local merchantid = net.ReadString()
	local npcEnt  = net.ReadEntity()

	if !IsValid(npcEnt) then return false end

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 500, 300 )
	frame:SetTitle(title)
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:ShowCloseButton( false )
	frame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
	end
	frame:MakePopup()
	frame:Center()

	local DLabel = vgui.Create( "DLabel", frame )
	DLabel:SetPos( 10, 10 )
	DLabel:SetText(text)
	DLabel:SetSize(200, 80)

	local invlist	= vgui.Create( "DIconLayout", frame )
	invlist:SetSize( 340, 200 )
	invlist:SetPos( 50, 70 )
	invlist:SetSpaceY( 5 )
	invlist:SetSpaceX( 5 )

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 200, 250 )
	closeButton:SetText("Close")
	closeButton:SetSize( 120, 40 )
	closeButton.DoClick = function()
		frame:Close()
	end

	for k,v in pairs(gmRPG.items) do
		if v().merchant != merchantid then continue end
		local model   =		v().model
		local tooltip =		"$" .. v().price
		local text	=		v().name

		local item = invlist:Add( "DModelPanel" )
		item:SetSize( 80, 80 )
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestPurchase")
				net.WriteString(k)
				net.WriteEntity(npcEnt)
			net.SendToServer()
		end

		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:Center()
		item.label:SetContentAlignment(5)
	end
end)

net.Receive("rpgSellDermaStart", function()
	local title = net.ReadString()
	local text = net.ReadString()
	local merchantid = net.ReadString()
	local npcEnt  = net.ReadEntity()

	if !IsValid(npcEnt) then return false end

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 500, 300 )
	frame:SetTitle(title)
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:ShowCloseButton( false )
	frame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
	end
	frame:MakePopup()
	frame:Center()

	local DLabel = vgui.Create( "DLabel", frame )
	DLabel:SetPos( 10, 10 )
	DLabel:SetText(text)
	DLabel:SetSize(200, 80)

	local invlist	= vgui.Create( "DIconLayout", frame )
	invlist:SetSize( 340, 200 )
	invlist:SetPos( 50, 70 )
	invlist:SetSpaceY( 5 )
	invlist:SetSpaceX( 5 )

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 200, 250 )
	closeButton:SetText("Close")
	closeButton:SetSize( 120, 40 )
	closeButton.DoClick = function()
		frame:Close()
	end

	local function refreshList()
		oldinv = rpgInventory
		for k,v in pairs(rpgInventory) do
			local model   =		gmRPG.items[v]().model
			local tooltip =		"$" .. gmRPG.items[v]().price / 2
			local text	=		gmRPG.items[v]().name
	
			local item = invlist:Add("DModelPanel")
			item:SetSize( 80, 80 )
			item:SetModel(model)
			item:SetTooltip(tooltip)
			item:SetLookAt(item.Entity:GetPos())
			item:SetFOV(10)
			item.DoClick = function()
				if gmRPG.items[v]().sellableto == merchantid then
					net.Start("requestSell")
						net.WriteString(v)
					net.SendToServer()
				else
					LocalPlayer():ChatPrint("Sorry, I won't buy that")
				end
			end
	
			item.label = vgui.Create("DLabel", item)
			item.label:SetText(text)
			item.label:SizeToContents()
			item.label:Center()
			item.label:SetContentAlignment(5)
		end
	end

	frame.Think = function()
		if oldinv != rpgInventory then
			invlist:Clear()
			refreshList()
		end
	end

	refreshList()
end)