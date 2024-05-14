output "info_instance" {
  value       = aws_instance.expense
  description = "aws instance information"
  #sensitive   = true
  #depends_on = [  ]
}

