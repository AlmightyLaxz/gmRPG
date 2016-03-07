net.Receive( "rpgGymDermaStart", function()

	local gymText = net.ReadString()
	local acceptText = net.ReadString()
	local npcEnt = net.ReadEntity()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 300, 150 )
	frame:SetTitle( "Gym Owner" )
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
	DLabel:SetText(gymText)
	DLabel:SetSize(200, 80)

	local workButton = vgui.Create( "DButton", frame )
	workButton:SetPos( 20, 100 )
	workButton:SetText(acceptText)
	workButton:SetSize( 120, 40 )
	workButton.DoClick = function()
		net.Start("requestGym")
		net.WriteEntity(npcEnt)
		net.SendToServer()
		frame:Close()
	end

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 160, 100 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 120, 40 )
	closeButton.DoClick = function()
		frame:Close()
	end
end)

net.Receive( "rpgEmploymentDermaStart", function()

	local employerText = net.ReadString()
	local acceptText = net.ReadString()
	local titleText = net.ReadString()
	local npcEnt = net.ReadEntity()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 400, 300 )
	frame:SetTitle(titleText)
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:ShowCloseButton( false )
	frame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
	end
	frame:MakePopup()
	frame:Center()

	local DLabel = vgui.Create( "DLabel", frame )
	DLabel:SetPos( 10, 50 )
	DLabel:SetText(employerText)
	DLabel:SetSize(200, 80)

	local workButton = vgui.Create( "DButton", frame )
	workButton:SetPos( 50, 250 )
	workButton:SetText(acceptText)
	workButton:SetSize( 120, 40 )
	workButton.DoClick = function()
		net.Start("requestEmployment")
		net.WriteEntity(npcEnt)
		net.SendToServer()
		frame:Close()
	end

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 200, 250 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 120, 40 )
	closeButton.DoClick = function()
		frame:Close()
	end
end)



net.Receive( "rpgSchoolDermaStart", function()

	local teacherText = net.ReadString()
	local acceptText = net.ReadString()
	local npcEnt = net.ReadEntity()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 300, 150 )
	frame:SetTitle( "Teacher" )
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
	DLabel:SetText(teacherText)
	DLabel:SetSize(200, 80)

	local workButton = vgui.Create( "DButton", frame )
	workButton:SetPos( 20, 100 )
	workButton:SetText(acceptText)
	workButton:SetSize( 120, 40 )
	workButton.DoClick = function()
		net.Start("requestSchool")
		net.WriteEntity(npcEnt)
		net.SendToServer()
		frame:Close()
	end

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 160, 100 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 120, 40 )
	closeButton.DoClick = function()
		frame:Close()
	end
end)

net.Receive( "rpgEmploymentResultDermaStart", function()

	local resultText = net.ReadString()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 300, 150 )
	frame:SetTitle("Result")
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
	DLabel:SetText(resultText)
	DLabel:SetSize(300, 80)

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 100, 110 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 100, 30 )
	closeButton.DoClick = function()
		frame:Close()
	end
end)

net.Receive( "rpgCivilianDermaStart", function()

	local civText = net.ReadString()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 300, 150 )
	frame:SetTitle("Civilian")
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
	DLabel:SetText(civText)
	DLabel:SetSize(300, 80)

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 100, 110 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 100, 30 )
	closeButton.DoClick = function()
		frame:Close()
	end
end)

local charUIVisible = false

