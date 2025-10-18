local function send(webhook, body)
        local response = http(
            webhook, 
            "POST", 
            {["Content-Type"] = "application/json"},
            jsonEncode({content = tostring(body)})
        )
        if response then
            if response.StatusCode ~= 204 then
                alert("Error, code : "..tostring(response.StatusCode))
            end
        end
    end
    
local states_914 ={
    is_transforming = false,
    entry = false,
    output = false,
    state_switcher =  0,--0 = Rough, 1 = coarse, 2 = 1:1, 3 =Fine, 4 = Very FIne
    state_direction = 1,
    can_switch = true
}

local recipes_914 = {
    rough = {
        Pistol = {
            {"Pistol"},
            {"Metal Shard§"}
        }
    }
}
local function Chose_item(item, mode)
    if recipes_914[mode] and recipes_914[mode][item] then 
        local index = #recipes_914[mode][item]
        local randomized = math.random(1,index)
        if index == 1 then return recipes_914[mode][item][1][1] end
        return recipes_914[mode][item][randomized][1]

    end
end
local function custom_tool(tool_name)
    if tool_name == "Metal Shard" then
        local Tool = Instance.new("Tool")
        Tool.CanBeDropped = false
        Tool.Name = "Metal Shard"
        local origin = f("MetalShardTemplate")
        title(tostring(origin))
        local Part = Instance.new("Part")
        Part.Name = "Handle"
        Part.Anchored = true
        Part.CanCollide = false
        Part.CFrame = CFrame.new(999, 9999, 999)

        local mesh = Instance.new("SpecialMesh")
        mesh.MeshId = "rbxassetid://14777367540"     
        mesh.TextureId = "rbxassetid://6909153579"   
        mesh.Scale = Vector3.new(0.05,0.05,0.05)
        mesh.Parent = Part
        f(Tool)
        Part.Parent = Tool
        
        return Tool
    end
end
local function Tween914(to_tween)
    if to_tween == "914-Input-Close" then
        local door_reach = f("914-DoorRepereTweenInputUp")
        local door = f("914-DoorTweenInput")
        local tween_infos = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        if door_reach then tween(door, tween_infos, {CFrame = door_reach.CFrame}) else announce("ERROR : Tweening (missing part) in 'close input'") end
    elseif to_tween == "914-Input-Open" then
        local door_reach = f("914-DoorRepereTweenInputDown")
        local door = f("914-DoorTweenInput")
        local tween_infos = TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        if door_reach then tween(door, tween_infos, {CFrame = door_reach.CFrame}) else announce("ERROR : Tweening (missing part) in 'open input'") end
    elseif to_tween == "914-Output-Close" then
        local door_reach = f("914-DoorRepereTweenOutputUp")    
        local door = f("914-DoorTweenOutput")
        local tween_infos = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        if door_reach then tween(door, tween_infos, {CFrame = door_reach.CFrame}) else announce("ERROR : Tweening (missing part) in 'open output'") end
    elseif to_tween == "914-Output-Open" then
        local door_reach = f("914-DoorRepereTweenOutputDown")    
        local door = f("914-DoorTweenOutput")
        local tween_infos = TweenInfo.new(0.7, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        if door_reach then tween(door, tween_infos, {CFrame = door_reach.CFrame}) else announce("ERROR : Tweening (missing part) in 'open output'") end
        
    end
end
local function Tween914_Switcher(to_tween)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://2967472576"
    Sound.Parent = f("914-Switcher")
    Sound.Volume = 1
    subtitle(to_tween)
    local door_reach
    if to_tween == 0 then door_reach = f("914-SwR-Rough")
    elseif to_tween == 1 then door_reach = f("914-SwR-Coarse")
    elseif to_tween == 2 then door_reach = f("914-SwR-11")
    elseif to_tween == 3 then door_reach = f("914-SwR-Fine")
    elseif to_tween == 4 then door_reach = f("914-SwR-VFine")
    end
    local door = f("914-Switcher")
    local tween_infos = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
    if door_reach then tween(door, tween_infos, {CFrame = door_reach.CFrame}) else announce("ERROR : Tweening (missing part) in 'Switcher' ("..door_reach.."), to_tween :"..to_tween) end
    
    playSound(Sound)
end
local function AnimateCog(cog)
    local door = f(cog)
    local targetCFrame = CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
    local goal = {CFrame = door.CFrame * targetCFrame}
    local tween_infos = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 2)
    for i = 1, 3 do
        tween(door, tween_infos, goal)
        task.wait(1)
    end
end
    
    
    
event("interaction", function(Data)
    local Interaction = Data.Value[2]
    local Player = Data.Value[1]
    if Interaction == "914-Entrance" and not states_914.entry then
        -- local repetitionCoro = coroutine.create(AnimateCog("torotate"))
        AnimateCog("torotate")
        announce("Cog")
        local items = getPlayerCurrentTool(Player)
        if items then
            
            Tween914("914-Input-Close")
            removeTool(Player, items)
            states_914.entry = items
            
        end 
    end
    if Interaction == "914-Start" and states_914.entry and not states_914.output then
        local item_chosed = Chose_item(states_914.entry, "rough")
        states_914.is_transforming = true
        states_914.entry = false
        states_914.output = item_chosed
        Tween914("914-Output-Close")
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://9069008195"
        Sound.Parent = f("914-Starter")
        Sound.Volume = 1
        playSound(Sound)
        task.wait(13)
        Tween914("914-Output-Open")
        task.wait(3)
        Tween914("914-Input-Open")
    end
    if Interaction == "914-SwitcherPart" then
        if states_914.state_switcher >= 4 then states_914.state_direction = -1
        elseif states_914.state_switcher <= 0 then states_914.state_direction = 1 end
        states_914.state_switcher = states_914.state_switcher +  states_914.state_direction
        Tween914_Switcher(states_914.state_switcher)
    end
    if Interaction == "914-Output" and states_914.output then
        local string_cut = states_914.output:split("§")
        if #string_cut == 1 then
            giveTool(Player, string_cut[1])
        else
            giveTool(Player,custom_tool(string_cut[1]))
        end 
        states_914.output = false

    end
end
)
Tween914("914-Input-Open")
Tween914("914-Output-Open")
