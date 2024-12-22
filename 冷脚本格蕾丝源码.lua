local LS = {
    autolever = false,
    autoleverdistan = 20,
    autodoor = false,
    autodoordistance = 20,
    autoinst = false,
    autoinstdistance = 12,
}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Character = Players.LocalPlayer.Character
local humanoid = Character:FindFirstChild("Humanoid")
local PlayerGui = Players.LocalPlayer.PlayerGui
local tpwalking = false
local RunService = game:GetService("RunService")
local hb = RunService.Heartbeat
local speed = 1

function Notify(top, txt, dur)--bai
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = top,
    Text = txt,
    Duration = dur,
  })
end

local function evadeMonsters(monsterName)
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("Model") and instance.Name == monsterName then
            local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            local con = game:GetService("RunService").Heartbeat:Connect(function()
                game.Players.LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0, -20, 0))
            end)

            instance.Destroying:Wait()
            con:Disconnect()
            game.Players.LocalPlayer.Character:MoveTo(OldPos)
        end
    end
    workspace.DescendantAdded:Connect(function(instance)
        if instance:IsA("Model") and instance.Name == monsterName then
            evadeMonsters(monsterName)
        end
    end)
end

local function notifyMonsters(monsterName)
    for _, instance in pairs(workspace:GetDescendants()) do
        if instance:IsA("Model") and instance.Name == monsterName then
            Notify("已出现", monsterName, 4)
        end
    end
    workspace.DescendantAdded:Connect(function(instance)
        if instance:IsA("Model") and instance.Name == monsterName then
            Notify("已出现", monsterName, 4)
        end
    end)
end
local success, library = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/LENG8123/UI/refs/heads/main/%E5%86%B7library.lua"))()
end)

if not success then
    Notification("冷脚本", "UI加载失败", 3)
    return
end
--
local window = library:new("冷脚本-格蕾丝")

local lengNB = window:Tab("主要功能",'')

local Main = lengNB:section("互动功能",true)

Main:Button("自动躲避怪物", function()
    evadeMonsters("eyePrime")
    evadeMonsters("Rush")
    evadeMonsters("smile")
    evadeMonsters("elkman")
    evadeMonsters("SendWorm")
end)

Main:Button("怪物提醒", function()
    notifyMonsters("eyePrime")
    notifyMonsters("Rush")
    notifyMonsters("smile")
    notifyMonsters("elkman")
    notifyMonsters("SendWorm")
end)

Main:Button("怪物通知",function()
local entityNames = {"WallModel", "BackdoorLookman", "Rush", "Dust", "Eyes", "JeffTheKiller", "Dread", "A60", "A120"}  --enity
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()
            local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/Revenant", true))()

            -- Ensure flags and plr are defined
            local flags = flags or {} --Prevent Error
            local plr = game.Players.LocalPlayer --Prevent Error2

            local function notifyEntitySpawn(entity)
                    Library.DefaultColor = Color3.fromRGB(255,0,0)

            Library:Notification({
        	Text = "请注意查看左下角刷新内容",
        	Duration = 6
            })
                
                                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://119569050211059"
sound:Play()

            Library:Notification({
        	Text = "怪物已刷新",
        	Duration = 6
            })
                
                                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://119569050211059"
sound:Play()

            Library:Notification({
        	Text = "怪物刷新",
        	Duration = 6
            })
                
                                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://119569050211059"
sound:Play()

            Library:Notification({
        	Text = "躲起来",
        	Duration = 6
            })
                
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()
            end

            local function onChildAdded(child)
                if table.find(entityNames, child.Name) then
                    repeat
                        task.wait()
                    until plr:DistanceFromCharacter(child:GetPivot().Position) < 1000 or not child:IsDescendantOf(workspace)
                    
                    if child:IsDescendantOf(workspace) then
                        notifyEntitySpawn(child)
                    end
                end
            end

            -- Infinite loop to keep the script running and check for hintrush flag
            local running = true
            while running do
                local connection = workspace.ChildAdded:Connect(onChildAdded)
                
                repeat
                    task.wait(1) -- Adjust the wait time as needed
                until not flags.hint or not running
                
                connection:Disconnect()
            end
end)

