# Auto-generated by fogg. Do not edit
# Make improvements in fogg, so that everyone can benefit.

module "env-alerts" {
  source                          = "../../../modules/env-alerts"
  analysis_health_check_id        = "${local.analysis_health_check_id}"
  aws_profile                     = "${local.aws_profile}"
  azul_indexer_health_check_id    = "${local.azul_indexer_health_check_id}"
  azul_webservice_health_check_id = "${local.azul_webservice_health_check_id}"
  data_browser_health_check_id    = "${local.data_browser_health_check_id}"
  dcp_health_check_id             = "${local.dcp_health_check_id}"
  dss_health_check_id             = "${local.dss_health_check_id}"
  env                             = "${local.env}"
  ingest_health_check_id          = "${local.ingest_health_check_id}"
  matrix_health_check_id          = "${local.matrix_health_check_id}"
  region                          = "${local.region}"
  upload_health_check_id          = "${local.upload_health_check_id}"
}
