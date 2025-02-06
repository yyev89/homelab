# k3s

* Server installation script from official docs:

```bash
curl -sfL https://get.k3s.io | sh - 
# Check for Ready node, takes ~30 seconds 
```
* Access configuration via kubeconfig file (permission denied error):

```bash
mkdir ~/.kube 2> /dev/null
sudo k3s kubectl config view --raw > "$KUBECONFIG"
chmod 600 "$KUBECONFIG"
```
* Add worker node:

```bash
curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -
# Token is located on server node here: /var/lib/rancher/k3s/server/node-token
```