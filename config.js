define(['settings'],
function (Settings) {
  var prefix = window.location.protocol + "//" + window.location.hostname;
  if (window.location.port) {
    prefix = prefix + ":" + window.location.port;
  }
  return new Settings({
    datasources: {
      influx: {
        default: true,
        type: 'influxdb',
        url: prefix + "/influx/db/<--DB_NAME-->",
        username: "<--USER-->",
        password: "<--PASS-->"
      },
      elasticsearch: {
        type: 'elasticsearch',
        url: prefix + "/elasticsearch",
        index: 'grafana-dash',
        grafanaDB: true
      }
    },
    search: {
      max_results: 100
    },
    window_title_prefix: 'Kubernetes - ',
    default_route: "<--DASHBOARD-->",
    timezoneOffset: null,
    unsaved_changes_warning: true,
  });
});
