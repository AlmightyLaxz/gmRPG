GM.Name = "gmRPG"
GM.Author = "Almighty Laxz"
GM.Email = "N/A"
GM.Website = "N/A"

DeriveGamemode("base")

function GM:Initialize()
    print("gmRPG Initialized")
end

function GM:SetupMove(ply, mv)
	mv:SetMoveAngles(Angle(0, 0, 0))
end

function GM:CreateTeams()
	TEAM_STANDARD = 0
	TEAM_PVP = 1
	team.SetUp(TEAM_STANDARD, "Standard", Color(0, 255, 0, 255))
	team.SetUp(TEAM_PVP, "PVP", Color(255, 0, 0, 255))
end