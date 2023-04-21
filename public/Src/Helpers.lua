AFKAnsweringMachine.Helpers = {}

function AFKAnsweringMachine.Helpers.parseText(s, tab)
  return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end

function AFKAnsweringMachine.Helpers.mergeTable(t1, t2)
    for i=1,#t2 do
      t1[#t1+1] = t2[i]
    end
    return t1
  end


function AFKAnsweringMachine.Helpers.GetHisHer(gender)
  if (gender == "male") then
    return "His"
  end

  return "Her"
end

function AFKAnsweringMachine.Helpers.GetHimHer(gender)
  if (gender == "male") then
    return "Him"
  end

  return "Her"
end


function AFKAnsweringMachine.Helpers.GetHeShe(gender)
  if (gender == "male") then
    return "he"
  end

  return "she"
end

function AFKAnsweringMachine.Helpers.GetSirMam(gender)
    if (gender == "male") then
        return "sir"
    end

    return "ma'm"
end

function AFKAnsweringMachine.Helpers.oppositeBfGf(gender)
    if (gender == "male") then
        return "girlfriend"
    end

    return "boyfriend"
end

function AFKAnsweringMachine.Helpers.GetGuyGirl(gender)
  if (gender == "male") then
    return "guy"
  end

  return "girl"
end

function AFKAnsweringMachine.Helpers.GetManWoman(gender)
    if (gender == "male") then
        return "man"
    end

    return "woman"
end

function AFKAnsweringMachine.Helpers.GetPoppaMomma(gender)
    if (gender == "male") then
        return "poppa"
    end

    return "momma"
end


local function getCharacterinfo(target)
    local genderTable = { "neuter or unknown", "male", "female" };
    local playerClass, englishClass, classIndex = UnitClass(target);
    local name, upName, level = UnitName(target)
    local unitLevel = UnitLevel(target)
    local gender = genderTable[UnitSex(target)]
    local race, raceEn = UnitRace(target);

    return name, gender, playerClass, race, unitLevel
end


function AFKAnsweringMachine.Helpers.GetTargetInformation()
  if(UnitName("target")) then
        return getCharacterinfo("target")
    end

    return nil
end

function AFKAnsweringMachine.Helpers.GetTargetInformationByUID(uid)
  local genderTable = { "neutral or unknown", "male", "female" };
  local targetClass, engClass, targetRace, engRace, gender, targetName, server = GetPlayerInfoByGUID(uid)
  local targetGender = genderTable[UnitSex(uid)]

  return targetName, targetGender, targetClass, targetRace
end

function AFKAnsweringMachine.Helpers.GetPlayerInformation()
    return getCharacterinfo("player")
end


function AFKAnsweringMachine.Helpers.tableContainsValue(table, val)
  for index, value in ipairs(table) do
      if value == val then
          return true
      end
  end

  return false
end

