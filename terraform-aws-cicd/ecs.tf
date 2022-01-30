resource "aws_ecs_cluster" "web-cluster" {
  name               = var.cluster_name
  tags = {
    "env"       = "dev"
    "createdBy" = "enes"
  }
}
resource "aws_ecs_task_definition" "task-definition-test" {
  family                = "web-family"
  container_definitions = file("container-def.json")
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = "${data.aws_iam_role.ecs_task_execution_role.arn}"
  memory = "512"
  cpu = "256"
  tags = {
    "env"       = "dev"
    "createdBy" = "enes"
  }
}
resource "aws_ecs_service" "service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-test.arn
  desired_count   = 1
  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = "pythonAppContainer"
    container_port   = 5002
  }
  launch_type = "FARGATE"
  depends_on  = [aws_lb_listener.web-listener]
}