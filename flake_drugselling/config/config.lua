Config = {}

Config.ESXgetSharedObject = 'es_extended'
Config.QBCoreGetCoreObject = 'qb-core'
Config.NpcFightOnReject = true
Config.RejectionChance = 40
Config.System = 'ox_target'  -- 'textui' | 'ox_target' | 'qb-target'

Config.QBoxVehicleFix = false -- true = to fix the giving vehicle issue with QBox ONLY. (leave it false if you don't use QBox)

Config.Debug = false -- Enable debug commands (testcarlevelup, testitemlevelup, testrankup)

--#Command
Config.Commands = {
    enable = true,
    startcommands = { 'drugsell' },
    stopcommand = "stopdrugsell",
    leaderboard = "trapleaderboard"  -- Command to open leaderboard
}


Config.UIcolor = "#0e99f7"

--#Leaderboard Settings
Config.Leaderboard = {
    title = "TOP HOODVILLE DEALERS",
    subtitle = "Top drug dealers ranking by total XP",
    headerImage = "https://i.imgur.com/yq4yoYz.png",
    seasonText = "📅 CURRENT SEASON: Summer 2026"
}

--#Item
Config.SalesItem = {
    enable = false,
    phoneitem = 'trapphone'
}

--#Movement Settings
Config.Movement = {
    maxdistance = 100.0
}

--#Currency
Config.Account = {
    type = 'account',
    payment = 'black_money'
}

Config.SkillCheck = {
    enabled = false,
    chance = 25,
    difficulties = {'easy'},
    keys = {'e', 'd'}
}

--#Auto Sell Settings
Config.AutoSell = {
    enabled = false,
    delay = 1500,
}

--#Required Sells
Config.CopRequired = 0

--#Blacklisted Jobs
Config.BlacklistedJobs = {
    'police',
    'ambulance',
}

Config.RobberyChance = {
    base          = 8,
    autoSellBonus = 20,
}

Config.SellList = {
    ['crack1g'] = {
        label = 'Coke pooch',
        quantity = {min = 1, max = 5},
        price = {min = 790, max = 960},
        reject = 5,
        addpoints = 500,
    },
    ['meth_pooch'] = {
        label = 'meth pooch',
        quantity = {min = 1, max = 5},
        price = {min = 740, max = 860},
        reject = 5,
        addpoints = 100,
    },
    ['sugarrush'] = {
        label = 'Sugar Rush',
        quantity = {min = 1, max = 5},
        price = {min = 840, max = 960},
        reject = 5,
        addpoints = 100,
    },
    ['dolldust'] = {
        label = 'Doll Dust',
        quantity = {min = 1, max = 5},
        price = {min = 840, max = 1060},
        reject = 5,
        addpoints = 100,
    },
}

--#Restricted Selling Zones
Config.RestrictedZones = {
    enabled = false,
    zones = {
        {
            name = "Grove Street",
            coords = vector3(1375.609, -741.0916, 67.232),
            radius = 50.0,
        },
        {
            name = "Davis",
            coords = vector3(278.6338, -1949.548, 22.79),
            radius = 60.0,
        },
    }
}

Config.BonusAreas = {
    {
        coords = vector3(1375.609, -741.0916, 67.232),
        radius = 28.0,
        quantity = {min = 4, max = 6},
        multiplier = {min = 1.25, max = 1.50},
    },
    {
        coords = vector3(278.6338, -1949.548, 22.79),
        radius = 48.0,
        quantity = {min = 4, max = 6},
        multiplier = {min = 1.25, max = 1.50},
    },
}


Config.DealerRank = 'traprank'
Config.Ranks = {
    -- ── EARLY GAME ────────────────────────────────────────────
    [1]  = { points = 1000,    percentmore = 0,  label = 'Corner Boy' },
    [2]  = { points = 2500,    percentmore = 2,  label = 'Street Peddler',  rewards = { type = 'item',  reward = { 'armour',      amount = 1  } } },
    [3]  = { points = 5000,    percentmore = 3,  label = 'Nickel Bagger',   rewards = { type = 'item',  reward = { 'lockpick',    amount = 3  } } },
    [4]  = { points = 8000,    percentmore = 4,  label = 'Block Runner',    rewards = { type = 'item',  reward = { 'phone',       amount = 1  } } },
    [5]  = { points = 12000,   percentmore = 5,  label = 'Trapper',         rewards = { type = 'car',   reward = 'sultan'                      } },

    -- ── MID TIER ──────────────────────────────────────────────
    [6]  = { points = 17000,   percentmore = 6,  label = 'Hustler',         rewards = { type = 'item',  reward = { 'armour',      amount = 2  } } },
    [7]  = { points = 23000,   percentmore = 7,  label = 'Trap Star',       rewards = { type = 'item',  reward = { 'weapon_bat',  amount = 1  } } },
    [8]  = { points = 30000,   percentmore = 8,  label = 'Plug',            rewards = { type = 'car',   reward = 'schafter2'                   } },
    [9]  = { points = 38000,   percentmore = 9,  label = 'Slanger',         rewards = { type = 'item',  reward = { 'lockpick',    amount = 5  } } },
    [10] = { points = 47000,   percentmore = 10, label = 'Road Runner',     rewards = { type = 'item',  reward = { 'armour',      amount = 3  } } },

    -- ── RISING ────────────────────────────────────────────────
    [11] = { points = 57000,   percentmore = 11, label = 'D-Boy',           rewards = { type = 'car',   reward = 'baller'                      } },
    [12] = { points = 68000,   percentmore = 12, label = 'Flipper',         rewards = { type = 'item',  reward = { 'armour',      amount = 4  } } },
    [13] = { points = 80000,   percentmore = 13, label = 'Weight Mover',    rewards = { type = 'item',  reward = { 'lockpick',    amount = 8  } } },
    [14] = { points = 93000,   percentmore = 14, label = 'Block Boss',      rewards = { type = 'car',   reward = 'exemplar'                    } },
    [15] = { points = 107000,  percentmore = 15, label = 'Connect',         rewards = { type = 'item',  reward = { 'armour',      amount = 5  } } },

    -- ── UPPER ECHELON ─────────────────────────────────────────
    [16] = { points = 122000,  percentmore = 16, label = 'Middleman',       rewards = { type = 'car',   reward = 'elegy2'                      } },
    [17] = { points = 138000,  percentmore = 17, label = 'Corner King',     rewards = { type = 'item',  reward = { 'armour',      amount = 6  } } },
    [18] = { points = 155000,  percentmore = 18, label = 'Hood Legend',     rewards = { type = 'item',  reward = { 'lockpick',    amount = 10 } } },
    [19] = { points = 173000,  percentmore = 19, label = 'Street General',  rewards = { type = 'car',   reward = 'sultan2'                     } },
    [20] = { points = 192000,  percentmore = 20, label = 'OG',              rewards = { type = 'item',  reward = { 'armour',      amount = 8  } } },

    -- ── ELITE ─────────────────────────────────────────────────
    [21] = { points = 215000,  percentmore = 21, label = 'Underboss',       rewards = { type = 'car',   reward = 'zentorno'                    } },
    [22] = { points = 240000,  percentmore = 22, label = 'Street Czar',     rewards = { type = 'item',  reward = { 'armour',      amount = 10 } } },
    [23] = { points = 268000,  percentmore = 23, label = 'Narco',           rewards = { type = 'item',  reward = { 'lockpick',    amount = 15 } } },
    [24] = { points = 298000,  percentmore = 24, label = 'Cartel Boss',     rewards = { type = 'car',   reward = 'nero'                        } },
    [25] = { points = 330000,  percentmore = 25, label = 'Trap God',        rewards = { type = 'item',  reward = { 'armour',      amount = 12 } } },

    -- ── PRESTIGE ──────────────────────────────────────────────
    [26] = { points = 375000,  percentmore = 27, label = 'Kingpin',         rewards = { type = 'car',   reward = 'osiris'                      } },
    [27] = { points = 430000,  percentmore = 30, label = 'Drug Lord',       rewards = { type = 'item',  reward = { 'armour',      amount = 15 } } },
    [28] = { points = 500000,  percentmore = 35, label = 'El Jefe',         rewards = { type = 'car',   reward = 'tyrus'                       } },
}

Config.NpcFightOnReject = true
Config.RejectionChance = 40

Config.Discord = {
    botName = 'Drug Leaderboard',
    botAvatar = 'https://r2.fivemanage.com/iXlkbXHVCnElhfGg0KkbF/mercury_pfp.gif',
    updateInterval = 3600000,
    embedColor = 1329051, -- HoodVille blue (#144B9B in decimal)
    title = '🏆 Top 10 HoodVille Drug Dealers',
    description = 'Here are the top 10 players based on their drug selling experience!',
    thumbnail = nil,
    footer = 'Updated automatically Every Hour',
    footerIcon = nil
}

Config.PedList = {
    [1] = 'g_m_importexport_01',
    [2] = 'g_m_y_ballaeast_01',
    [3] = 'g_m_y_ballaorig_01',
    [4] = 'g_m_y_azteca_01',
    [5] = 'g_m_y_armgoon_02',
    [6] = 'g_m_y_famdnf_01',
    [7] = 'g_m_y_famca_01',
    [8] = 'g_m_y_ballasout_01',
    [9] = 'g_m_y_mexgoon_02',
    [10] = 'g_m_y_salvaboss_01',
}

Config.SpawnCloseMin = 15.0
Config.SpawnCloseMax = 25.0
Config.SpawnFarMin   = 35.0
Config.SpawnFarMax   = 55.0
Config.SpawnWaypointMaxSnapOffLine = 25.0