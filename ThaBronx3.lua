local Window = splib:MakeWindow({
 Name = "SP Library v2",
 SubTitle = "by splib",
 Setting = true,
 Intro = true,
 IntroText = "SP Hub Loading",
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

--[[
Name = <string> - The name of the UI
SubTitle = <string> - The sub name of the UI
Setting = <bool> - Toggle to show the setting on the window
Intro = <bool> - Enable/disable intro loading
IntroText = <string> - Intro title text
IntroIcon = <string> - Intro icon asset id
IntroSpeed = <number> - Intro speed multiplier
IsPremium = <bool> - If the player is has premium or not
Toggle <bool> - This if you want enable/disable toggle
Icon <string> - This if you want add a icon for your script
RainbowMainFrame = <bool> - This if you want a RBG Stroke for MainFrame
RainbowTitle = <bool> - This if you want a RBG Stroke for Title
RainbowSubTitle = <bool> - This if you want a RBG Stroke for SubName
ToggleIcon = <string> - URL to the image you want displayed on the toggle window
CloseCallback = <function> - Function to execute when the window is closed
]]
