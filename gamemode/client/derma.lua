/* gmRPG Derma Script */

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

net.Receive( "rpgBarDermaStart", function()

	local barText = net.ReadString()
	local npcEnt = net.ReadEntity()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 500, 300 )
	frame:SetTitle( "Bar Tender" )
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
	DLabel:SetText(barText)
	DLabel:SetSize(200, 80)

	local invlist	= vgui.Create( "DIconLayout", frame )
	invlist:SetSize( 340, 200 )
	invlist:SetPos( 50, 70 )
	invlist:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	invlist:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5

	/*/////////////////////////////////////////
	            THIS IS WHERE THE
				MERCHANT ITEMS GO
				UNTIL I FIND A
				BETTER SOLUTION
	/////////////////////////////////////////*/

	local item = invlist:Add( "DModelPanel" )
	item:SetSize( 80, 80 )
	item:SetModel("models/props_junk/garbage_glassbottle003a.mdl")
	item:SetTooltip("$10")
	item:SetLookAt(item.Entity:GetPos())
	item:SetFOV(10)
	item.DoClick = function()
        net.Start("requestPurchase")
		net.WriteString("Beer")
        net.SendToServer()
    end

	item.label = vgui.Create("DLabel", item)
	item.label:SetText("Beer\n $10")
	item.label:SizeToContents()
	item.label:Center()
	item.label:SetContentAlignment(5)

	local item = invlist:Add( "DModelPanel" )
	item:SetSize( 80, 80 )
	item:SetModel("models/props_junk/garbage_glassbottle001a.mdl")
	item:SetTooltip("$15")
	item:SetLookAt(item.Entity:GetPos())
	item:SetFOV(10)
	item.DoClick = function()
        net.Start("requestPurchase")
		net.WriteString("Strong Beer")
		net.WriteEntity(npcEnt)
        net.SendToServer()
    end

	item.label = vgui.Create("DLabel", item)
	item.label:SetText("Strong Beer\n $15")
	item.label:SizeToContents()
	item.label:Center()
	item.label:SetContentAlignment(5)

	/*local item = invlist:Add( "DModelPanel" )
	item:SetSize( 80, 80 )
	item:SetModel("models/props_junk/garbage_coffeemug001a.mdl")
	item:SetTooltip("$10")
	item:SetText("Coffee\n $10")
	item.DoClick = function()
		net.Start("requestPurchaseCoffee")
		net.SendToServer()
	end*/

	/*/////////////////////////////////////////
	/////////////////////////////////////////*/

	local closeButton = vgui.Create( "DButton", frame )
	closeButton:SetPos( 200, 250 )
	closeButton:SetText( "Close" )
	closeButton:SetSize( 120, 40 )
	closeButton.DoClick = function()
		frame:Close()
	end
end)

net.Receive( "rpgCafeDermaStart", function()

	local cafeText = net.ReadString()
	local npcEnt = net.ReadEntity()

	local frame = vgui.Create( "DFrame" )
	frame:SetPos( 5, 5 )
	frame:SetSize( 500, 300 )
	frame:SetTitle( "Cafe Worker" )
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
	DLabel:SetText(cafeText)
	DLabel:SetSize(200, 80)

	local invlist	= vgui.Create( "DIconLayout", frame )
	invlist:SetSize( 340, 200 )
	invlist:SetPos( 50, 70 )
	invlist:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	invlist:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5

	/*/////////////////////////////////////////
	            THIS IS WHERE THE
				MERCHANT ITEMS GO
				UNTIL I FIND A
				BETTER SOLUTION
	/////////////////////////////////////////*/

	local item = invlist:Add( "DModelPanel" )
	item:SetSize( 80, 80 )
	item:SetModel("models/props_junk/garbage_coffeemug001a.mdl")
	item:SetTooltip("$10")
	item:SetLookAt(item.Entity:GetPos())
	item:SetFOV(7)
	item.DoClick = function()
		net.Start("requestPurchase")
		net.WriteString("Coffee")
		net.WriteEntity(npcEnt)
		net.SendToServer()
	end
	item.label = vgui.Create("DLabel", item)
	item.label:SetText("Coffee\n $10")
	item.label:SizeToContents()
	item.label:Center()
	item.label:SetContentAlignment(5)

	local item = invlist:Add( "DModelPanel" )
	item:SetSize( 80, 80 )
	item:SetModel("models/props_junk/garbage_coffeemug001a.mdl")
	item:SetTooltip("$15")
	item:SetLookAt(item.Entity:GetPos())
	item:SetFOV(7)
	item.DoClick = function()
		net.Start("requestPurchase")
		net.WriteString("Strong Coffee")
		net.WriteEntity(npcEnt)
		net.SendToServer()
	end
	item.label = vgui.Create("DLabel", item)
	item.label:SetText("Strong Coffee\n $15")
	item.label:SizeToContents()
	item.label:Center()
	item.label:SetContentAlignment(5)

	local item = invlist:Add( "DModelPanel" )
	item:SetSize( 80, 80 )
	item:SetModel("models/props_junk/PopCan01a.mdl")
	item:SetTooltip("$5")
	item:SetLookAt(item.Entity:GetPos())
	item:SetFOV(7)
	item.DoClick = function()
		net.Start("requestPurchase")
		net.WriteString("Energy Drink")
		net.WriteEntity(npcEnt)
		net.SendToServer()
	end
	item.label = vgui.Create("DLabel", item)
	item.label:SetText("Energy Drink\n $5")
	item.label:SizeToContents()
	item.label:Center()
	item.label:SetContentAlignment(5)

	local item = invlist:Add( "DModelPanel" )
	item:SetSize( 80, 80 )
	item:SetModel("models/props_junk/garbage_takeoutcarton001a.mdl")
	item:SetTooltip("$5")
	item:SetLookAt(item.Entity:GetPos())
	item:SetFOV(10)
	item.DoClick = function()
		net.Start("requestPurchase")
		net.WriteString("Noodles")
		net.WriteEntity(npcEnt)
		net.SendToServer()
	end
	item.label = vgui.Create("DLabel", item)
	item.label:SetText("Noodles\n $5")
	item.label:SizeToContents()
	item.label:Center()
	item.label:SetContentAlignment(5)

	/*/////////////////////////////////////////
	/////////////////////////////////////////*/

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
