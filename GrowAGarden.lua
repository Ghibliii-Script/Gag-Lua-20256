local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "PetSpawnerGUI"

local SpawnButton = Instance.new("TextButton", ScreenGui)
SpawnButton.Size = UDim2.new(0, 200, 0, 50)
SpawnButton.Position = UDim2.new(0.5, -100, 0.9, -25)
SpawnButton.Text = "🧸 Spawn Pet"
SpawnButton.BackgroundColor3 = Color3.fromRGB(95, 193, 118)
SpawnButton.TextScaled = true
SpawnButton.TextColor3 = Color3.new(1, 1, 1)

-- Cooldown Variables
local canSpawn = true
local cooldownTime = 60 -- seconds

-- Fake Pet List
local pets = {"Dragonfly", "Raccoon", "Fennec Fox", "Disco Bee", "Queen Bee"}

-- Pet Spawner Function
local function spawnFakePet()
	if not canSpawn then return end
	canSpawn = false
	SpawnButton.Text = "⏳ Cooldown..."

	-- Fake Animation
	local pet = Instance.new("Part", workspace)
	pet.Anchored = true
	pet.CanCollide = false
	pet.Shape = Enum.PartType.Ball
	pet.Material = Enum.Material.Neon
	pet.Color = Color3.fromRGB(255, 200, 0)
	pet.Size = Vector3.new(2, 2, 2)
	pet.Position = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0) or Vector3.new(0,5,0)

	local Billboard = Instance.new("BillboardGui", pet)
	Billboard.Size = UDim2.new(0, 100, 0, 40)
	Billboard.StudsOffset = Vector3.new(0, 2, 0)
	Billboard.AlwaysOnTop = true

	local Label = Instance.new("TextLabel", Billboard)
	Label.Size = UDim2.new(1, 0, 1, 0)
	Label.BackgroundTransparency = 1
	Label.Text = "🐾 "..pets[math.random(1, #pets)]
	Label.TextScaled = true
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.Font = Enum.Font.FredokaOne

	-- Cooldown Timer
	task.wait(cooldownTime)
	canSpawn = true
	SpawnButton.Text = "🧸 Spawn Pet"
end

SpawnButton.MouseButton1Click:Connect(spawnFakePet)
