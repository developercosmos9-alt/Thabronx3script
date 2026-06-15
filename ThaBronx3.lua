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
   Name = "Toggle",
   Desc = "What is this toggle do?",
   Default = false,
   Flag = "ToggleSave",
	Callback = function(Value)
		
	end    
})
