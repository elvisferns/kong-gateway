exports.command = "create <type>";
exports.desc = "create a alerting monitor or destination";
exports.aliases = 'c';

exports.builder =  (yargs) => {
  return yargs
  .positional('type', {
    describe: 'alerting object to create',
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
  .example('$0 create monitor --name="test-alert"', "create a monitor named test-alert")
  .help();
};
exports.handler = function (argv) {
  console.log("init called for type", argv.type);
};