Main:Textbox("人物漂移加速", "", "输入数字", function(Value)
    if tonumber(Value) then
        speed = tonumber(Value)
        tpwalking = true
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
        
        if humanoid then
            RunService:UnbindFromRenderStep("TPWalk")

            RunService:BindToRenderStep("TPWalk", Enum.RenderPriority.Character.Value, function(delta)
                if tpwalking and character and humanoid and humanoid.Parent then
                    if humanoid.MoveDirection.Magnitude > 0 then
                        character:TranslateBy(humanoid.MoveDirection * speed * delta * 10)
                    end
                end
            end)
        end
    else
        print("Invalid input. Please enter a number.")
    end
end)
Main:Button("红色眼睛刷新提示",function()
            local entityNames = {"elkman", "BackdoorLookman", "Rush", "AmbushMoving", "Eyes", "JeffTheKiller", "Dread", "A60", "A120"}  --enity
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()
            local OrionLib = loadstring(game:HttpGet(('https://pastebin.com/raw/1mPger1J')))()

            -- Ensure flags and plr are defined
            local flags = flags or {} --Prevent Error
            local plr = game.Players.LocalPlayer --Prevent Error2

            local function notifyEntitySpawn(entity)
                    OrionLib:MakeNotification({
                    Name = "红色眼睛怪物出现，警告WARN!!!!!!!!!!!!!!",
                    Content = "不要转移视线!!!!! 跑起来!!!!",
                    Time = 3
                })     
                
                                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://119569050211059"
sound:Play()

                    OrionLib:MakeNotification({
                    Name = "冷脚本",
                    Content = "刷新",
                    Time = 7
                })
                
                local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://4590662766"
sound:Play()
            end

            local function onChildAdded(child)
                if table.find(entityNames, child.Name) then
                    repeat
                        task.wait()
                    until plr:DistanceFromCharacter(child:GetPivot().Position) < 1000 or not child:IsDescendantOf(workspace)
                    
                    if child:IsDescendantOf(workspace) then
                        notifyEntitySpawn(child)
                    end
                end
            end

            -- Infinite loop to keep the script running and check for hintrush flag
            local running = true
            while running do
                local connection = workspace.ChildAdded:Connect(onChildAdded)
                
                repeat
                    task.wait(1) -- Adjust the wait time as needed
                until not flags.hint or not running
                
                connection:Disconnect()
            end
end)
Main:Button("上帝模式",function()
    if descendant:IsA("ParticleEmitter") then
        descendant.Rate = descendant.Rate * 10 -- line of code i added for low-graphics players to see the red(blood) rain
    end
end)
Main:Button("点击即可漂移加速关闭",function()
    tpwalking = false
    RunService:UnbindFromRenderStep("TPWalk")
end)

Main:Slider("自动拉杆距离", "autoleverdistance", 20, 0, 100, false, function(Value)
    LS.autoleverdistance = Value
end)

Main:Toggle("自动拉杆", "autolever", false, function(state)
    LS.autolever = state
    if LS.autolever then
        while LS.autolever do
            wait()
            for _, breaker in pairs(workspace.Rooms:GetDescendants()) do
                if breaker.Name == "Breaker" then
                    if Players.LocalPlayer:DistanceFromCharacter(breaker:WaitForChild("base").Position) <= LS.autoleverdistance then
                    breaker.Touched:FireServer()
                    end
                end
                wait()
            end
        end
    end
end)

Main:Slider("自动开门距离", "autodoordistance", 20, 0, 100, false, function(Value)
    LS.autodoordistance = Value
end)

Main:Toggle("自动开门", "autodoor", false, function(state)
    LS.autodoor = state
    if LS.autodoor then
        while LS.autodoor do
            wait()
            for _, door in pairs(workspace.Rooms:GetDescendants()) do
                if door.Name == "TouchInterest" and door.Parent.Name == "kickBox" and Players.LocalPlayer:DistanceFromCharacter(door.Parent.Position) <= LS.autodoordistance then
                    door.Parent.Parent.RemoteEvent:FireServer()
                end
            end
            wait()
        end
    end
end)

Main:Slider("自动互动距离", "autoinstdistance", 20, 0, 100, false, function(Value)
    LS.autoinstdistance = Value
end)

Main:Toggle("自动互动", "autoinst", false, function(state)
    LS.autoinst = state
    if LS.autoinst then
        while LS.autoinst do
            wait()
            for _, toezInteract in pairs(workspace.Rooms:GetDescendants()) do
                if toezInteract:IsA("ProximityPrompt") then
                    toezInteract.RequiresLineOfSight = false
                    toezInteract.MaxActivationDistance = LS.autoinstdistance
                    fireclickdetector(toezInteract)
                end
            end
            wait()
        end
    end
end)
local Setp = lengNB:section("自动过关",true)

