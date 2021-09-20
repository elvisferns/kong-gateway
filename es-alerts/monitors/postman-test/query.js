module.exports = {
  size: 0,
  query: {
    bool: {
      must: [
        {
          regexp: {
            "data.http_user_agent.keyword": {
              value: ".*Postman.*",
              boost: 1,
            },
          },
        },
      ],
      filter: [
        {
          range: {
            timestamp: {
              from: "{{period_start}}",
              to: "{{period_end}}",
              include_lower: true,
              include_upper: true,
              format: "epoch_millis",
            },
          },
        },
      ],
    },
  },
};
