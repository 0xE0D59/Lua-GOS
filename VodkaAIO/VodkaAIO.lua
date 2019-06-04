local VodkaAIOVersion = 0;
do
    if _G.VodkaAIOLoaded == true then return end
    _G.GamsteronAIOLoaded = true
    
    local VodkaAIOLoaded =
    {
        ["Garen"] = true,
    }
    if not SUPPORTED_CHAMPIONS[myHero.charName] then
        print("VodkaAIO - " .. myHero.charName .. " is not supported. Exiting.")
        return
    end
    
    if not FileExist(COMMON_PATH .. "GamsteronCore.lua") then
        DownloadFileAsync("https://raw.githubusercontent.com/gamsteron/GOS-External/master/Common/GamsteronCore.lua", COMMON_PATH .. "GamsteronCore.lua", function() end)
        while not FileExist(COMMON_PATH .. "GamsteronCore.lua") do end
    end
    
    if not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") then
        DownloadFileAsync("https://raw.githubusercontent.com/gamsteron/GOS-External/master/Common/GamsteronPrediction.lua", COMMON_PATH .. "GamsteronPrediction.lua", function() end)
        while not FileExist(COMMON_PATH .. "GamsteronPrediction.lua") do end
    end
    
    require('GamsteronPrediction')
    if _G.GamsteronPredictionUpdated then
        return
    end
    
    require('GamsteronCore')
    if _G.GamsteronCoreUpdated then return end
    LocalCore = _G.GamsteronCore
    
    local success, version = LocalCore:AutoUpdate({
        version = GamsteronAIOVer,
        scriptPath = SCRIPT_PATH .. "GamsteronAIO.lua",
        scriptUrl = "https://raw.githubusercontent.com/0xE0D59/Lua-GOS/master/VodkaAIO/VodkaAIO.lua",
        versionPath = SCRIPT_PATH .. "GamsteronAIO.version",
        versionUrl = "https://raw.githubusercontent.com/0xE0D59/Lua-GOS/master/VodkaAIO/VodkaAIO.version"
    })
    if success then
        print("VodkaAIO updated to version " .. version .. ". Please Reload with 2x F6 !")
        _G.GamsteronAIOUpdated = true
        return
    end
end