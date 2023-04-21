-- init
AFKAnsweringMachine.AnsweringMachine = {}

function AFKAnsweringMachine.AnsweringMachine.GetMessage(
    playerName,
    playerGender,
    playerClass,
    playerRace,
    playerLevel,
    playerManWoman,
    playerGuyGirl,
    playerHisHer,
    playerHeShe
)
    local playerSex = "girls"
    local faction = UnitFactionGroup("player")

    local hiddenCaller
    local capitalCity
    local helpdesk
    local locations = { 
        "The Molten Core",
        "The Maw",
        "Thorghast",
        "Blackwing Lair",
        "The Black Temple",
        "The Emerald Nightmare",
        "Magtheridon's Lair",
    }

    if (faction == "Horde") then
        capitalCity = "Orgrimmar"
        helpdesk = "Goblin"

        table.insert(locations, "Sylvanas' bedroom")
        table.insert(locations, "Thrall's bedroom")
        
        if (playerGender == "male") then
            hiddenCaller = "Gul'dan"
        else 
            hiddenCaller = "Sylvanas"
        end
    elseif faction == "Alliance" then
        table.insert(locations, "Jaina's bedroom")
        table.insert(locations, "Anduin's  bedroom")

        capitalCity = "Stormwind"
        helpdesk = "Gnome"

        if (playerGender == "male") then
            hiddenCaller = "Anduin"
        else 
            hiddenCaller = "Jaina"
        end
    else
        hiddenCaller = "Yettobedisclosed"
    end

    if (playerGender == "male") then
        helpdesk = "Pandaren"
        capitalCity = "Azeroth"
        local oppositeSex = "guys"
    end
    -- common

    local answeringMachineLines = {
        "Hello, this is ${playerName},... hello?.... yes? This is ${playerName}... hello? *click*.",
        "The person you have whispered is currently unavailable. Please try again later.",
        "Hello? Yes, this is ${hiddenCaller},.. ehh... shit.... I mean ${playerName}.",
        "I have nothing to say to you. So leave a message.",
        "Giving my goldfish a bath.", -- Sumana-Dunemaul, EU
        "Please leave a message. However, you have the right to remain silent. Everything you will whisper will be recorded and will be used against you.",
        "The person you're trying to reach Is no longer in service.",
        "Be back later, ${capitalCity} burning down",
        "Trying to find my keyboard keys i just smashefffff....",
        "Currently stroking many kittens to save Azeroth against the Jailer.",
        "NOT REPLYING, NOT REPLYING, NOT REPLYING! Ok..this is not me replying, but my answering machine.",
        "Hello. I'm ${playerName}'s answering machine. What are you?",
        "Hello. You are talking to a machine. I am capable of receiving messages. My owner does not need gold, a new weapon, windows, peace treaties, or a hot tub, and ${playerHisHer} carpets are clean. ${playerHeShe} give to charity through the office and don't need their picture taken. If you're still with me, leave your name and number and they will get back to you.",
        "WHO.... GOES... THERE?", -- Heavylight-Talnivarr, EU
        "Gave my laptop some tea but he didn’t like it.",
        "I can't type back right now because I have amnesia and I feel stupid talking to people I don't remember. I'd appreciate it if you could help me out by leaving my name and telling me something about myself. Thanks.",
        "Hi, this is ${playerName}. I'm sorry I can't whisper back right now. Leave a message, and then wait by your computer until I whisper you back.",
        "You're growing tired. Your eyelids are getting heavy. You feel very sleepy now. You are gradually losing your willpower and your ability to resist suggestions. When you hear the tone you will feel helplessly compelled to leave your name, BattleNet ID, password, and a message.",
        "As the void take hold, you feel you are losing your grip on reality. You begin to hallucinate. You see a telephone... WHAT, A TELEPHONE? DO THEY EVEN EXIST IN THIS REALITY? ... The telephone is next to an answering machine... You hear a faint click and a light flashes on the answering machine... You hear a beep...",
        "I don't exist at the moment, but if you leave your message, BattleNetID, password and phone number, and I’ll take your identity.. ehh.. I mean, get back in touch with you.",
        "I don't want to bore you with metaphysics, but how do you know this is an answering machine? Maybe it's a dream, or maybe it's an illusion, or maybe YOU don't really exist. One way to find out is to leave a message, and if it's reality, I will whisper you back.",
        "Hello, this is Zovaal, The Jailer. ${playerName} can't message you right now because HE'S DEAD! Leave your message and IF I decide to resurrect him, ${playerHeShe}’ll get back to you.",
        "You’re too late. The deadline for the ransom was one minute ago. ${playerName} is now gone with your gold and buying all the epics ${playerHeShe} likes from the Auction House. Kthxbye.",
        "Wrong password, You are now locked out of ${playerName}'s system. You will now be connected with a ${helpdesk} helpdesk member that may or may not scam you.",
        "Hello, this is an automated message saying that ${playerName} will be back when ${playerHeShe} is done being tortured in ${randomLocation}",
        "Gone fishing.",
        "I’m out of my mind... be back in five minutes!",
        "Hello, you are talking to a machine. I am capable of receiving messages. My owner does not need siding, windows or a tub, and ${playerHisHer} carpets are clean. They give to charity at ${randomLocation} and don’t need ${playerHisHer} picture taken. If you’re still with me, leave your name and BattleNetId and ${playerHeShe} will get back to you. ",
        "Now I lay myself down to sleep; Leave a message at the beep. If I die before I wake, Remember to erase the tape.",
        "This is a test. This is a test of the Answering Machine Broadcast System. This is only a test.",
        "Your message didn’t make it through ${playerName}'s urgency list. Goodbye.",
        "Hi! ${playerName}'s answering machine is broken. This is ${playerHisHer} refrigerator. Please type very slowly, and I’ll stick your message to myself with one of these magnets.",
        "Hi. I’m probably there, I’m just avoiding someone I don’t like. Leave me a message, and if I don’t get back, it’s you.",
        "Hi, you've reached the voicemail of ${playerName}. I'm currently exploring strange new worlds, so leave a message at the beep and I'll get back to you when I return from my mission.",
        "You've reached the office of Dr. ${playerName}. If you're calling to report a monster sighting, please leave a detailed description of the creature and its whereabouts.",
        "Hello, this is the official hotline for people who have trouble pronouncing the word 'onomatopoeia'. Please leave a message after the beep and we'll try to help you out.",
        "Thanks for calling the murloc sighting hotline. Unfortunately, all of our agents are currently busy probing murlocs. Please leave a message and we'll get back to you as soon as we're done.",
        "Welcome to the talk-to-a-plant hotline. If you're having trouble connecting with your indoor foliage, please leave a message and I'll arrange a consultation with a professional botanist.",
        "You've reached the voicemail of the world's most famous mime. Unfortunately, I can't talk right now, but if you leave a message, I'll respond with a silent but expressive pantomime.",
        "Greetings, adventurer. You've reached the voicemail of the mighty hero, ${playerName} of Azeroth. Unfortunately, I'm currently busy vanquishing demons and saving the world, so leave a message and I'll get back to you as soon as I've finished saving the day.",
        "You've reached the headquarters of the Murloc Liberation Front. If you're calling to report a sighting of Murloc oppression, please leave a message with the location and we'll send our team of freedom fighters to the rescue.",
        "You've reached the hotline for lost and found items in Azeroth. If you've lost a powerful artifact or just misplaced your favorite pair of boots, leave a message and we'll do our best to track it down for you.",
    }

    if (playerClass == "Mage") then
        table.insert(answeringMachineLines, "${playerName} is currently unavailable. in the kitchen cooking mana cakes.")
        table.insert(answeringMachineLines, "You've reached the hotline for emergency mage portals. If you're in a tight spot and need to teleport out of danger, leave a message with your coordinates and we'll open a portal for you faster than you can say 'teleportation'!")
    end

    if (playerClass == "Mage" and playerRace == "Gnome") then
        table.insert(answeringMachineLines, "Greetings, friend. You've reached the voicemail of the one and only gnome wizard extraordinaire. If you're calling about a magical mishap or just need some enchanting advice, leave a message and I'll get back to you faster than you can say abracadabra!") 
    end
    
    if (playerRace == "Goblin") then
        table.insert(answeringMachineLines, "Welcome to the hotline for exiled goblins. If you're a former member of the Bilgewater Cartel seeking refuge, leave a message and we'll arrange a clandestine meeting at a secret location.")
    end

    if (playerRace == "Gnome") then
        table.insert(answeringMachineLines, "Welcome to the hotline for gnome engineering. If you're in need of a new mechanical contraption or just want to discuss the latest innovations in gnome technology, leave a message and we'll tinker with it together!")
    end

    if (playerRace == "Scourge") then 
        table.insert(answeringMachineLines, "Greetings, mortal. You've reached the voicemail of the immortal and all-powerful Lich King. If you're calling to challenge me to a duel or just want to know the secrets of the undead, leave a message and I'll consider your request.")
    end

    if (playerClass == "Druid") then
        table.insert(answeringMachineLines, "${playerName} is currently prowled and wanted to avoid you. Unfortunately, you keep whispering this answering machine. This message will be deleted. Thank you. Goodbye!") -- Wildhuntz-Boulderfist
        table.insert(answeringMachineLines, "Welcome to the voicemail of wise druid ${playerName}. If you're looking for guidance in the ways of nature or just want to know how to grow a beautiful garden, leave a message and we'll show you the secrets of the forest.")
    end
    
    if (playerClass == "Hunter") then
        table.insert(answeringMachineLines, "${playerName} is taming some wild kitten. As it's a diligent task, ${playerHeShe} will be back later.") 
        table.insert(answeringMachineLines, "Welcome to the hotline for all your magical beast needs. If you need help finding a rare pet or just want to know more about the creatures of Azeroth, leave a message and we'll summon a magical menagerie for you to choose from!")
        table.insert(answeringMachineLines, "Greetings. You've reached the hotline for emergency healing. If you or your group are in need of a quick patch-up or just want to learn the art of healing spells, leave a message and we'll make sure you're back to full health in no time.")
    end

    if (playerClass == "Warlock") then
        table.insert(answeringMachineLines, "${playerName} is in some dimensional rift right now, speaking all weird words and all. Or... ${playerHeShe} is on its way to sacrifice you.")
        table.insert(answeringMachineLines, "Welcome to the hotline for all your infernal needs. If you're looking to summon demons or just want to learn the art of the darkest magic, leave a message and I'll make sure you're granted powers beyond your wildest nightmares.")
    end

    if (playerClass == "Warlock" or playerClass == "DeathKnight") then
        table.insert(answeringMachineLines, "You've reached the voicemail of the master of the undead. If you're looking to raise an army of skeletons or just want to learn the art of necromancy, leave a message and we'll show you the power of the shadow.")
    end

    if (playerClass == "Warrior") then
        table.insert(answeringMachineLines, "Greetings. You've reached the voicemail of the legendary swordmaster ${playerName}. If you need help honing your skills or just want to challenge me to a duel, leave a message and I'll answer your call to battle!")
        table.insert(answeringMachineLines, "Welcome to the hotline for all your berserking needs. If you need to tap into your inner fury or just want to learn the art of the rage, leave a message and we'll teach you how to go wild!")
    end

    if (playerClass == "Rogue") then
        table.insert(answeringMachineLines, "Welcome to the hotline for all your sneaky needs. If you need help slipping past your enemies or just want to learn the art of stealth, leave a message and we'll show you how to stay hidden in the shadows.")
        table.insert(answeringMachineLines, "You've reached the voicemail of the infamous pickpocket, ${playerName}. If you have a valuable target in mind or just want to know how to filch from unsuspecting victims, leave a message and we'll help you become a master thief.")
        table.insert(answeringMachineLines, "Psst. You've reached the hotline for assassination services. If you need help taking out a target or just want to learn the art of deadly poisons, leave a message and we'll ensure your success in your next mission!")
        table.insert(answeringMachineLines, "Uh, hey...it's the rogue. If you're into sneaking around and being awkward in social situations, leave a message and let's see if we can make each other feel uncomfortable.")
    end

    if (playerClass == "Paladin" or playerClass == "Priest") then
        table.insert(answeringMachineLines, "${playerName} is currently staring into an eclipse. Thinking the world going to be ending soon, including burning ${playerHisHer} eyes.")
        table.insert(answeringMachineLines, "Howdy. You've reached the hotline for smiting services. If you need help vanquishing evil or just want to learn the art of divine")
    end

    if (playerClass == "Priest") then
        table.insert(answeringMachineLines, "${playerName} is away touching other people and is already reported for this. For more allegations, please call 0800-touched-by-a-priest hotline.")
        table.insert(answeringMachineLines, "${playerName} is out for a seminar, learning how to avoid claims to the church, pretending brain damage.") 
    end

    if (playerClass == "Dracthyr") then
        table.insert(answeringMachineLines, "[screaming noises]..... ${playerName} is currently setting people on fire, ${playerHeShe} will get right back to you.")
        table.insert(answeringMachineLines, "An adventure isn't worth telling if there aren't any dragons in it. Right now, there's no dragon here. Find your own adventure instead!") 
        table.insert(answeringMachineLines, "People who do not believe in the existence of dragons are often eaten by dragons. So ${playerName} is not here. On it's way to eat you.") 
        table.insert(answeringMachineLines, "Always speak politely to an enraged dragon. Actually, rather just leave a message instead.") 
        table.insert(answeringMachineLines, "Draco dormiens nunquam titillandus.")
        table.insert(answeringMachineLines, "Hail, traveler. This is the hotline for all your dragon-related concerns. Whether you need help slaying a dragon or just want to chat with one, leave a message and we'll be in touch,...wait a minute!!!!, oh wait.. NOT HERE!")
    end
    
    -- randomize result
    local pickedLine = answeringMachineLines[fastrandom(1, #answeringMachineLines)]
    local randomLocation = locations[fastrandom(1, #locations)]

    return AFKAnsweringMachine.Helpers.parseText(
        pickedLine,
        {
            playerName = playerName,
            playerGender = playerGender,
            playerClass = playerClass,
            playerRace = playerRace,
            playerLevel = playerLevel,
            playerManWoman = playerManWoman,
            playerGuyGirl = playerGuyGirl,
            playerHisHer = playerHisHer,
            playerHeShe = playerHeShe,
            hiddenCaller = hiddenCaller,
            capitalCity = capitalCity,
            helpdesk = helpdesk,
            randomLocation = randomLocation
        }
    )
end

function AFKAnsweringMachine.AnsweringMachine.run()
    local prefix = "[Answering Machine]: "
    if (UnitIsAFK("player")) then
        local answeringMachineLine
        local playerName, playerGender, playerClass, playerRace, playerLevel = AFKAnsweringMachine.Helpers.GetPlayerInformation()

        local playerGuyGirl = AFKAnsweringMachine.Helpers.GetGuyGirl(playerGender)
        local playerManWoman = AFKAnsweringMachine.Helpers.GetManWoman(playerGender)
        local playerHisHer = AFKAnsweringMachine.Helpers.GetHisHer(playerGender)
        local playerHeShe = AFKAnsweringMachine.Helpers.GetHeShe(playerGender)
        
        local answeringMachineLine = prefix .. AFKAnsweringMachine.AnsweringMachine.GetMessage(
            playerName,
            playerGender,
            playerClass,
            playerRace,
            playerLevel,
            playerManWoman,
            playerGuyGirl,
            playerHisHer,
            playerHeShe
        )
        
        if (answeringMachineLine ~= nil) then
            SendChatMessage(answeringMachineLine, "AFK", nil, author)
            print(AFKAnsweringMachineMessageColor .. 'Message set to: \124r\124cffffcee2'.. answeringMachineLine)
        end
    end
end
