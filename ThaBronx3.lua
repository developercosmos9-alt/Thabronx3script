local splib = loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/SP_Hub/refs/heads/main/splibv2"))()

local Window = splib:MakeWindow({
 Name = "XX Script v1",
 SubTitle = "By SuperCosmos",
 Setting = true,
 Intro = true,
 IntroText = "XX script Loading",
 IntroIcon = "rbxassetid://83114982417764",
 IntroSpeed = 1,
 Toggle = true,
 IsPremium = false,
 Icon = "rbxassetid://83114982417764",
 RainbowMainFrame = false,
 RainbowTitle = false,
 RainbowSubTitle = false,
 ToggleIcon = "rbxassetid://83114982417764",
 CloseCallback = true
})

local Tab = Window:MakeTab({
  IsMobile = false,
  IsPC = false,
  Name = "Combat",
  Icon = "rbxassetid://4483345998"
})

Tab:AddSection("Combat")

Tab:AddButton({
   IsMobile = false,
   IsPC = false,
   PremiumOnly = true,
   HidePremium = false,
   Name = "AimBot",
   Desc = "What is this button do?",
	Callback = function()
      		
  	end    
})

Tab:AddToggle({
   IsMobile = false,
   IsPC = false,
   PremiumOnly = false,
   HidePremium = false,
   Name = "Inf Money",
   Desc = "its for money duhhhh",
   Default = false,
   Flag = "ToggleSave",
	Callback = function(Value)
		local InfiniteMoney = function()
	local function BuySupplies(): boolean
		local Items = {
			"Ice-Fruit Bag",
			"Ice-Fruit Cupz",
			"FijiWater",
			"FreshWater",
		}

		for It = 1, #Items do
			local ItemStock = SharedStorage.ExoticStock:FindFirstChild(Items[It])
			if not ItemStock or ItemStock.Value == 0 then
				return false
			end
		end

		for It = 1, #Items do
			InvokeServer(GameRemotes.ExoticShopRemote, Items[It])
			Thread.Sleep(1250)
		end

		for It = 1, #Items do
			if not Utility.FindItem(Items[It]) then
				return false
			end
		end

		return true
	end

	local function GetCookingPot(): Model?
		for _, Pot: Model in ipairs (World.CookingPots:GetChildren()) do
			if not (Pot.ClassName == "Model") then
				continue
			end

			local OwnerTag = Utility.FindPath(Pot, "Owner")
			local Progress = Utility.FindPath(Pot, "CookPart/Steam/LoadUI")

			if not OwnerTag or not Progress or OwnerTag.Value or Progress.Enabled then
				continue
			end

			return Pot
		end
	end

	local function FakeExit()
		Ui.Notify("Infinite Money failed: This server has datastores GLITCHED. Please join a different server!", "Server Hop Required", 10) -- Read the function name to understand. Kinda pointless now that it's leaked.

		Thread.Sleep(250)
		Rio.InfiniteMoney = false
	end

	if Utility.GetMoney() < 2750 then
		if Utility.GetBankMoney() >= 2750 then
			Actions.WithdrawCash(2750)
		else
			Ui.Notify("You do not have enough money to buy the Kool-Aid supplies. You need at least $2,750 to proceed.", "Insufficient Funds", 5)
			return Thread.Sleep(250);
		end
	end

	if BuySupplies() == false then
		return FakeExit()
	end

	local CookingPot = GetCookingPot()
	if not CookingPot then
		return FakeExit()
	end

	local CookPart     = CookingPot.CookPart
	local CookPrompt   = CookPart.ProximityPrompt
	local CookProgress = CookPart.Steam.LoadUI

	local FijiWater    = Utility.FindItem("FijiWater")
	local FreshWater   = Utility.FindItem("FreshWater")
	local IceFruitBag  = Utility.FindItem("Ice-Fruit Bag")
	local IceFruitCupz = Utility.FindItem("Ice-Fruit Cupz")

	local CookOrder = { FijiWater, FreshWater, IceFruitBag }

	local SellPart   = World["IceFruit Sell"]
	local SellPrompt = SellPart.ProximityPrompt

	Utility.Teleport(CookPart.Position)
	Thread.Sleep(250)

	fireproximityprompt(CookPrompt, 0)
	Thread.Sleep(250)

	for It = 1, #CookOrder do
		LocalCharacter.Humanoid:EquipTool(CookOrder[It])
		Thread.Sleep(500)

		fireproximityprompt(CookPrompt, 0)

		Thread.WaitForAny({
			Thread.WaitForDelay(5000),
			LocalCharacter.ChildRemoved,
		})
	end

	while CookProgress.Enabled do
		Thread.WaitForAny({
			Thread.WaitForDelay(2035),
			CookProgress:GetPropertyChangedSignal("Enabled")
		})
	end

	Utility.Teleport(CookPart.Position)
	Thread.Sleep(250)

	LocalCharacter.Humanoid:EquipTool(IceFruitCupz)
	Thread.Sleep(100)

	fireproximityprompt(CookPrompt, 0)
	Thread.Sleep(1000)

	Utility.Teleport(SellPart.Position)
	Thread.Sleep(250)

	for _ = 1, 2000 do
		fireproximityprompt(SellPrompt, 0)
	end
end
	end    
})

