const yargs = require("yargs");
const { hideBin } = require('yargs/helpers')
// const { createDestination } = require('./destinations');
// const { createMonitor }= require('./monitors');

// eslint-disable-next-line no-undef
const data = yargs(hideBin(process.argv))
.commandDir('cmds')
.demandCommand()
.help()
.parse();

console.log("🚀 ~ file: index.js ~ line 27 ~ data", data)

// createMonitor(postmanMonitor);

// createDestination('slack-postman-alert');
