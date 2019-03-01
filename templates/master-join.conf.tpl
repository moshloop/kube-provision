apiVersion: kubeadm.k8s.io/v1alpha3
kind: ClusterConfiguration
kubernetesVersion: {{kubernetes_version}}
apiServerCertSANs:
  - localhost
  - 127.0.0.1
controlPlaneEndpoint: "localhost:6443"g
networking:
  podSubnet: "{{pod_subnet | default('100.200.0.0/22')}}"
apiServerExtraArgs:
  authorization-mode: "RBAC"
  apiserver-count: "{{apiserver_count | default('1')}}"
imageRepository: "{{docker_proxy}}k8s.gcr.io"

---
apiVersion: kubeadm.k8s.io/v1alpha3
kind: JoinConfiguration
token: {{token}}
controlPlane: true