provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "wmp-terraform-data"
    key    = "learn-kubernetes/env-dev/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_eks_cluster" "main" {
  name = "wmp-eks-cluster"

  role_arn = aws_iam_role.main.arn
  version  = "1.31"

  vpc_config {
    subnet_ids = ["subnet-005ab3b734b47f3f7","subnet-068ce337c8cfe6696"]
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
  ]
}

resource "aws_iam_role" "main" {
  name = "wmp-eks-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.main.name
}