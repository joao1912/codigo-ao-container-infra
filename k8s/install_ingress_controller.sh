# Associa o provedor OIDC ao cluster EKS
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster lab-eks-cluster \
    --approve

# Baixa a policy IAM necessária para o Load Balancer Controller
wget -O iam_policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.11.0/docs/install/iam_policy.json

# Cria a policy no IAM
aws iam create-policy \
  --policy-name AWSLoadBalancerControllerIAMPolicy \
  --policy-document file://iam_policy.json

# Cria a service account com a role e a policy associada
eksctl create iamserviceaccount \
      --cluster=lab-eks-cluster \
      --namespace=kube-system \
      --name=aws-load-balancer-controller \
      --role-name AmazonEKSLoadBalancerControllerRole \
      --attach-policy-arn=arn:aws:iam::111122223333:policy/AWSLoadBalancerControllerIAMPolicy \
      --approve

# Adiciona o repositório do Helm para EKS
helm repo add eks https://aws.github.io/eks-charts

# Atualiza o repositório Helm
helm repo update eks

# Instala o AWS Load Balancer Controller no cluster
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
      -n kube-system \
      --set clusterName=lab-eks-cluster \
      --set serviceAccount.create=false \
      --set serviceAccount.name=aws-load-balancer-controller
