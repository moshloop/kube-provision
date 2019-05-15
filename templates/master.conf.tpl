apiVersion: kubeadm.k8s.io/v1beta1
kind: ClusterConfiguration
kubernetesVersion: {{kubernetes_version}}
apiServer:
  certSANs:
  - localhost
  - 127.0.0.1
  extraArgs:
    apiserver-count: "3"
    authorization-mode: RBAC
  timeoutForControlPlane: 4m0s
controlPlaneEndpoint: "{{control_plane_endpoint}}"
networking:
  podSubnet: "{{pod_subnet }}"
  serviceSubnet: "{{service_subnet | default('10.96.0.1/24')}}"
imageRepository: "{{docker_proxy}}k8s.gcr.io"
clusterName: {{cluster_name}}

---
apiVersion: kubeadm.k8s.io/v1beta1
kind: InitConfiguration
bootstrapTokens:
- groups:
  - system:bootstrappers:kubeadm:default-node-token
  token: {{token}}
  ttl: "0s"
  usages:
  - signing
  - authentication
