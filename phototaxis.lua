-- Put your global variables here
MAX_VELOCITY = 10


--[[ This function is executed every time you press the 'execute'
     button ]]
function init()
	left_v = robot.random.uniform(0,MAX_VELOCITY)
	right_v = robot.random.uniform(0,MAX_VELOCITY)
	robot.wheels.set_velocity(left_v,right_v)
	robot.leds.set_all_colors("black")
end


--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()

	log("robot.position.x = " .. robot.positioning.position.x)
	log("robot.position.y = " .. robot.positioning.position.y)
	log("robot.position.z = " .. robot.positioning.position.z)
	light_front = robot.light[1].value + robot.light[24].value
	log("robot.light_front = " .. light_front)



end



--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()
	left_v = robot.random.uniform(0,MAX_VELOCITY)
	right_v = robot.random.uniform(0,MAX_VELOCITY)
	robot.wheels.set_velocity(left_v,right_v)
	robot.leds.set_all_colors("black")
end



--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
