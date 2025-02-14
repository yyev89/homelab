resource "kubernetes_namespace_v1" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prometheus-stack" {
  name = "prometheus-stack"

  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = false
  version          = var.chart_version

  values = [file("./modules/monitoring/values/values.yml")]

  depends_on = [kubernetes_namespace_v1.monitoring]
}
