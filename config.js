define(['settings'],
function (Settings) {
  var prefix = window.location.protocol + "//" + window.location.hostname;
  if (window.location.port) {
    prefix = prefix + ":" + window.location.port;
  }
  return new Settings({
    datasources: {
      'metrics': {
        type: 'influxdb',
        url: prefix + "/influx/db/<--DB_NAME-->",
        username: "<--USER-->",
        password: "<--PASS-->"
      },
      'grafana': {
        type: 'influxdb',
        url: prefix + "/influx/db/<--GRAFANA_DB_NAME-->",
        username: "<--USER-->",
        password: "<--PASS-->",
        grafanaDB: true
      }
    },
    search: {
      max_results: 100
    },
    window_title_prefix: 'Heapster - ',
    default_route: "<--DASHBOARD-->",
    timezoneOffset: null,
    unsaved_changes_warning: true,
  });
});
