 local bullshittable = {KeyObtain = {}, LeverForGate = {},LiveHintBook = {}}
    local prompttable = {"KeyObtain", "LeverForGate", "LiveHintBook",}
    
    local function outline(dad)
        local esp = Instance.new("Highlight")
        esp.Name = "Outline"
        esp.FillTransparency = 1
        esp.FillColor = Color3.new(1, 0.666667, 0)
        esp.OutlineColor = Color3.new(255,0,0)
        esp.OutlineTransparency = 0
        esp.Parent = dad
    end

    function getbullshit()
        local function getname(a)
            return bullshittable[a.Parent.Name]
        end

        local function checkifstillthere(a)
            for _,v in pairs(a) do
                if v.Parent == nil then
                    table.remove(a, i)
                end
            end
        end

        while task.wait(1) do
            for _,v in pairs(game:GetService("Workspace").CurrentRooms:GetDescendants()) do 
                if v:IsA("ProximityPrompt") and table.find(prompttable, v.Parent.Name) then
                     table.insert(getname(v), v)
                end
            end

            for _,v in pairs(bullshittable) do
                checkifstillthere(v)
            end
        end
    end
    coroutine.wrap(getbullshit)()
    
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()

-- Create Window
local Window = Library:AddWindow({
	title = {"Coldware", "Doors Utilities"},
	theme = {
		Accent = Color3.fromRGB(120, 81, 169)
	},
	key = Enum.KeyCode.F,
	default = true
})

local Tab = Window:AddTab("Main", {default = true})

local Section = Tab:AddSection("Main", {default = true})

local Label = Section:AddLabel("Item Shop Things")

local Button = Section:AddButton("Crucifix Plushy", function()
	CustomShop.CreateItem(exampleTool, {
    Title = "Crucifix Plushy",
    Desc = "Crucifix Plushy?? HOW?",
    Image = "https://media.discordapp.net/attachments/1082382296411295955/1084501159936540672/Png_5.png",
    Price = 1,
    Stack = 69,
})
end)

local Label = Section:AddLabel("Main Things")

local Slider = Section:AddSlider("Key Aura Range", 10, 20, 10, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	val = keyrange
end)

local Slider = Section:AddSlider("Lever Aura Range", 10, 20, 10, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	val = leverrange
end)

local Slider = Section:AddSlider("Book Aura Range", 10, 20, 10, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	val = bookrange
end)

local Toggle = Section:AddToggle("Fullbright", {flag = "Toggle_Flag", default = false}, function(v)
	if v then
            game:GetService("Lighting").Brightness = 2
            game:GetService("Lighting").ClockTime = 14
            game:GetService("Lighting").FogEnd = 100000
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        else
            game:GetService("Lighting").Brightness = 3
            game:GetService("Lighting").ClockTime = 20
            game:GetService("Lighting").FogEnd = 1.1111111533265e+16
            game:GetService("Lighting").GlobalShadows = true
            game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(0.5, 0.5, 0.5)
        end
end)

local keyesp
local Toggle = Section:AddToggle("Key ESP", {flag = "Toggle_Flag", default = false}, function(val)
	keyesp = val
        if keyesp then
            repeat task.wait(.25)
                for i,v in pairs(bullshittable.KeyObtain) do
                    pcall(function()
                        if not v.Parent:FindFirstChild("Outline") then
                            if keyesp then
                                outline(v.Parent)
                            end
                        end
                    end)
                end
            until not keyesp
        else
            for i,v in pairs(bullshittable.KeyObtain) do
                pcall(function()
                    v.Parent.Outline:Destroy()
                end)
            end
        end
end)

local bookesp
local Toggle = Section:AddToggle("Book ESP", {flag = "Toggle_Flag", default = false}, function(val)
	bookesp = val
        if bookesp then
            repeat task.wait(.25)
                for i,v in pairs(bullshittable.LiveHintBook) do
                    pcall(function()
                        if not v.Parent:FindFirstChild("Outline") then
                            if bookesp then
                                outline(v.Parent)
                            end
                        end
                    end)
                end
            until not bookesp
        else
            for i,v in pairs(bullshittable.LiveHintBook) do
                pcall(function()
                    v.Parent.Outline:Destroy()
                end)
            end
        end
end)

local leveresp
local Toggle = Section:AddToggle("Lever ESP", {flag = "Toggle_Flag", default = false}, function(val)
	leveresp = val
        if leveresp then
            repeat task.wait(.25)
                for i,v in pairs(bullshittable.LeverForGate) do
                    pcall(function()
                        if not v.Parent:FindFirstChild("Outline") then
                            if leveresp then
                                outline(v.Parent)
                            end
                        end
                    end)
                end
            until not leveresp
        else
            for i,v in pairs(bullshittable.LeverForGate) do
                pcall(function()
                    v.Parent.Outline:Destroy()
                end)
            end
        end
end)

local Slider = Section:AddSlider("Speed", 16, 45, 16, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val)
	       getgenv().ws = val
    end)
    task.spawn(function()
        while task.wait() do
            if getgenv().wstog then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().ws
            end
        end
end)
