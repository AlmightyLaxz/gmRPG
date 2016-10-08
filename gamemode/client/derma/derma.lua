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
	DLabel:SetSize(300, 80)
	DLabel:SetWrap(true)

	local workButton = vgui.Create( "DButton", frame )
	workButton:SetPos( 10, 190 )
	workButton:SetText(acceptText)
	workButton:SetSize( 250, 30 )
	workButton.DoClick = function()
		net.Start("requestWork")
		net.WriteEntity(npcEnt)
		net.SendToServer()
		frame:Close()
	end

	local promotionButton = vgui.Create( "DButton", frame )
	promotionButton:SetPos( 10, 225 )
	promotionButton:SetText("Ask for promotion")
	promotionButton:SetSize( 250, 30 )
	promotionButton.DoClick = function()
		net.Start("requestPromotion")
			net.WriteEntity(npcEnt)
		net.SendToServer()
		frame:Close()
	end

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 10, 260 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 250, 30 )
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

local charUIVisible = false

function GM:OnContextMenuOpen()
	if !gui.IsGameUIVisible() && !charUIVisible then
		displayCharacterMenu()
	end
end

function displayCharacterMenu()
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
	DLabel:SetText("Strength: " .. strength)
	DLabel:SetSize(300, 80)
	DLabel:SetFont("hud_font")
	DLabel:SetTextColor(Color(255, 255, 255))

	local DLabel = vgui.Create( "DLabel", frame )
	DLabel:SetPos( 10, 260 )
	DLabel:SetText("Intelligence: " .. intelligence)
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

	local pvpButton = vgui.Create("DButton", frame)
	pvpButton:SetPos(200, 400)
	pvpButton:SetText("Allow PVP until death")
	pvpButton:SetSize(120, 30)
	pvpButton.DoClick = function()
		net.Start("RequestPVP")
		net.SendToServer()
	end

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

function displayControls()
	local ply = LocalPlayer()
	local camFrame = vgui.Create("DFrame")
	camFrame:SetPos(ScrW() / 3 - 150, ScrH() - 110)
	camFrame:SetSize( 200, 100 )
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
		if !useCamera then
			camFrame:SetMouseInputEnabled(false)
		else
			camFrame:SetMouseInputEnabled(true)
		end
	end

	local zoomOut = vgui.Create( "DButton", camFrame )
	zoomOut:SetPos(5, 50)
	zoomOut:SetText( "Zoom Out" )
	zoomOut:SetSize( 90, 40 )
	zoomOut.Think = function()
		if zoomOut:IsDown() then
			rpgZoomOut()
		end
	end

	local charMenu = vgui.Create( "DButton", camFrame )
	charMenu:SetPos(105, 50)
	charMenu:SetText( "Char Menu" )
	charMenu:SetSize( 90, 40 )
	charMenu.DoClick = function()
		if !charUIVisible then
			displayCharacterMenu()
		end
	end

	local attackMode = vgui.Create("DButton", camFrame)
	attackMode:SetPos(105, 10)
	attackMode:SetText("Attack Mode")
	attackMode:SetSize(90, 40)
	attackMode.DoClick = function()
		if !allowAttack then
			allowAttack = true
		else
			allowAttack = false
		end
	end
end

bankMoney = ""

net.Receive("rpgSendBankMoney", function()
	bankMoney = net.ReadString()
end)

net.Receive("rpgATMDermaStart", function()
	local npcEnt = net.ReadEntity()

	if !IsValid(npcEnt) then return false end

	net.Start("rpgRequestBankMoney")
	net.SendToServer()

	local frame = vgui.Create( "DFrame")
	frame:SetPos( 5, 5 )
	frame:SetSize( 400, 300 )
	frame:SetTitle("ATM")
	frame:SetVisible( true )
	frame:SetDraggable( true )
	frame:ShowCloseButton( false )
	frame.Paint = function( self, w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 200 ) )
	end
	frame:MakePopup()
	frame:Center()

	local blabel = vgui.Create("DLabel", frame)
	blabel:SetPos(10, 10)
	blabel:SetText("Balance: $" .. bankMoney)
	blabel:SetSize(300, 80)
	blabel:SetWrap(true)
	blabel.Think = function()
		blabel:SetText("Balance: $" .. bankMoney)
	end

	local dlabel = vgui.Create("DLabel", frame)
	dlabel:SetPos(10, 80)
	dlabel:SetText("Deposit")
	dlabel:SetSize(80, 20)
	dlabel:SetContentAlignment(5)

	// :^)
	local dwang = vgui.Create("DNumberWang", frame)
	dwang:SetPos(10, 110)
	dwang:SetSize(80, 20)
	dwang:SetMin(0)

	local dbutton = vgui.Create("DButton", frame)
	dbutton:SetPos(10, 140)
	dbutton:SetSize(80, 20)
	dbutton:SetText("Deposit")
	dbutton.DoClick = function()
		net.Start("requestDeposit")
			net.WriteUInt(dwang:GetInt(), 32)
			net.WriteEntity(npcEnt)
		net.SendToServer()
		net.Start("rpgRequestBankMoney")
		net.SendToServer()
	end

	local wlabel = vgui.Create("DLabel", frame)
	wlabel:SetPos(110, 80)
	wlabel:SetText("Withdraw")
	wlabel:SetSize(80, 20)
	wlabel:SetContentAlignment(5)

	// :^)
	local wwang = vgui.Create("DNumberWang", frame)
	wwang:SetPos(110, 110)
	wwang:SetSize(80, 20)
	wwang:SetMin(0)

	local wbutton = vgui.Create("DButton", frame)
	wbutton:SetPos(110, 140)
	wbutton:SetSize(80, 20)
	wbutton:SetText("Withdraw")
	wbutton.DoClick = function()
		net.Start("requestWithdraw")
			net.WriteUInt(wwang:GetInt(), 32)
			net.WriteEntity(npcEnt)
		net.SendToServer()
		net.Start("rpgRequestBankMoney")
		net.SendToServer()
	end

	local ilabel = vgui.Create("DLabel", frame)
	ilabel:SetPos(10, 180)
	ilabel:SetText("Interest 1.5%/minute")
	ilabel:SetSize(180, 20)
	ilabel:SetContentAlignment(5)


	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 10, 260 )
	closeButton:SetText("Close")
	closeButton:SetSize( 250, 30 )
	closeButton.DoClick = function()
		frame:Close()
	end
end)

function displayProgress(time)
	local startTime = CurTime()
	local endTime = CurTime() + time
	hook.Add("HUDPaint", "gmrpg_progress", function()
		// taken from DarkRP, thanks falco
		local w = ScrW()
    	local h = ScrH() + 700
    	local x, y, width, height = w / 2 - w / 10, h / 2 - 60, w / 5, h / 30
    	draw.RoundedBox(8, x, y, width, height, Color(10,10,10,120))
    	local curtime = CurTime() - startTime
    	local time = endTime - startTime
    	local status = math.Clamp(curtime / time, 0, 1)
    	local BarWidth = status * (width - 16)
    	local cornerRadius = math.Min(8, BarWidth / 3 * 2 - BarWidth / 3 * 2 % 2)
    	draw.RoundedBox(cornerRadius, x + 8, y + 8, BarWidth, height - 16, Color(255 - (status * 255), 0 + (status * 255), 0, 100))
	end)
	timer.Simple(time, function()
		hook.Remove("HUDPaint", "gmrpg_progress")
	end)
end

net.Receive("rpgShowProgress", function()
	displayProgress(net.ReadUInt(16))
end)