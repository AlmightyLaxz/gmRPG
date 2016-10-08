/* gmRPG HUD Script */

surface.CreateFont( "hud_font", {
	font = "Trebuchet24",
	size = 32,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )

surface.CreateFont( "hud_font2", {
	font = "Trebuchet24",
	size = 28,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = true,
	additive = false,
	outline = false,
} )

hook.Add( "HUDPaint", "gmrpg_hud", function()
	local ply = LocalPlayer()
	draw.RoundedBox(2, 10, ScrH() - 110, 300, 100, Color( 0, 0, 0, 150 ))
	draw.DrawText( "Health: " .. ply:Health(), "hud_font2", 30, ScrH() - 110, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
	draw.DrawText( "Money: " .. money, "hud_font2", 30, ScrH() - 80, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
	draw.DrawText( "Energy: " .. energy, "hud_font2", 30, ScrH() - 50, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
	if ply:Armor() > 0 then
		draw.DrawText( "Armour: " .. ply:Armor(), "hud_font2", 170, ScrH() - 110, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
	end
end )

hook.Add( "HUDPaint", "gmrpg_hud_stats", function()
	local ply = LocalPlayer()
	draw.RoundedBox(2, 10, 10, 300, 100, Color( 0, 0, 0, 150 ))
	draw.DrawText( "Strength: " .. strength, "hud_font", 30, 15, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
	draw.DrawText( "Intelligence: " .. intelligence, "hud_font", 30, 45, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
end )

local toHide = {
	CHudHealth = true,
	CHudBattery = true,
	CHudCrosshair = true,
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( toHide[ name ] ) then return false end
end )

net.Receive("rpgSendStats", function()
	money = net.ReadString()
	energy = net.ReadString()
	strength = net.ReadString()
	intelligence = net.ReadString() 
end)