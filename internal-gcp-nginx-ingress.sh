helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx \
    --namespace nginx-ingress \
    --set controller.replicaCount=2 \
    -f internal-ingress-value.yaml \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux


--------- create another file with internal-ingress-value.yaml -- name
controller:
  config:
    use-forwarded-headers: "true"
    server-tokens: "False"
    client-header-buffer-size: 64k
    proxy-buffer-size: 64k
    proxy-body-size: 10m
    #proxy-read-timeout: "600"
    #proxy-send-timeout: "600"
  service:
    loadBalancerIP: 10.6.111.11
    annotations:
      # service.beta.kubernetes.io/azure-load-balancer-internal: "true"
      cloud.google.com/load-balancer-type: "Internal"
