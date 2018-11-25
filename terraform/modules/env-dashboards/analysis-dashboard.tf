locals {
  analysis_dashboard = <<EOF
{
  "__inputs": [
    {
      "name": "DS_GCP-ANALYSIS-${upper(var.env)}",
      "label": "gcp-analysis-${var.env}",
      "description": "",
      "type": "datasource",
      "pluginId": "mtanda-google-stackdriver-datasource",
      "pluginName": "GoogleStackdriver"
    }
  ],
  "__requires": [
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "5.2.3"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph",
      "version": "5.0.0"
    },
    {
      "type": "datasource",
      "id": "mtanda-google-stackdriver-datasource",
      "name": "GoogleStackdriver",
      "version": "1.0.0"
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "gnetId": null,
  "graphTooltip": 0,
  "links": [],
  "panels": [
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${local.gcp_analysis_datasource_name}",
      "fill": 1,
      "gridPos": {
        "h": 8,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 2,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "",
          "bucketAggs": [
            {
              "field": "@timestamp",
              "id": "2",
              "settings": {
                "interval": "auto",
                "min_doc_count": 0,
                "trimEdges": 0
              },
              "type": "date_histogram"
            }
          ],
          "filter": "",
          "format": "time_series",
          "metricType": "logging.googleapis.com/user/Lira-notification-receipt",
          "metrics": [
            {
              "field": "select field",
              "id": "1",
              "type": "count"
            }
          ],
          "mode": "monitoring",
          "projectId": "",
          "query": "@log_group:\"/gcp/${var.gcp_analysis_project_id}/container/~\" AND @message:\"INFO:lira.api.notifications:Notification received\"",
          "refId": "A",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          },
          "timeField": "@timestamp"
        },
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "",
          "filter": "",
          "format": "time_series",
          "metricType": "logging.googleapis.com/user/Lira-Cromwell-receipt",
          "mode": "monitoring",
          "projectId": "",
          "refId": "B",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Lira(Listener) Receipt Counts",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": true,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${local.gcp_analysis_datasource_name}",
      "fill": 1,
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 0,
        "y": 8
      },
      "id": 4,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": false,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null as zero",
      "percentage": false,
      "pointradius": 0.5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "Falcon-Queue-Update-HeartBeat",
          "bucketAggs": [
            {
              "field": "@timestamp",
              "id": "2",
              "settings": {
                "interval": "auto",
                "min_doc_count": 0,
                "trimEdges": 0
              },
              "type": "date_histogram"
            }
          ],
          "filter": "resource.labels.cluster_name=\"green-100-us-central1\"",
          "format": "time_series",
          "hide": false,
          "metricType": "logging.googleapis.com/user/Falcon-queue-handler-heartbeat",
          "metrics": [
            {
              "field": "select field",
              "id": "1",
              "type": "count"
            }
          ],
          "mode": "monitoring",
          "projectId": "",
          "query": "@log_group:\"/gcp/${var.gcp_analysis_project_id}/container/~\" AND @message:\"INFO:falcon.falcon.queue_handler:QueueHandler\"",
          "refId": "A",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          },
          "timeField": "@timestamp"
        },
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "Falcon-Queue-Effective-Update",
          "filter": "resource.labels.cluster_name=\"green-100-us-central1\"",
          "format": "time_series",
          "metricType": "logging.googleapis.com/user/Falcon-queue-handler-effective-update",
          "mode": "monitoring",
          "projectId": "",
          "refId": "B",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "fill": true,
          "line": true,
          "op": "lt",
          "value": 0.5,
          "yaxis": "left"
        },
        {
          "colorMode": "critical",
          "fill": true,
          "line": true,
          "op": "gt",
          "value": 2,
          "yaxis": "left"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Falcon (Workflow Throttle) Queue Update Count",
      "tooltip": {
        "shared": false,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": true,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${local.gcp_analysis_datasource_name}",
      "fill": 1,
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 12,
        "y": 8
      },
      "id": 5,
      "legend": {
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": false,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null as zero",
      "percentage": false,
      "pointradius": 0.5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "Falcon-Igniter-Heartbeat",
          "bucketAggs": [
            {
              "field": "@timestamp",
              "id": "2",
              "settings": {
                "interval": "auto",
                "min_doc_count": 0,
                "trimEdges": 0
              },
              "type": "date_histogram"
            }
          ],
          "filter": "resource.labels.cluster_name=\"green-100-us-central1\"",
          "format": "time_series",
          "hide": false,
          "metricType": "logging.googleapis.com/user/Falcon-igniter-heartbeat",
          "metrics": [
            {
              "field": "select field",
              "id": "1",
              "type": "count"
            }
          ],
          "mode": "monitoring",
          "projectId": "",
          "query": "@log_group:\"/gcp/${var.gcp_analysis_project_id}/container/~\" AND @message:\"INFO:falcon.falcon.queue_handler:QueueHandler\"",
          "refId": "A",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          },
          "timeField": "@timestamp"
        },
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "Falcon-Igniter-Workflow-Release",
          "filter": "resource.labels.cluster_name=\"green-100-us-central1\"",
          "format": "time_series",
          "metricType": "logging.googleapis.com/user/Falcon-igniter-effective-release",
          "mode": "monitoring",
          "projectId": "",
          "refId": "B",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        }
      ],
      "thresholds": [
        {
          "colorMode": "critical",
          "fill": true,
          "line": true,
          "op": "lt",
          "value": 0.5,
          "yaxis": "left"
        }
      ],
      "timeFrom": null,
      "timeShift": null,
      "title": "Falcon (Workflow Throttle) Workflow Release Count",
      "tooltip": {
        "shared": false,
        "sort": 0,
        "value_type": "individual"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": true,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${local.gcp_analysis_datasource_name}",
      "fill": 2,
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 0,
        "y": 17
      },
      "id": 7,
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null as zero",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": true,
      "targets": [
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "Method: {{metric.labels.method}}",
          "filter": "resource.labels.bucket_name=\"${var.gcp_analysis_project_id}-cromwell-execution\" ",
          "format": "time_series",
          "metricType": "storage.googleapis.com/api/request_count",
          "mode": "monitoring",
          "projectId": "",
          "refId": "A",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "GCS Cromwell Execution Bucket Requests Count",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": true,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${local.gcp_analysis_datasource_name}",
      "fill": 2,
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 12,
        "y": 17
      },
      "id": 10,
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null as zero",
      "percentage": false,
      "pointradius": 5,
      "points": false,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "Method: {{metric.labels.method}}",
          "filter": "resource.labels.bucket_name=\"${var.gcp_analysis_project_id}-cromwell-execution\" \nmetric.labels.method=\"ReadObject\" OR metric.labels.method=\"WriteObject\"",
          "format": "time_series",
          "metricType": "storage.googleapis.com/api/request_count",
          "mode": "monitoring",
          "projectId": "",
          "refId": "A",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "GCS Cromwell Execution Bucket Read/Write Count",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "cumulative"
      },
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${local.gcp_analysis_datasource_name}",
      "decimals": null,
      "fill": 1,
      "gridPos": {
        "h": 15,
        "w": 12,
        "x": 0,
        "y": 27
      },
      "id": 12,
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 1,
      "points": true,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "GCE VM Instance: {{metric.labels.instance_name}}",
          "filter": "",
          "format": "time_series",
          "metricType": "compute.googleapis.com/instance/cpu/utilization",
          "mode": "monitoring",
          "projectId": "",
          "refId": "A",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "GCE VM Instances CPU Utilization",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "transparent": false,
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${local.gcp_analysis_datasource_name}",
      "decimals": null,
      "fill": 1,
      "gridPos": {
        "h": 15,
        "w": 12,
        "x": 12,
        "y": 27
      },
      "id": 14,
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": true,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": true
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 1,
      "points": true,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "Read Ops: VM Instance: {{metric.labels.instance_name}}",
          "filter": "",
          "format": "time_series",
          "metricType": "compute.googleapis.com/instance/disk/read_ops_count",
          "mode": "monitoring",
          "projectId": "",
          "refId": "A",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        },
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "Write Ops: VM Instance: {{metric.labels.instance_name}}",
          "filter": "",
          "format": "time_series",
          "metricType": "compute.googleapis.com/instance/disk/write_ops_count",
          "mode": "monitoring",
          "projectId": "",
          "refId": "B",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "GCE VM Instances Disk Utilization",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "transparent": false,
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    },
    {
      "aliasColors": {},
      "bars": false,
      "dashLength": 10,
      "dashes": false,
      "datasource": "${local.gcp_analysis_datasource_name}",
      "decimals": null,
      "fill": 1,
      "gridPos": {
        "h": 7,
        "w": 24,
        "x": 0,
        "y": 42
      },
      "id": 13,
      "legend": {
        "alignAsTable": true,
        "avg": false,
        "current": false,
        "max": false,
        "min": false,
        "rightSide": false,
        "show": true,
        "total": false,
        "values": false
      },
      "lines": true,
      "linewidth": 1,
      "links": [],
      "nullPointMode": "null",
      "percentage": false,
      "pointradius": 1,
      "points": true,
      "renderer": "flot",
      "seriesOverrides": [],
      "spaceLength": 10,
      "stack": false,
      "steppedLine": false,
      "targets": [
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "State: {{metric.labels.state}}",
          "filter": "",
          "format": "time_series",
          "hide": false,
          "metricType": "agent.googleapis.com/agent/api_request_count",
          "mode": "monitoring",
          "projectId": "",
          "refId": "A",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        },
        {
          "aggregation": {
            "alignmentPeriod": "",
            "crossSeriesReducer": "REDUCE_NONE",
            "groupByFields": [],
            "perSeriesAligner": "ALIGN_NONE"
          },
          "alias": "",
          "filter": "",
          "format": "time_series",
          "hide": true,
          "metricType": "compute.googleapis.com/instance/disk/read_ops_count",
          "mode": "monitoring",
          "projectId": "",
          "refId": "B",
          "seriesFilter": {
            "mode": "NONE",
            "param": "",
            "type": "NONE"
          }
        }
      ],
      "thresholds": [],
      "timeFrom": null,
      "timeShift": null,
      "title": "Google Cloud API Request Count",
      "tooltip": {
        "shared": true,
        "sort": 0,
        "value_type": "individual"
      },
      "transparent": false,
      "type": "graph",
      "xaxis": {
        "buckets": null,
        "mode": "time",
        "name": null,
        "show": true,
        "values": []
      },
      "yaxes": [
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        },
        {
          "format": "short",
          "label": null,
          "logBase": 1,
          "max": null,
          "min": null,
          "show": true
        }
      ],
      "yaxis": {
        "align": false,
        "alignLevel": null
      }
    }
  ],
  "refresh": false,
  "schemaVersion": 16,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-1h",
    "to": "now"
  },
  "timepicker": {
    "refresh_intervals": [
      "5s",
      "10s",
      "30s",
      "1m",
      "5m",
      "15m",
      "30m",
      "1h",
      "2h",
      "1d"
    ],
    "time_options": [
      "5m",
      "15m",
      "1h",
      "6h",
      "12h",
      "24h",
      "2d",
      "7d",
      "30d"
    ]
  },
  "timezone": "",
  "title": "ANALYSIS [${upper(var.env)}]",
  "uid": "analysis-${var.env}",
  "version": 39
}
EOF
}