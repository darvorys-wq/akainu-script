-- تحكم السكربت (true تشغيل / false إطفاء)
local ScriptEnabled = true

if ScriptEnabled then
    -- تشغيل سكربت إنفينيتي ييلد (Infinity Yield) لحاله وبس!
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeY/infiniteyield/master/source'))()
else
    -- رسالة تنبيه داخل اللعبة إذا قفلت السكربت مستقبلاً
    warn("السكربت مقفل حالياً من المطور!")
end
