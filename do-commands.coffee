require 'colors'

initCommands = (program)->

    program
      .command('do')
      .description('Digital Ocean related utilities')
      # TODO: GET BILLING ALERTS
      .option('-i, --get-droplet-info', 'Show Droplet(s) information')
      .option('-g, --get-billing', 'Get billing information')
      .action (options) ->

        DO = require('./do')

        if options.getDropletInfo
        	DO.getDropletInfo()

        if options.getBilling
          DO.__getBilling()

module.exports = initCommands