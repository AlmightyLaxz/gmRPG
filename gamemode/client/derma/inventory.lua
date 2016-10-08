net.Start("rpgRequestInventory")
net.SendToServer()

function displayInventory()
	inventoryVisible = true

	rpgInventory = {}

	local ply = LocalPlayer()
	local invFrame = vgui.Create("DFrame")
	invFrame:SetPos(ScrW() / 2 - 260, ScrH() - 110)
	invFrame:SetSize( 520, 100 )
	invFrame:SetTitle("")
	invFrame:SetVisible(true)
	invFrame:SetDraggable(false)
	invFrame:ShowCloseButton(false)
	invFrame:MakePopup()
	invFrame:SetKeyBoardInputEnabled(false)
	invFrame:SetMouseInputEnabled(true)
	invFrame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
	end

	invlist = vgui.Create("DIconLayout", invFrame)
	invlist:SetSize(600, 90)
	invlist:SetPos(5, 10)
	invlist:SetSpaceY(5)
	invlist:SetSpaceX(5)

	for _,v in pairs(rpgInventory) do
		local model   =   gmRPG.items[v]().model
		local text    =   gmRPG.items[v]().name
		local tooltip =   "$" .. gmRPG.items[v]().price
		local item 	  =   invlist:Add("DModelPanel")
		item:SetSize(80, 80)
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestUse")
				net.WriteString(v)
			net.SendToServer()
		end
		item.DoRightClick = function()
			local dmenu = vgui.Create("DMenu", item)
			local usebtn = dmenu:AddOption("Use")
			usebtn:SetIcon("icon16/bullet_go.png")
			local inspectbtn = dmenu:AddOption("Inspect")
			inspectbtn:SetIcon("icon16/cog.png")
			local destroybtn = dmenu:AddOption("Destroy")
			destroybtn:SetIcon("icon16/cancel.png")
			dmenu:Open()
			usebtn.DoClick = function()
				net.Start("requestUse")
					net.WriteString(v)
				net.SendToServer()
			end
			inspectbtn.DoClick = function()
				InspectItem(v)
			end
			destroybtn.DoClick = function()
				net.Start("requestDestruction")
					net.WriteString(v)
				net.SendToServer()
			end
		end
		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:SetPos(10, 60)
		item.label:SetContentAlignment(5)
	end
end

function updateInventory()
	rpgInventory = util.JSONToTable(net.ReadString())
	invlist:Clear()

	for _,v in pairs(rpgInventory) do
		local model   =   gmRPG.items[v]().model
		local text    =   gmRPG.items[v]().name
		local tooltip =   "$" .. gmRPG.items[v]().price
		local item 	  =   invlist:Add("DModelPanel")
		item:SetSize(80, 80)
		item:SetModel(model)
		item:SetTooltip(tooltip)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestUse")
				net.WriteString(v)
			net.SendToServer()
		end
		item.DoRightClick = function()
			local dmenu = vgui.Create("DMenu", item)
			local usebtn = dmenu:AddOption("Use")
			usebtn:SetIcon("icon16/bullet_go.png")
			local inspectbtn = dmenu:AddOption("Inspect")
			inspectbtn:SetIcon("icon16/cog.png")
			local destroybtn = dmenu:AddOption("Destroy")
			destroybtn:SetIcon("icon16/cancel.png")
			dmenu:Open()
			usebtn.DoClick = function()
				net.Start("requestUse")
					net.WriteString(v)
				net.SendToServer()
			end
			inspectbtn.DoClick = function()
				InspectItem(v)
			end
			destroybtn.DoClick = function()
				net.Start("requestDestruction")
					net.WriteString(v)
				net.SendToServer()
			end
		end
		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:SetPos(10, 60)
		item.label:SetContentAlignment(5)
	end
end

net.Receive("rpgSendInventory", updateInventory)

function InspectItem(i)
	local ply = LocalPlayer()
	local inspectFrame = vgui.Create("DFrame")
	PrintTable(gmRPG.items[i]())
	inspectFrame:SetSize( 600, 600 )
	inspectFrame:Center()
	inspectFrame:SetTitle("Inspect")
	inspectFrame:SetVisible(true)
	inspectFrame:SetDraggable(true)
	inspectFrame:ShowCloseButton(false)
	inspectFrame:MakePopup()
	inspectFrame:SetKeyBoardInputEnabled(false)
	inspectFrame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
	end

	local item = vgui.Create("DModelPanel", inspectFrame)
	item:SetSize(400, 400)
	item:Center()
	item:SetModel(gmRPG.items[i]().model)
	item:SetLookAt(item.Entity:GetPos())
	item:SetFOV(10)

	local DLabel = vgui.Create( "DLabel", inspectFrame )
	DLabel:SetPos( 0, 20 )
	DLabel:SetText(gmRPG.items[i]().name)
	DLabel:SetSize(600, 80)
	DLabel:SetFont("hud_font")
	DLabel:SetTextColor(Color(255, 255, 255))
	DLabel:SetContentAlignment(5)

	local closeButton = vgui.Create("DButton", inspectFrame)
	closeButton:SetPos(200, 550)
	closeButton:SetText("Close")
	closeButton:SetSize(200, 40)
	closeButton.DoClick = function()
		inspectFrame:Close()
	end
end