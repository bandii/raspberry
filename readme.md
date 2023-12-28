> [!WARNING]
> This repo is not finished yet, but feel free to create PRs, issues!

This is only a Pet Project, where I make some notes about how did I set up my Raspberry at home.

# I. Raspberry OS setup
[See this documentation.](./preparation.md)

# II. Terraform setup on the raspberry
```shell
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

# III. Terraform setup on your machine
1. Create a variables.auto.tfvars file with a similar content:
```dotenv
   system_host="192.168.1.103"
   system_user="bandi"
   system_password="bandijenei15"
   LOG=debug
```
_Or you can set the variables according to the docs, via Environment variables, or via a specific tfvars file for example: `terraform plan -var-file=”my_variables.tfvars”`_
2. Run from the repository's root folder:
```shell
terraform init
```
```shell
terraform plan
```
```shell
terraform apply
```
3. Find the `kubeconfig.yaml` in the `kubernetes` module

* https://registry.terraform.io/providers/neuspaces/system/0.4.0
* https://registry.terraform.io/providers/TelkomIndonesia/linux/0.7.0
* https://registry.terraform.io/providers/hashicorp/tls/4.0.5


# TODO:
## Known issues so far:
- [ ] Before k3s install, the cgroup memory should be updated, so no manual step, neither restart is required. Example command: `echo " cgroup_memory=1 cgroup_enable=memory" | tee -a filename >/boot/cmdline.txt`
- [ ] There are many hacky, shell-based resources + without delete lifecycle implementation.

## Plans
- [ ] `kubernetes_services` module is not tried out, yet; but you can try to apply them via `kubectl`.
- [ ] Add and use service accounts
- [ ] Add Traefik and some general Observability tools -> https://doc.traefik.io/traefik/observability/metrics/overview/
- [ ] Add https with custom cert -> https://cert-manager.io/docs/releases/
