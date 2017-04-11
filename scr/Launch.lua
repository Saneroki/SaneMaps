--
-- Created by IntelliJ IDEA.
-- User: Glenn @Saneroki [EU] Drescher
-- Date: 21/12/2016
-- Time: 19:39
--

----------------------------------------------------------------------------------
--  Initialize Defaults and Variables --
----------------------------------------------------------------------------------

SANE_Maps = SANE_Maps or {}
SANE_Maps.addonName = "SaneMaps"
SANE_Maps.addonVersion = 1.00


----------------------------------------------------------------------------------
-- Initialize --
----------------------------------------------------------------------------------
local function Initialize()
    
    SANE_Maps.OnChangeToWorldMap()


    -- Unregister Event
    EVENT_MANAGER:UnregisterForEvent(
        SANE_Maps.addonName, EVENT_ADD_ON_LOADED, OnAddOnLoaded)
end

local function OnAddOnLoaded(event, loadedAddon)
    if loadedAddon ~= SANE_Maps.addonName then return end
    Initialize()
end


----------------------------------------------------------------------------------
-- Register Events --
----------------------------------------------------------------------------------
EVENT_MANAGER:RegisterForEvent(SANE_Maps.addonName, EVENT_ADD_ON_LOADED, OnAddOnLoaded)