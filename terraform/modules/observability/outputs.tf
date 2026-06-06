output "app_log_group" { value = aws_cloudwatch_log_group.eks_app.name }
output "control_plane_log_group" { value = aws_cloudwatch_log_group.eks_control_plane.name }
