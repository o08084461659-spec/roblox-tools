-- Simple Logger with Rotation
local Logger = {}

Logger.logFile = "log.txt"
Logger.maxSize = 1024 * 10 -- 10 KB

function Logger:rotateLog()
    local info = io.open(self.logFile, "r")
    if info then
        local fileSize = info:seek("end")
        info:close()
        if fileSize >= self.maxSize then
            os.rename(self.logFile, self.logFile .. ".old")
        end
    end
end

function Logger:log(message)
    self:rotateLog()
    local logFile = io.open(self.logFile, "a")
    if logFile then
        local timestamp = os.date("%Y-%m-%d %H:%M:%S")
        logFile:write(string.format("[%s] %s\n", timestamp, message))
        logFile:close()
    end
end

return Logger
