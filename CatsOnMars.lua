--// Initialization
COM = {}
COM.Version = 1
COM.VersionName = "New Starts"
COM.Credits = "https://github.com/Xsotou"

COM.Settings = {
    ["credits"] = true,
    ["clear"] = true,
    ["unix"] = false,
    ["exclude"] = {}
}

--// Settings
COM.configure = function(RequestedEdit, RequestedValue)
    for Property,Value in next, COM.Settings do
        if Property == string.lower(RequestedEdit) then
            COM.Settings[Property] = RequestedValue
        end
    end
end

--// Initialize
COM.build = function(location)

    if COM.Settings["clear"] then
        if COM.Settings["unix"] then
            os.execute("clear")
        else
            os.execute("cls")
        end
    end

    COM.Clear = function(isUnix)
        --very unreliable, its probably better just to use sequence clearing
        if isUnix then
            os.execute("clear")
        else
            os.execute("cls")
        end
    end


    COM.Input = function(write)
        io.write(write)
        return io.read()
    end

    COM.FindTableItems = function(needle, haystack)
        local returnData = {}

        for _,value in next, haystack do
            if value == needle then
                table.insert(returnData, value)
            end
        end

        return returnData
    end

    COM.OnTableValues = function (items, callback)
        for _,Item in next, items do
            callback(Item)
        end
    end

    --// Credits
    if COM.Settings["credits"] == true then
        print("[BUILT CATS ON MARS]: Version " .. COM.Version .. " | " .. COM.VersionName .. "\n" .. COM.Credits .. "\n\n")
    end




    --// Build
    for _,Exclusion in next, COM.Settings["exclude"] do
        for Module, Callback in next, COM do
            if string.lower(Module) == string.lower(Exclusion) then
                COM[Module] = nil
            end
        end
    end
    
    setmetatable(COM, {
        __index = function(tab, module)
            return function()
                print("[COM] | This build does not contain a module called " .. module .. " (is nil). If you are using a custom build, ensure it is included. Otherwise, make sure all exclusions are handled appropriately and you have built correctly")
            end
        end
    })

    if location then location = COM end
end

return COM
