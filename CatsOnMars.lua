--// Initialization
COM = {}
COM.Version = 1
COM.VersionName = "New Starts"
COM.Credits = "https://github.com/Xsotou"

COM.Settings = {
    ["credits"] = true,
    ["clear"] = true
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
        os.execute("cls")
    end

    COM.Clear = function(isUnix)
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
    if location then location = COM end
end

return COM