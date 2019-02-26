app_controller = ae.ARApplicationController:shared_instance()
local script_vm = app_controller:get_script_vm()
script_vm:require_module("./scripts/include.lua")
local application = app_controller:add_application_with_name("my_ar_application")
application:add_scene_from_json("res/simple_scene.json","demo_scene")
application:active_scene_by_name("demo_scene")

scene = application:get_current_scene()
--application:open_imu_service(1,1)

function on_loading_finish() 
    translateAnim()
end
application:set_script_loading_finish_handler(on_loading_finish)
  

function translateAnim()
    plane_node = scene:get_node_by_name("bantouPhoto")
    rigid_controller = plane_node:get_animation_controller()
    rigid_config = {}
    rigid_config["duration"] = 10000
    rigid_config["repeat_count"] =1
    rigid_config["translate_to"] = ae.ARVec3:new_local(0,-200,0)

    rigid_config["rigid_anim_type"] = "translate"
    rigid_config["interp_type"] = "bounce"

    rigid_session = rigid_controller:create_animation_session("rigid", rigid_config)
    rigid_session:play()
end




