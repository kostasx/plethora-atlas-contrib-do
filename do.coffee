https   = require 'https'
fs      = require 'fs'
colors  = require 'colors'
request = require 'request'

DO =

	# config.keys.digital_ocean.apiClientId
	# config.keys.digital_ocean.apiToken

	getDropletInfo: (options)->

		headers = 
			'Content-Type'  : 'application/json'
			'Authorization' : 'Bearer ' + config.keys.digital_ocean.apiToken

		options = 
			url     : 'https://api.digitalocean.com/v2/droplets?page=1&per_page=1'
			headers : headers

		callback = (error, response, body) ->
			if !error and response.statusCode == 200
				data = JSON.parse(body)

				data.droplets.map (droplet)->

					console.log "\n"
					console.log "Name:\t#{droplet.name.cyan}"
					console.log "Memory:\t#{droplet.memory}"
					console.log "VCPUS:\t#{droplet.vcpus}"
					console.log "Disk:\t#{droplet.disk}"
					console.log "Status:\t#{ if droplet.status is 'active' then droplet.status.green else droplet.status.red }" # 'active'
					console.log "\n"

		  return

		request options, callback

	__getBilling: ()->

		console.log "__getBilling()..."


module.exports = DO