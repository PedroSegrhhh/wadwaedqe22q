local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Player = game.Players.LocalPlayer

-- Criação da GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local EnableButton = Instance.new("TextButton")
local RejoinButton = Instance.new("TextButton")
local RollbackFrame = Instance.new("Frame")
local EnableRollback = Instance.new("TextButton")
local rollbackEnabled = false

ScreenGui.Parent = game:GetService("CoreGui")  -- Usando CoreGui para maior visibilidade
ScreenGui.ResetOnSpawn = false

-- Main Frame
MainFrame.Size = UDim2.new(0, 350, 0, 200)
MainFrame.Position = UDim2.new(0.5, -175, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 2
MainFrame.Parent = ScreenGui

-- Título
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.Text = "Rollback GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Parent = MainFrame

-- Enable Button
EnableButton.Size = UDim2.new(0, 300, 0, 50)
EnableButton.Position = UDim2.new(0.5, -150, 0.3, 0)
EnableButton.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
EnableButton.Text = "Enable Rollback"
EnableButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableButton.TextScaled = true
EnableButton.Parent = MainFrame

-- Rejoin Button
RejoinButton.Size = UDim2.new(0, 300, 0, 50)
RejoinButton.Position = UDim2.new(0.5, -150, 0.7, 0)
RejoinButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
RejoinButton.Text = "Rejoin"
RejoinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinButton.TextScaled = true
RejoinButton.Parent = MainFrame

-- Rollback Frame
RollbackFrame.Size = UDim2.new(0, 300, 0, 60)
RollbackFrame.Position = UDim2.new(0.5, -150, 0.5, 0)
RollbackFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RollbackFrame.Visible = false
RollbackFrame.Parent = MainFrame

-- Enable Rollback Button
EnableRollback.Size = UDim2.new(0, 300, 0, 50)
EnableRollback.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
EnableRollback.Text = "Enable Rollback Function"
EnableRollback.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableRollback.TextScaled = true
EnableRollback.Parent = RollbackFrame

-- Função para Toggle do Rollback
EnableButton.MouseButton1Click:Connect(function()
    rollbackEnabled = not rollbackEnabled
    EnableButton.Text = rollbackEnabled and "Disable Rollback" or "Enable Rollback"
    RollbackFrame.Visible = rollbackEnabled
    if rollbackEnabled then
        -- Implementação do rollback (bloqueio de funções)
        for _, v in pairs(getgc(true)) do
            if typeof(v) == "function" and islclosure(v) then
                local name = getinfo(v).name or "unknown"
                if string.find(name:lower(), "passive") or string.find(name:lower(), "roll") then
                    hookfunction(v, function(...) return end)
                end
            end
        end
    end
end)

-- Função de Rejoin
RejoinButton.MouseButton1Click:Connect(function()
    wait(1)
    TeleportService:Teleport(game.PlaceId, Player)
end)

-- Função para abrir e fechar a interface
local dragging, dragStart, startPos
Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

Title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
