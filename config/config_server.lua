CONFIG                     = CONFIG or {}

local sharedGoldCurrencyFlag <const> = CONFIG.USE_GOLD_CURRENCY
local sharedPesosCurrencyFlag <const> = CONFIG.USE_PESOS_CURRENCY

CONFIG.USE_GOLD_CURRENCY_SERVER = false -- server toggle for gold actions
CONFIG.USE_GOLD_CURRENCY   = CONFIG.USE_GOLD_CURRENCY_SERVER
CONFIG.USE_PESOS_CURRENCY_SERVER = false -- server toggle for pesos actions
CONFIG.USE_PESOS_CURRENCY  = CONFIG.USE_PESOS_CURRENCY_SERVER

if sharedGoldCurrencyFlag ~= nil and sharedGoldCurrencyFlag ~= CONFIG.USE_GOLD_CURRENCY then
    print("^3[vorp_inventory]^7 USE_GOLD_CURRENCY mismatch: config/config.lua=" .. tostring(sharedGoldCurrencyFlag) .. " config/config_server.lua=" .. tostring(CONFIG.USE_GOLD_CURRENCY) .. ". Server value is used for backend actions.")
end

if sharedPesosCurrencyFlag ~= nil and sharedPesosCurrencyFlag ~= CONFIG.USE_PESOS_CURRENCY then
    print("^3[vorp_inventory]^7 USE_PESOS_CURRENCY mismatch: config/config.lua=" .. tostring(sharedPesosCurrencyFlag) .. " config/config_server.lua=" .. tostring(CONFIG.USE_PESOS_CURRENCY) .. ". Server value is used for backend actions.")
end

-- TO USE THE OPEN SADLE BUTTON ADD YOUR STABLE LOGIC HERE
-- this is a server side function
-- BY DEFAULT ITS USING VORP STABLES
CONFIG.OPEN_SADDLE         = function(charid, model, entity, netid)
    local id = ("%s_%s"):format(model, charid)
    return id -- return the inventory id here
end

CONFIG.NEW_PLAYER          = {
    ALLOW_ACTIONS = {
        ENABLE = false, -- if true, new players can give money or items to other players
        COOLDOWN = 300, -- in seconds 5m by default
    },
    START_ITEMS = {
        consumable_raspberrywater = 2, -- ITEMS SAME NAME AS IN DATABASE
        ammorevolvernormal = 1         -- AMMO SAME NAME AS IN THE DATABASE
    },
    START_WEAPONS = {
        "WEAPON_MELEE_KNIFE" -- WEAPON NAME
    }
}

CONFIG.DELETE_ITEM_EXPIRED = false -- if true items on use that are expired will be deleted (only works for items with degradation)

CONFIG.PICKUPS             = {

    USE_TIMER = false,      -- if true it will add timer to delete pickups
    TIMER = 10,             -- after this time pick up wll be deleted, IN MINUTES
    DELETE_ON_DROP = false, -- if true then dropping items only deletes from inventory and box on the floor is not created
}

-- HOW MANY WEAPONS ALLOWED PER PLAYER FOR ITEMS IS IN VORP CORE CONFIG
CONFIG.MAX_WEAPONS         = {
    PLAYERS   = 10,
    JOBS      = { -- leave empty to use the players amount
        police = 10,
    },
    -- Items that dont get added up torwards your max weapon count meaning you can carry as many as you want
    WHITELIST = {
        WEAPON_KIT_BINOCULARS_IMPROVED = true,
        WEAPON_KIT_BINOCULARS = true,
        WEAPON_FISHINGROD = true,
        WEAPON_KIT_CAMERA = true,
        WEAPON_KIT_CAMERA_ADVANCED = true,
        WEAPON_MELEE_LANTERN = true,
        WEAPON_MELEE_DAVY_LANTERN = true,
        WEAPON_MELEE_LANTERN_HALLOWEEN = true,
        WEAPON_KIT_METAL_DETECTOR = true,
        WEAPON_MELEE_HAMMER = true,
        WEAPON_MELEE_KNIFE = true,
    }
}


CONFIG.PLAYER_RESPAWN = {
    --- VORP CURRENCY ---
    MONEY = {
        ENABLE     = false, -- if true then the money will be cleared on player respawn
        JOB_LOCK   = {      -- Wont remove from these jobs
            police = true,
            doctor = true
        },
        PERCENTAGE = 1.0, -- 0.1 = 10% of money 1.0 = 100% of money
    },
    PESOS = {
        ENABLE     = false,
        JOB_LOCK   = {
            police = true,
            doctor = true
        },
        PERCENTAGE = 1.0,
    },
    GOLD = {
        ENABLE     = false,
        JOB_LOCK   = {
            police = true,
            doctor = true
        },
        PERCENTAGE = 1.0,
    },
    ROLL = {
        ENABLE     = false,
        JOB_LOCK   = {
            police = true,
            doctor = true
        },
        PERCENTAGE = 1.0,
    },
    ---
    ITEMS = {
        ENABLE    = false,
        JOB_LOCK  = {
            police = true,
            doctor = true
        },
        ALL       = true, -- deletes all items instead of just the whitelist
        WHITELIST = {
            consumable_raspberrywater = true,
            ammorevolvernormal = true
        },
    },

    WEAPONS = {
        ENABLE    = false,
        JOB_LOCK  = {
            police = true,
            doctor = true
        },
        ALL       = true, -- deletes all weapons instead of just the whitelist
        WHITELIST = {
            WEAPON_MELEE_KNIFE = true,
            WEAPON_BOW = true
        },

    },

    AMMO = {
        ENABLE   = false, -- if true then the ammo will be cleared on player respawn
        JOB_LOCK = {
            police = true,
            doctor = true
        },
    },
}

CONFIG.LOGS           = {

    -- MAIN INVENTORY LOGS
    webhookname             = "INVENTORY LOGS", -- webhook name
    webhook                 = "",               -- webhook url

    --Gold Logs Color
    colorpickedgold         = 65280,
    colorgiveGold           = 4286945,
    colorDropGold           = 16711680,

    --Money log color
    colorgiveMoney          = 4286945,
    colormoneypickup        = 65280,
    colorDropMoney          = 16711680,

    --Pesos log color
    colorgivePesos          = 4286945,
    colorpesospickup        = 65280,
    colorDropPesos          = 16711680,

    --Item log color
    coloritemDrop           = 16711680,
    coloritempickup         = 65280,
    colorgiveitem           = 4286945,

    --Weapon log color
    colorweppickupd         = 65280,
    colorgiveWep            = 4286945,
    colordropedwep          = 16711680,

    -- CUSTOM INVENTORY LOGS

    cuscolor                = 16711680,
    custitle                = "CUSTOM INV LOGS",
    cusavatar               = "",
    cuslogo                 = "",
    cusfooterlogo           = "",
    cuswebhookname          = "CUSTOM INV LOGS",
    CustomInventoryTakeFrom = "", -- webhook url
    CustomInventoryMoveTo   = "", -- webhook url


    NetDupWebHook = {
        -- somone tries to use dev tools to cheat
        Active = true,
        color = 16711680,
        webhook = "", -- webhook url
        Language = {
            title = "Possible Cheater Detected",
            descriptionstart = "Invalid NUI Callback performed by...\n **Playername** `",
            descriptionend = "`\n"
        }
    },

}
