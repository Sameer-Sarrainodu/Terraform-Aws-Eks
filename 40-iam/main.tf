resource "aws_iam_policy" "alb" {
    name = "AwsLoadBalancerControllerIAMPolicy"
    description = "ALB CONTROLLER permission"
    policy = file("${path.module}/iam-policy.json")
  
}