-- تحكم السكربت السريع
local ScriptEnabled = true

if ScriptEnabled then
    -- تحسين سرعة الاستجابة وتشغيل السكربت فوراً بثواني
    task.spawn(function()
        pcall(function()
            local success, scriptSource = pcall(game.HttpGet, game, 'https://raw.githubusercontent.com/EdgeY/infiniteyield/master/source')
            if success and scriptSource then
                local func = loadstring(scriptSource)
                if func then func() end
            end
        end)
    end)
else
    warn("السكربت مقفل حالياً من المطور!")
end