Setp:Button("自动自动过关(请珍惜娱乐时光 勿多次使用)", function()
task.spawn(function()
    while true do
        hitboxes = {}
            for _, hitbox in pairs(workspace.Rooms:GetDescendants()) do
                if hitbox.Name == "hitBox" then
                    table.insert(hitboxes,hitbox)
                    end
                end
            for _, i in pairs(hitboxes) do
                teleportPlayerTo(i.CFrame)
                end
                hitboxes = {}
                task.wait(0.02)
            end
        end)
end)

local dingding = window:Tab("透视功能",'')

local tab = dingding:section("透视功能",true)

tab:Toggle("门文字透视","arkade",false,function(state)
        if state then
            _G.arkadeESPInstances = {}
            local esptable = {doors = {}}

            local function createBillboard(instance, name, color)
                local bill = Instance.new("BillboardGui", game.CoreGui)
                bill.AlwaysOnTop = true
                bill.Size = UDim2.new(0, 100, 0, 50)
                bill.Adornee = instance
                bill.MaxDistance = 2000

                local mid = Instance.new("Frame", bill)
                mid.AnchorPoint = Vector2.new(0.5, 0.5)
                mid.BackgroundColor3 = color
                mid.Size = UDim2.new(0, 8, 0, 8)
                mid.Position = UDim2.new(0.5, 0, 0.5, 0)
                Instance.new("UICorner", mid).CornerRadius = UDim.new(1, 0)
                Instance.new("UIStroke", mid)

                local txt = Instance.new("TextLabel", bill)
                txt.AnchorPoint = Vector2.new(0.5, 0.5)
                txt.BackgroundTransparency = 1
                txt.TextColor3 = color
                txt.Size = UDim2.new(1, 0, 0, 20)
                txt.Position = UDim2.new(0.5, 0, 0.7, 0)
                txt.Text = name
                Instance.new("UIStroke", txt)

                task.spawn(function()
                    while bill do
                        if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                            bill.Enabled = false
                            bill.Adornee = nil
                            bill:Destroy()
                        end
                        task.wait()
                    end
                end)
            end

            local function monitorarkade()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "Frame" then
                        createBillboard(instance, "门", Color3.new(0, 0, 255)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "Frame" then
                        createBillboard(instance, "门", Color3.new(0, 0, 255)) -- Change color as needed
                    end
                end)
            end

            monitorarkade()
            table.insert(_G.arkadeESPInstances, esptable)
				
        else
            if _G.arkadeESPInstances then
                for _, instance in pairs(_G.arkadeESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.arkadeESPInstances = nil
            end
        end
    end)                            
    
tab:Toggle("拉杆文字透视","arkade",false,function(state)
        if state then
            _G.arkadeESPInstances = {}
            local esptable = {doors = {}}

            local function createBillboard(instance, name, color)
                local bill = Instance.new("BillboardGui", game.CoreGui)
                bill.AlwaysOnTop = true
                bill.Size = UDim2.new(0, 100, 0, 50)
                bill.Adornee = instance
                bill.MaxDistance = 2000

                local mid = Instance.new("Frame", bill)
                mid.AnchorPoint = Vector2.new(0.5, 0.5)
                mid.BackgroundColor3 = color
                mid.Size = UDim2.new(0, 8, 0, 8)
                mid.Position = UDim2.new(0.5, 0, 0.5, 0)
                Instance.new("UICorner", mid).CornerRadius = UDim.new(1, 0)
                Instance.new("UIStroke", mid)

                local txt = Instance.new("TextLabel", bill)
                txt.AnchorPoint = Vector2.new(0.5, 0.5)
                txt.BackgroundTransparency = 1
                txt.TextColor3 = color
                txt.Size = UDim2.new(1, 0, 0, 20)
                txt.Position = UDim2.new(0.5, 0, 0.7, 0)
                txt.Text = name
                Instance.new("UIStroke", txt)

                task.spawn(function()
                    while bill do
                        if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                            bill.Enabled = false
                            bill.Adornee = nil
                            bill:Destroy()
                        end
                        task.wait()
                    end
                end)
            end

            local function monitorarkade()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "Breaker" then
                        createBillboard(instance, "拉杆", Color3.new(255, 128, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "Breaker" then
                        createBillboard(instance, "拉杆", Color3.new(255, 128, 0)) -- Change color as needed
                    end
                end)
            end

            monitorarkade()
            table.insert(_G.arkadeESPInstances, esptable)
				
        else
            if _G.arkadeESPInstances then
                for _, instance in pairs(_G.arkadeESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.arkadeESPInstances = nil
            end
        end
    end)                

tab:Button("冲击怪物文字透视",function()
    EAT = state
        if EAT then
            _G.Tree2ESPInstances = {}
            local esptable = {doors = {}}

            local function createBillboard(instance, name, color)
                local bill = Instance.new("BillboardGui", game.CoreGui)
                bill.AlwaysOnTop = true
                bill.Size = UDim2.new(0, 100, 0, 50)
                bill.Adornee = instance
                bill.MaxDistance = 2000

                local mid = Instance.new("Frame", bill)
                mid.AnchorPoint = Vector2.new(0.5, 0.5)
                mid.BackgroundColor3 = color
                mid.Size = UDim2.new(0, 8, 0, 8)
                mid.Position = UDim2.new(0.5, 0, 0.5, 0)
                Instance.new("UICorner", mid).CornerRadius = UDim.new(1, 0)
                Instance.new("UIStroke", mid)

                local txt = Instance.new("TextLabel", bill)
                txt.AnchorPoint = Vector2.new(0.5, 0.5)
                txt.BackgroundTransparency = 1
                txt.TextColor3 = color
                txt.Size = UDim2.new(1, 0, 0, 20)
                txt.Position = UDim2.new(0.5, 0, 0.7, 0)
                txt.Text = name
                Instance.new("UIStroke", txt)

                task.spawn(function()
                    while bill do
                        if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                            bill.Enabled = false
                            bill.Adornee = nil
                            bill:Destroy()
                        end
                        task.wait()
                    end
                end)
            end

            local function monitorTree2()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "Rush" then
                        createBillboard(instance, "RUSH", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "Rush" then
                        createBillboard(instance, "RUSH", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
end)

tab:Button("眼睛文字透视",function()
    EAT = state
        if EAT then
            _G.Tree2ESPInstances = {}
            local esptable = {doors = {}}

            local function createBillboard(instance, name, color)
                local bill = Instance.new("BillboardGui", game.CoreGui)
                bill.AlwaysOnTop = true
                bill.Size = UDim2.new(0, 100, 0, 50)
                bill.Adornee = instance
                bill.MaxDistance = 2000

                local mid = Instance.new("Frame", bill)
                mid.AnchorPoint = Vector2.new(0.5, 0.5)
                mid.BackgroundColor3 = color
                mid.Size = UDim2.new(0, 8, 0, 8)
                mid.Position = UDim2.new(0.5, 0, 0.5, 0)
                Instance.new("UICorner", mid).CornerRadius = UDim.new(1, 0)
                Instance.new("UIStroke", mid)

                local txt = Instance.new("TextLabel", bill)
                txt.AnchorPoint = Vector2.new(0.5, 0.5)
                txt.BackgroundTransparency = 1
                txt.TextColor3 = color
                txt.Size = UDim2.new(1, 0, 0, 20)
                txt.Position = UDim2.new(0.5, 0, 0.7, 0)
                txt.Text = name
                Instance.new("UIStroke", txt)

                task.spawn(function()
                    while bill do
                        if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                            bill.Enabled = false
                            bill.Adornee = nil
                            bill:Destroy()
                        end
                        task.wait()
                    end
                end)
            end

            local function monitorTree2()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "Worm" then
                        createBillboard(instance, "眼睛", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "Worm" then
                        createBillboard(instance, "眼睛", Color3.new(255, 0, 0)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
end)

tab:Button("山羊人文字透视",function()
    EAT = state
        if EAT then
            _G.Tree2ESPInstances = {}
            local esptable = {doors = {}}

            local function createBillboard(instance, name, color)
                local bill = Instance.new("BillboardGui", game.CoreGui)
                bill.AlwaysOnTop = true
                bill.Size = UDim2.new(0, 100, 0, 50)
                bill.Adornee = instance
                bill.MaxDistance = 2000

                local mid = Instance.new("Frame", bill)
                mid.AnchorPoint = Vector2.new(0.5, 0.5)
                mid.BackgroundColor3 = color
                mid.Size = UDim2.new(0, 8, 0, 8)
                mid.Position = UDim2.new(0.5, 0, 0.5, 0)
                Instance.new("UICorner", mid).CornerRadius = UDim.new(1, 0)
                Instance.new("UIStroke", mid)

                local txt = Instance.new("TextLabel", bill)
                txt.AnchorPoint = Vector2.new(0.5, 0.5)
                txt.BackgroundTransparency = 1
                txt.TextColor3 = color
                txt.Size = UDim2.new(1, 0, 0, 20)
                txt.Position = UDim2.new(0.5, 0, 0.7, 0)
                txt.Text = name
                Instance.new("UIStroke", txt)

                task.spawn(function()
                    while bill do
                        if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then
                            bill.Enabled = false
                            bill.Adornee = nil
                            bill:Destroy()
                        end
                        task.wait()
                    end
                end)
            end

            local function monitorTree2()
                for _, instance in pairs(workspace:GetDescendants()) do
                    if instance:IsA("Model") and instance.Name == "elkman" then
                        createBillboard(instance, "山羊人", Color3.new(128, 42, 42)) -- Change color as needed
                    end
                end

                workspace.DescendantAdded:Connect(function(instance)
                    if instance:IsA("Model") and instance.Name == "elkman" then
                        createBillboard(instance, "山羊人", Color3.new(128, 42, 42)) -- Change color as needed
                    end
                end)
            end

            monitorTree2()
            table.insert(_G.Tree2ESPInstances, esptable)
				
        else
            if EAT then
                for _, instance in pairs(_G.Tree2ESPInstances) do
                    for _, v in pairs(instance.doors) do
                        v.delete()
                    end
                end
                _G.Tree2ESPInstances = nil
            end
        end
end)
        
local leng666 = window:Tab("删除功能",'')

local Other = leng666:section("删除功能",true)

Other:Button("彻底删除红色眼睛",function()
 workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "smile" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "eyePrime" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
end)

Other:Button("彻底删除elkman",function()
 workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "smile" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "elkman" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
end)

Other:Button("彻底删除微笑",function()
 workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "smile" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "smilegui" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
end)

Other:Button("删除死亡时间",function()
game:GetService("ReplicatedStorage").SendGoatman:Destroy()
end)

Other:Button("删除smile/elkman/eyePrime",function()
workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "smile" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "elkman" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "smilegui" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "eyePrime" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant:Destroy()
        end
    end
end)
end)

Other:Button("删除worm",function()
game:GetService("ReplicatedStorage").SendWorm:Destroy()
end)

Other:Button("删除Rush",function()
game:GetService("ReplicatedStorage").Rush:Destroy()
end)

Other:Button("删除灯心草",function()
game:GetService("ReplicatedStorage").SendRush:Destroy()
end)

Other:Button("删除elkman",function()
game:GetService("ReplicatedStorage").elkman:Destroy()
end)

Other:Button("删除微笑太阳",function()
game:GetService("ReplicatedStorage").smilegui:Destroy()
end)

Other:Button("删除红色眼睛",function()
game:GetService("ReplicatedStorage").eyePrime:Destroy()
end)

Other:Button("删除计时器",function()
game:GetService("Players").LocalPlayer.PlayerGui.SpeedrunTimer.Timer:Destroy()
end)

Other:Button("删除核心",function()
game:GetService("Players").LocalPlayer.PlayerGui.PizzaTower.Base["it's pizza tower time"]:Destroy()
end)

local leng888 = window:Tab("修改数据(仅娱乐)",'')

local about = leng888:section("修改数据(仅娱乐 修改数据并非修改真实数据 而是修改本地玩家数据)",true)

about:Textbox("修改钥匙", "arg", "输入",function(arg)
    game:GetService("Players").LocalPlayer.Keys.Value = arg
end) 

about:Textbox("修改砖块", "arg", "输入",function(arg)
    game:GetService("Players").LocalPlayer.leaderstats.Bricks.Value = arg
end) 

about:Textbox("修改等级", "arg", "输入",function(arg)
    game:GetService("Players").LocalPlayer.LVL.Value = arg
end) 

about:Textbox("修改经验", "arg", "输入",function(arg)
    game:GetService("Players").LocalPlayer.XP.Value = arg
end) 

about:Textbox("修改倒计时时间", "arg", "输入",function(arg)
    workspace.DEATHTIMER.Value = arg
end) 