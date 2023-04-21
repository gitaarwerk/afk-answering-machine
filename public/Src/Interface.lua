AFKAnsweringMachine = {}
AFKAnsweringMachineMessageColor = "\124cffff4f98";

function dump(o)
    if type(o) == 'table' then
        local s = '{ ';
        for k,v in pairs(o) do
                if type(k) ~= 'number' then k = '"'..k..'"' end
                s = s .. '['..k..'] = ' .. dump(v) .. ',';
        end
        return s .. '} ';
    else
        return tostring(o);
    end
end

function debugPrint(feature, message)
    if (not(AFKAnsweringMachineVars)) then
        return;
    end
    
    if (AFKAnsweringMachineVars.debugMode == true) then
        local featName = feature or "feature_not_set";
        local prefix = "[EYELF_DEBUG (" .. feature .. ")] ";
        print(prefix .. message);
    end
  end

function AFKAnsweringMachine_AnsweringMachineOn()
    AFKAnsweringMachineVars.answeringMachineIsOn = true
end

function AFKAnsweringMachine_AnsweringMachineOff()
    AFKAnsweringMachineVars.answeringMachineIsOn = false
end

function AFKAnsweringMachine_DebugOn()
    print('Express Your Elf: Debug mode is now ON.')
    AFKAnsweringMachineVars.debugMode = true
end

function AFKAnsweringMachine_DebugOff()
    print('Express Your Elf: Debug mode is now OFF.')
    AFKAnsweringMachineVars.debugMode = false
end


local function AFKAnsweringMachine_Init(msg)
    -- pattern matching that skips leading whitespace and whitespace between cmd and args
    -- any whitespace at end of args is retained
    local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")

    if cmd == "debug" then
        if (AFKAnsweringMachineVars and AFKAnsweringMachineVars.debugMode) then 
            AFKAnsweringMachine_DebugOff();
            return;
        end

        if (not (AFKAnsweringMachineVars) or AFKAnsweringMachineVars and AFKAnsweringMachineVars.debugMode == false) then 
            AFKAnsweringMachine_DebugOn();
        end
        local dumpedVars = dump(AFKAnsweringMachineVars);
        print("Dumped EYELF Vars: " .. dumpedVars);
    else
        AFKAnsweringMachine_ConfigScreen:Show();
        -- If not handled above, display some sort of help message
        print("To show or hide the button; interface, use one of these commands:");
        print("Syntax: /afkam show");
        print("Syntax: /afkam hide");
        print("", "And to reset the vars");
        print("Syntax: /afkam reset");
    end
end

SlashCmdList["AFKAM"] = AFKAnsweringMachine_Init;

SLASH_EYELF1 = "/afkam"
SLASH_EYELF2 = "/AFKAnsweringMachine"
