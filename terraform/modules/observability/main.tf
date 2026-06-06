# CloudWatch Log Groups
resource "aws_cloudwatch_log_group" "eks_app" {
  name              = "/aws/eks/${var.cluster_name}/application"
  retention_in_days = 7
  tags              = { Name = "${var.project_name}-app-logs" }
}

resource "aws_cloudwatch_log_group" "eks_control_plane" {
  name              = "/aws/eks/${var.cluster_name}/cluster"
  retention_in_days = 7
  tags              = { Name = "${var.project_name}-control-plane-logs" }
}
