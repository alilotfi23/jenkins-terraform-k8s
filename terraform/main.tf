resource "kubernetes_namespace_v1" "jenkins" {
  metadata {
    name = jenkins
  }
}

resource "kubernetes_deployment_v1" "deploy" {
  metadata {
    name      = "deploy-jenkins"
    namespace = kubernetes_namespace_v1.jenkins.metadata.0.name

    labels = {
      tier = "web-app"
    }
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        tier = "web-app"
      }
    }
    template {
      metadata {
        labels = {
          tier = "web-app"
        }
      }
      spec {
        container {
          image = "alilotfi/jenkins-k8s:latest"
          name  = "alilotfi-jenkins"
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "svc" {
  metadata {
    name      = "web-app"
    namespace = kubernetes_namespace_v1.jenkins.metadata.0.name
  }
  spec {
    selector = {
      tier = kubernetes_deployment_v1.deploy.spec.0.template.0.metadata.0.labels.tier
    }
    port {
      port        = 8585
      target_port = 80
    }
    type = "LoadBalancer"
  }
}
