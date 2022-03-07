-- Put your global variables here
MAX_VELOCITY = 10


--[[ This function is executed every time you press the 'execute'
     button ]]
function init()
	left_v = robot.random.uniform(0,MAX_VELOCITY)
	right_v = robot.random.uniform(0,MAX_VELOCITY)
	robot.wheels.set_velocity(left_v,right_v)

end


--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()

	light_front = robot.light[1].value + robot.light[24].value
	light_left = robot.light[6].value + robot.light[7].value
	light_right = robot.light[18].value + robot.light[19].value
	light_back = robot.light[12].value + robot.light[13].value

	log("robot.light_front = " .. light_front)
	log("robot.light_left = " .. light_left)
	log("robot.light_right = " .. light_right)
	log("robot.light_back = " .. light_back)

	if light_front > 0 then
		left_v = MAX_VELOCITY
		right_v = MAX_VELOCITY
	end

	if  light_left > 0 then
		left_v = -1
		right = MAX_VELOCITY
	end

	if light_right > 0 then
		left_v = MAX_VELOCITY
		right_v = -1
	end

	if light_back > 0 then
		left_v = MAX_VELOCITY
		right_v = -1
	end

	robot.wheels.set_velocity(left_v,right_v)

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

end



--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
