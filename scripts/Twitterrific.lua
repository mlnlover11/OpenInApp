functions[#functions+1] = function(url)
    local username = url:gmatch("twitter.com/([%w_]+)")() -- extract username
    local _, ext = url:gmatch("twitter.com/([%w_]+)(/.+)")() -- check for other parts e.g. /post/1348whatever2
    local statusid = url:gmatch("twitter.com/[%w_]+/statuse-s-/(%d+)")()
    if username and not ext then
        return "twitterrific:///profile?screen_name=" .. username
    elseif statusid then
        return "twitterrific:///tweet?id=" .. statusid
    end
end