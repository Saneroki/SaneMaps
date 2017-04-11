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

function SANE_Maps.OnChangeToWorldMap()
    local isCapitalWayshrine = {
        [62] = true, -- Daggerfall
        [56] = true, -- Wayrest
        [55] = true, -- Rivenspire
        [43] = true, -- Sentinel
        [33] = true, -- Bangkorai
        [121] = true, -- Auridon
        [214] = true, -- Grahtwood
        [143] = true, -- Greenshade
        [162] = true, -- Reapers
        [67] = true, -- Ebonheart
        [28] = true, -- Deshaan
        [48] = true, -- Shadowfen
        [109] = true, -- The Rift
        [87] = true, -- Eastmarch
        [251] = true, -- Gold Coast
        [252] = true, -- Gold Coast
        [220] = true, -- Belkarth
        [215] = true, -- Eyévéa
        [255] = true, -- Hew's Bane
        [244] = true, -- Orsinium
        [177] = true, -- Vulkheel
        [142] = true, -- Khenarthi
        [102] = true, -- Malabal Tor
        [106] = true, -- Malabal Tor
        [65] = true, -- Malabal Tor
        [138] = true, -- Stros M'Kai
        [181] = true, -- Betnikh
        [172] = true, -- Bleakrock
    }

    local isTrial = {
        [230] = true, -- Hel-Ra
        [232] = true, -- Aetherian Archive
        [232] = true, -- Sanctum Ophidia
        [250] = true, -- Maelstrom Arena
        [270] = true, -- DragonStar Arena
    }

    local unownedHouse = "/esoui/art/icons/poi/poi_group_house_unowned.dds"
    local ownedHouse = "/esoui/art/icons/poi/poi_group_house_owned.dds"

    local original = GetFastTravelNodeInfo

    GetFastTravelNodeInfo = function(nodeIndex, ...)

        local known, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked = original(nodeIndex, ...)

        if GetMapType() == MAPTYPE_WORLD then

            if SV.hideTamriel then -- Everything
                return false, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked
            end

            if SV.hideTamrielWayhsrines == 1 and poiType == POI_TYPE_WAYSHRINE and not isCapitalWayshrine[nodeIndex] then -- Capital Wayshrines
                return false, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked
            elseif SV.hideTamrielWayhsrines == 2 and poiType == POI_TYPE_WAYSHRINE then -- All Wayshrines
                return false, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked
            end

            if SV.hideTamrielDungeons == 1 and poiType == POI_TYPE_GROUP_DUNGEON and not isTrial[nodeIndex] then -- All Trial
                return false, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked
            elseif SV.hideTamrielDungeons == 2 and poiType == POI_TYPE_GROUP_DUNGEON then -- All Dungeons
                return false, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked
            end

            if SV.ownedHouses == 1 and poiType == POI_TYPE_HOUSE and icon == ownedHouse then
                return false, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked
            end

            if SV.unownedHouses == 1 and poiType == POI_TYPE_HOUSE and icon == unownedHouse then
                return false, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked
            end

        end

        if SV.ownedHouses == 2 and poiType == POI_TYPE_HOUSE and icon == ownedHouse then
            return false, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked
        end

        if SV.unownedHouses == 2 and poiType == POI_TYPE_HOUSE and icon == unownedHouse then
            return false, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked
        end

        return known, name, normalizedX, normalizedY, icon, glowIcon, poiType, isShownInCurrentMap, linkedCollectibleIsLocked

    end
end
