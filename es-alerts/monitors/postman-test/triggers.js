module.exports =  [
  {
    name: "postman-reqs",
    severity: "3",
    condition: {
      script: {
        source: "ctx.results[0].hits.total.value > 5",
        lang: "painless",
      },
    },
    actions: [
      {
        name: "postman-slack-alert",
        destination_id: "w958-HsBQRH4tYaWuZfY",
        message_template: {
          source:
            "Monitor {{ctx.monitor.name}} just entered alert status. Please investigate the issue.\n- Issue: {{ctx.trigger.name}}\n- Severity: {{ctx.trigger.severity}}\n- Period start: {{ctx.periodStart}}\n- Period end: {{ctx.periodEnd}}",
          lang: "mustache",
        },
        throttle_enabled: false,
        subject_template: {
          source: "Issue: {{ctx.trigger.name}}",
          lang: "mustache",
        },
      },
    ],
  },
];
