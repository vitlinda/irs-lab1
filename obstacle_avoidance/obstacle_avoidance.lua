-- Put your global variables here

MAX_VELOCITY = 10
MOVE_STEPS = 15

n_steps = 0

--[[ This function is executed every time you press the 'execute'
     button ]]
function init()
	left_v = robot.random.uniform(0,MAX_VELOCITY)
	right_v = robot.random.uniform(0,MAX_VELOCITY)
	robot.wheels.set_velocity(left_v,right_v)
	n_steps = 0
end


--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
	n_steps = n_steps + 1
	if n_steps % MOVE_STEPS == 0 then
	-- Search for the reading with the highest value
		value = -1 -- highest value found so far
		idx = -1   -- index of the highest value
		for i=1,#robot.proximity do
			if value < robot.proximity[i].value then
				idx = i
				value = robot.proximity[i].value
			end
		end
		if value > 0 then
			if(idx == 1 ) or (idx == 24) then 
				log("OBSTACLE FRONT. idx: " .. idx)
				--repeat
				--left_v = robot.random.uniform(-10, MAX_VELOCITY)
				--right_v = robot.random.uniform(-10, MAX_VELOCITY)
				--until not(left_v == right_v)
				left_v = -MAX_VELOCITY
				right_v = -MAX_VELOCITY
				log("New direction left: " .. left_v .. " right: " .. right_v)
			end
			if (idx == 6) or (idx == 7) then
				log("OBSTACLE LEFT. idx: " .. idx)
				left_v = robot.random.uniform(0,MAX_VELOCITY)
				right_v = -5
				log("New direction left: " .. left_v .. " right: " .. right_v)
			end
			if (idx == 18) or (idx == 19) then
				log("OBSTACLE RIGHT. idx: " .. idx)
				left_v = -5
				right_v = robot.random.uniform(0,MAX_VELOCITY)
				log("New direction left: " .. left_v .. " right: " .. right_v)
			end
			if (idx == 12) or (idx == 13) then
				log("OBSTACLE BACK. idx: " .. idx)
				left_v = MAX_VELOCITY
				right_v = MAX_VELOCITY
				log("New direction left: " .. left_v .. " right: " .. right_v)
			end

		else --go around randomly
			left_v = robot.random.uniform(0,MAX_VELOCITY)
			right_v = robot.random.uniform(0,MAX_VELOCITY)
		end

		robot.wheels.set_velocity(left_v,right_v)
	end
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
	n_steps = 0
end



--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
