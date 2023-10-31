### command for ssh

    ssh-keygen -t ed25519 -C "julimax1600@gmail.com" -f ~/.ssh/argocd_ed25519

### pub key in github -> repository -> settings -> deploy keys

### then exec

    kubeseal --controller-name my-release-sealed-secrets --controller-namespace kube-system --format yaml < git-repo-secret.yml > 0-sealed-secret.yml

### finally apply only 0-sealed-secret.yml and 1-application.yml

    kubectl apply -f 0-sealed-secret.yml
    kubectl apply -f 1-application.yml