function GM:OnContextMenuOpen()
	if input.IsKeyDown(KEY_C) && !gui.IsGameUIVisible() && !charUIVisible then
		local ply = LocalPlayer()
		local frame = vgui.Create( "DFrame" )
		frame:SetPos( 5, 5 )
		frame:SetSize( 500, 600 )
		frame:SetTitle("Character Menu")
		frame:SetVisible( true )
		frame:SetDraggable( true )
		frame:ShowCloseButton( false )
		frame.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
		end
		frame:MakePopup()
		frame:Center()

		local DLabel = vgui.Create( "DLabel", frame )
		DLabel:SetPos( 10, 140 )
		DLabel:SetText(LocalPlayer():Nick())
		DLabel:SetSize(300, 80)
		DLabel:SetFont("hud_font")
		DLabel:SetTextColor(Color(255, 255, 255))

		local DLabel = vgui.Create( "DLabel", frame )
		DLabel:SetPos( 10, 200 )
		DLabel:SetText("Strength: " .. ply:GetNWString("gmrpg_strength"))
		DLabel:SetSize(300, 80)
		DLabel:SetFont("hud_font")
		DLabel:SetTextColor(Color(255, 255, 255))

		local DLabel = vgui.Create( "DLabel", frame )
		DLabel:SetPos( 10, 260 )
		DLabel:SetText("Intelligence: " .. ply:GetNWString("gmrpg_intelligence"))
		DLabel:SetSize(300, 80)
		DLabel:SetFont("hud_font")
		DLabel:SetTextColor(Color(255, 255, 255))

		local icon = vgui.Create( "DModelPanel", frame )
		icon:SetSize( 300, 600 )
		icon:SetPos(250, 20)
		icon:SetModel(LocalPlayer():GetModel())
		icon:SetFOV(20)
		local headpos = icon.Entity:GetBonePosition( icon.Entity:LookupBone( "ValveBiped.Bip01_Head1" ) )
		icon:SetCamPos( headpos-Vector( -200, 0, 0 ) )
		function icon:LayoutEntity( Entity ) return end

		local closeButton = vgui.Create( "DButton", frame )
		closeButton:SetPos( 200, 550 )
		closeButton:SetText( "Close" )
		closeButton:SetSize( 100, 30 )
		closeButton.DoClick = function()
			charUIVisible = false
			frame:Close()
		end
		charUIVisible = true
	end
end

net.Start("rpgRequestInventory")
net.SendToServer()

function displayInventory()

	inventoryVisible = true

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
	invFrame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
	end

	invlist = vgui.Create("DIconLayout", invFrame)
	invlist:SetSize(600, 90)
	invlist:SetPos(5, 10)
	invlist:SetSpaceY(5)
	invlist:SetSpaceX(5)

	for k,v in pairs(rpgInventory) do
		local model   =   _G[v[1]][1]
		local text    =   v[1]
		local item = invlist:Add("DModelPanel")
		item:SetSize(80, 80)
		item:SetModel(model)
		item:SetTooltip(text)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestUse")
				net.WriteString(text)
			net.SendToServer()
		end
		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:SetPos(10, 60)
		item.label:SetContentAlignment(5)
	end
end

function updateInventory()
	invlist:Clear()

	for k,v in pairs(rpgInventory) do
		local model   =   _G[v][1]
		local text    =   v
		local item 	  = invlist:Add("DModelPanel")
		item:SetSize(80, 80)
		item:SetModel(model)
		item:SetTooltip(text)
		item:SetLookAt(item.Entity:GetPos())
		item:SetFOV(10)
		item.DoClick = function()
			net.Start("requestUse")
				net.WriteString(text)
			net.SendToServer()
		end
		item.label = vgui.Create("DLabel", item)
		item.label:SetText(text)
		item.label:SizeToContents()
		item.label:SetPos(10, 60)
		item.label:SetContentAlignment(5)
	end
end

net.Receive("rpgSendInventory", function()
	rpgInventory = util.JSONToTable(net.ReadString())
	updateInventory()
end)

function displayCamControls()
	local ply = LocalPlayer()
	local camFrame = vgui.Create("DFrame")
	camFrame:SetPos(ScrW() / 3 - 50, ScrH() - 110)
	camFrame:SetSize( 100, 100 )
	camFrame:SetTitle("")
	camFrame:SetVisible(true)
	camFrame:SetDraggable(false)
	camFrame:ShowCloseButton(false)

	camFrame:MakePopup()
	camFrame:SetKeyBoardInputEnabled(false)
	camFrame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
	end

	local zoomIn = vgui.Create( "DButton", camFrame )
	zoomIn:SetPos(5, 10)
	zoomIn:SetText( "Zoom In" )
	zoomIn:SetSize( 90, 40 )
	zoomIn.Think = function()
		if zoomIn:IsDown() then
			rpgZoomIn()
		end
	end

	local zoomOut = vgui.Create( "DButton", camFrame )
	zoomOut:SetPos(5, 50)
	zoomOut:SetText( "Zoom In" )
	zoomOut:SetSize( 90, 40 )
	zoomOut.Think = function()
		if zoomOut:IsDown() then
			rpgZoomOut()
		end
	end
end