Tab:AddToggle({
   IsMobile = false,
   IsPC = false,
   PremiumOnly = false,
   HidePremium = false,
   Name = "Esp",
   Desc = "Shows other players",
   Default = false,
   Flag = "ToggleSave",
	Callback = function(Value)
		-- // Roblox ESP Script with Name + Distance
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer

-- Settings
local Settings = {
    BoxColor = Color3.fromRGB(255, 0, 0),
    TextColor = Color3.fromRGB(255, 255, 255),
    TeamColor = true,           -- Use team colors
    ShowDistance = true,
    ShowName = true,
    ShowHealth = true,
    Thickness = 2,
    FontSize = 14
}

local ESP = {}

-- Create ESP for a player
local function CreateESP(player)
    if player == LocalPlayer then return end

    local Box = Drawing.new("Square")
    Box.Thickness = Settings.Thickness
    Box.Filled = false
    Box.Transparency = 1
    Box.Color = Settings.BoxColor

    local Name = Drawing.new("Text")
    Name.Size = Settings.FontSize
    Name.Center = true
    Name.Outline = true
    Name.Color = Settings.TextColor

    local Distance = Drawing.new("Text")
    Distance.Size = Settings.FontSize - 2
    Distance.Center = true
    Distance.Outline = true
    Distance.Color = Settings.TextColor

    ESP[player] = {
        Box = Box,
        Name = Name,
        Distance = Distance,
        Connections = {}
    }

    -- Update loop
    local connection = RunService.RenderStepped:Connect(function()
        local Character = player.Character
        if not Character or not Character:FindFirstChild("HumanoidRootPart") or not Character:FindFirstChild("Head") then
            Box.Visible = false
            Name.Visible = false
            Distance.Visible = false
            return
        end

        local RootPart = Character.HumanoidRootPart
        local Head = Character.Head
        local Humanoid = Character:FindFirstChild("Humanoid")

        local Vector, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)

        if not OnScreen then
            Box.Visible = false
            Name.Visible = false
            Distance.Visible = false
            return
        end

        local HeadPos = Camera:WorldToViewportPoint(Head.Position + Vector3.new(0, 0.5, 0))
        local LegPos = Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0))

        local Height = HeadPos.Y - LegPos.Y
        local Width = Height * 0.6

        -- Box
        Box.Size = Vector2.new(Width, Height)
        Box.Position = Vector2.new(Vector.X - Width/2, Vector.Y - Height/2 + 2)
        Box.Color = Settings.TeamColor and player.TeamColor.Color or Settings.BoxColor
        Box.Visible = true

        -- Name
        if Settings.ShowName then
            Name.Text = player.Name
            Name.Position = Vector2.new(Vector.X, HeadPos.Y - 20)
            Name.Visible = true
        end

        -- Distance
        if Settings.ShowDistance then
            local DistanceValue = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - RootPart.Position).Magnitude)
            Distance.Text = DistanceValue .. " studs"
            Distance.Position = Vector2.new(Vector.X, Vector.Y + Height/2 + 5)
            Distance.Visible = true
        end
    end)

    table.insert(ESP[player].Connections, connection)
end

-- Initialize ESP for all players
for , player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    CreateESP(player)
end)

-- Cleanup when player leaves
Players.PlayerRemoving:Connect(function(player)
    if ESP[player] then
        for , v in pairs(ESP[player]) do
            if typeof(v) == "Instance" then
                v:Remove()
            end
        end
        ESP[player] = nil
    end
end)

print("✅ ESP Loaded! (Name + Distance)")
	end    
})
