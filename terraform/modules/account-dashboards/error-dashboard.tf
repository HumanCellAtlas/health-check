locals {
  error_dashboard = <<EOF
{
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
      "columns": [],
      "datasource": "${local.aws_logs_data_source_name}",
      "description": "Use this query in the logs repo to investigate: `@message:(stacktrace Stacktrace traceback Traceback error Error AssertionError exception Exception critical CRITICAL)`",
      "fontSize": "120%",
      "gridPos": {
        "h": 16,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 2,
      "links": [],
      "pageSize": null,
      "scroll": true,
      "showHeader": true,
      "sort": {
        "col": 1,
        "desc": true
      },
      "styles": [
        {
          "alias": "Time",
          "dateFormat": "YYYY-MM-DD HH:mm:ss",
          "pattern": "Time",
          "type": "date"
        },
        {
          "alias": "",
          "colorMode": null,
          "colors": [
            "rgba(245, 54, 54, 0.9)",
            "rgba(237, 129, 40, 0.89)",
            "rgba(50, 172, 45, 0.97)"
          ],
          "decimals": 2,
          "pattern": "/.*/",
          "thresholds": [],
          "type": "number",
          "unit": "short"
        }
      ],
      "targets": [
        {
          "bucketAggs": [
            {
              "field": "@log_group.keyword",
              "id": "2",
              "settings": {
                "min_doc_count": 1,
                "order": "desc",
                "orderBy": "_term",
                "size": "0"
              },
              "type": "terms"
            }
          ],
          "metrics": [
            {
              "field": "select field",
              "id": "1",
              "type": "count"
            }
          ],
          "query": "@message:(stacktrace Stacktrace traceback Traceback error Error AssertionError exception Exception critical CRITICAL)",
          "refId": "A",
          "timeField": "@timestamp"
        }
      ],
      "title": "Log Groups by Number of Errors",
      "transform": "table",
      "type": "table"
    }
  ],
  "schemaVersion": 16,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-6h",
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
  "title": "Application Errors [${upper(var.aws_profile)}]",
  "uid": "dcp-errors-${var.env}",
  "version": 2
}
EOF
}