# Auto-generated by fogg. Do not edit
# Make improvements in fogg, so that everyone can benefit.

module "env-dashboards" {
  source                          = "../../../modules/env-dashboards"
  analysis_health_check_id        = "${local.analysis_health_check_id}"
  aws_cloudwatch_data_source_name = "${local.aws_cloudwatch_data_source_name}"
  aws_logs_data_source_name       = "${local.aws_logs_data_source_name}"
  aws_profile                     = "${local.aws_profile}"
  dcp_health_check_id             = "${local.dcp_health_check_id}"
  dss_health_check_id             = "${local.dss_health_check_id}"
  env                             = "${local.env}"
  gcp_analysis_project_id         = "${local.gcp_analysis_project_id}"
  ingest_health_check_id          = "${local.ingest_health_check_id}"
  matrix_health_check_id          = "${local.matrix_health_check_id}"
  region                          = "${local.region}"
  upload_health_check_id          = "${local.upload_health_check_id}"
}
