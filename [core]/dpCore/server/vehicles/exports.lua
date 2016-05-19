function spawnVehicle(...)
	return VehicleSpawn.spawn(...)
end

function returnVehicleToGarage(vehicle)
	return VehicleSpawn.returnToGarage(vehicle)
end

function isPlayerOwningVehicle(...)
	return VehicleSpawn.isPlayerOwningVehicle(...)
end

function updateVehicle(...)
	return UserVehicles.updateVehicle(...)
end

function updateVehicleTuning(...)
	return VehicleTuning.updateVehicleTuning(...)
end

function getPlayerVehicles(player)
	if not isElement(player) then
		return false
	end
	local ownerId = player:getData("_id")
	return UserVehicles.getVehicles(ownerId)
end

function getVehicleById(vehicleId)
	if not vehicleId then
		return 
	end
	return UserVehicles.getVehicle(vehicleId)
end

function addPlayerVehicle(player, model)
	if not isElement(player) then
		return false
	end	
	local result = UserVehicles.addVehicle(player:getData("_id"), model)
	-- Количество автомобилей игрока
	UserVehicles.getVehiclesIds(player:getData("_id"), function (result)
		if type(result) == "table" then
			player:setData("garage_cars_count", #result)
		end
	end)
	return result
end