-- autosave.lua
--
-- Periodically saves "watch later" data during playback, rather than only saving on quit.
-- This lets you easily recover your position in the case of an ungraceful shutdown of mpv (crash, power failure, etc.).
--
-- You can configure the save period by creating a "lua-settings" directory inside your mpv configuration directory.
-- Inside the "lua-settings" directory, create a file named "autosave.conf".
-- The save period can be set like so:
--
-- save_period=60
--
-- This will set the save period to once every 60 seconds of playback, time while paused is not counted towards the save period timer.
-- The default save period is 30 seconds.


local o = {
	save_period = 1
}


local mp = require 'mp'
local options = require 'mp.options'
options.read_options(o)


local function save_state()
  --print("===========================================")
  local time_remain = tonumber(mp.get_property("time-remaining"))
  if time_remain > 5 then
	  mp.command("write-watch-later-config")
  else
    mp.command("delete-watch-later-config")
  end
end
local timer_save = mp.add_periodic_timer(o.save_period, save_state)


local function stop_timer_pause(pause, bool)
	if bool then
		timer_save:stop()
	else
		timer_save:resume()
	end
end
mp.observe_property("pause", "bool", stop_timer_pause)


--local end_save = mp.register_event("end-file", write_state)




