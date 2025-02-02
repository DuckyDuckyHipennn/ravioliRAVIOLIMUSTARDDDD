loadstring(game:HttpGet('https://raw.githubusercontent.com/zealonsz/m1reset/refs/heads/main/m1resetscript.luau'))();

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService('RunService')

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:FindFirstChildOfClass("Animator")

-- Animation IDs to check
local animationIds = {
    "rbxassetid://10480796021",
    "rbxassetid://10480793962",
    "rbxassetid://10491993682"
}

-- Function to stop animations after a delay
local function stopAnimations()
    task.wait(0.02) -- 0.02-second delay
    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
        if table.find(animationIds, track.Animation.AnimationId) then
            track:Stop()
	    warn('Stopped ANIMATION')
        end
    end
end

-- Detect key press
RunService.Heartbeat:Connect(function(dt)
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == Enum.KeyCode.T then
			stopAnimations()
		end
	end)
end)
