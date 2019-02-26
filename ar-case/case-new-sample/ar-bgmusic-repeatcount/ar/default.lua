app_controller = ae.ARApplicationController:shared_instance()
local script_vm = app_controller:get_script_vm()
script_vm:require_module("./scripts/include.lua")
local application = app_controller:add_application_with_name("my_ar_application")
application:add_scene_from_json("res/simple_scene.json","demo_scene")
application:active_scene_by_name("demo_scene")

scene = application:get_current_scene()
--application:open_imu_service(1,1)

function on_loading_finish() 
    
    local player = ae.ARMusicPlayer:get_instance()
    local config = {}
    config["repeat_count"] = 3
    player:play_music("/res/media/testcase.mp3", config)
                              
end
application:set_script_loading_finish_handler(on_loading_finish)

