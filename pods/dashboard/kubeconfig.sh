# 设置集群参数
export KUBE_APISERVER="https://127.0.0.1:6443"
kubectl config set-cluster kubernetes \
--certificate-authority=k8s-root-ca.pem \
--embed-certs=true \
--server=${KUBE_APISERVER} \
--kubeconfig=kube-proxy.kubeconfig

# 设置客户端认证参数
kubectl config set-credentials kube-proxy \
--client-certificate=/etc/kubernetes/ssl/kube-proxy.pem \
--client-key=/etc/kubernetes/ssl/kube-proxy-key.pem \
--embed-certs=true \
--kubeconfig=kube-proxy.kubeconfig

# 设置上下文参数
kubectl config set-context kubernetes \
--cluster=kubernetes \
--user=kube-proxy \
--namespace=kube-system \
--kubeconfig=kube-proxy.kubeconfig

# 设置默认上下文
kubectl config use-context kubernetes --kubeconfig=kube-proxy.kubeconfig