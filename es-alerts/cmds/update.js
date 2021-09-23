exports.command = "update <type>";
exports.desc = "update a alerting monitor or destination";
exports.aliases = 'u';

exports.builder =  (yargs) => {
  return yargs
  .positional('type', {
    describe: 'alerting object to update',
    choices: ['monitor', 'destination'],
    type: 'string',
    nargs: 1,
  })
  .option('name', {
    alias: 'n',
    describe: "name of montor or destination",
    demandOption: true,
    type: 'string',
    nargs: 1,
  })
  .example('$0 update monitor --name="test-alert"', "updates a monitor named test-alert")
  .help();
};
exports.handler = function (argv) {
  console.log("init called for type", argv.type);
};
