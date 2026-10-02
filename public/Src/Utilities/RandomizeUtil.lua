-- Shared randomization utility for contextual cycling
AFKAnsweringMachine.RandomizeUtil = {}

local contextStates = {}

-- Get a randomized item from a data table with intelligent cycling
-- @param contextKey - unique identifier (e.g., "compliment_prefix", "flirt_message")
-- @param dataTable - array to pick from
-- @param contextSalt - value that resets cycling when context changes (e.g., targetName, targetGender)
-- @return randomly selected item from dataTable (must be <= 254 characters)
function AFKAnsweringMachine.RandomizeUtil.GetRandomized(contextKey, dataTable, contextSalt)
    if not dataTable or #dataTable == 0 then
        return nil
    end

    if not contextStates[contextKey] then
        contextStates[contextKey] = {
            lastIndex = 0,
            lastSalt = contextSalt
        }
    end

    local state = contextStates[contextKey]

    -- Reset cycling if context changed
    if state.lastSalt ~= contextSalt then
        state.lastIndex = 0
        state.lastSalt = contextSalt
    end

    -- Cycle through items with intelligent randomization
    -- Not purely sequential (+1), but weighted toward moving forward
    local nextIndex
    if #dataTable == 1 then
        nextIndex = 1
    else
        local rand = math.random()
        if rand < 0.6 then
            -- 60% chance: move to next item in cycle
            nextIndex = (state.lastIndex % #dataTable) + 1
        elseif rand < 0.9 then
            -- 30% chance: jump to a random item
            nextIndex = math.random(1, #dataTable)
        else
            -- 10% chance: skip one and go to the one after
            nextIndex = ((state.lastIndex + 1) % #dataTable) + 1
        end
    end

    -- Cycle to next message if current one exceeds 254 characters
    local maxLength = 254
    local attempts = 0
    while #dataTable[nextIndex] > maxLength and attempts < #dataTable do
        nextIndex = (nextIndex % #dataTable) + 1
        attempts = attempts + 1
    end

    state.lastIndex = nextIndex
    return dataTable[nextIndex]
end

-- Reset all context states (useful when restarting interactions)
function AFKAnsweringMachine.RandomizeUtil.ResetAll()
    contextStates = {}
end

-- Reset a specific context
function AFKAnsweringMachine.RandomizeUtil.ResetContext(contextKey)
    contextStates[contextKey] = nil
end
