1. Apply the [traefik-static-config.yaml](k3s/traefik-static-config.yaml) \
_It is necessary, because traefik is installed by default at k3s via helm chart._
   1. Add the web entrypoint to the static config at your PI (via terminal) -> https://stackoverflow.com/a/70895373 and https://stephencowchau.medium.com/note-about-traefik-static-and-dynamic-configuration-on-kubenetes-using-helm-chart-configmap-and-dcf559ee805b \
    Static config is at ```/var/lib/rancher/k3s/server/manifests/traefik-config.yaml``` \
    Use the ```touch``` and ```nano``` commands for creation and edit the config yaml. \
   2. Restart your device! or the namespace the traefik is at => ```kubectl -n kube-system rollout restart deploy```
2. Apply the [ingressroute-traefik-dashboard.yml](k3s/ingressroute-traefik-dashboard.yml), what is going to assign the ```:8000/dashboard/``` to the ```:9000/dashboard/```
3. Access the traefik at ```{host}:8080/dashboard/```. Note the port is not 8000, but 8080!
