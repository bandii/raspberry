This is only a Pet Project, where I make some notes about how did I set up my Raspberry at home.

# Raspberry preparation
[See this documentation.](./preparation.md)

# Terraform
```shell
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

// TODO: terraform plan -var-file=”variables.tfvars”
        or use the variables.***auto***.tfvars

* https://registry.terraform.io/providers/neuspaces/system/0.4.0
* https://registry.terraform.io/providers/TelkomIndonesia/linux/0.7.0
* https://registry.terraform.io/providers/hashicorp/tls/4.0.5

// TODO: resolve this before k3s install echo " cgroup_memory=1 cgroup_enable=memory" | tee -a filename >/boot/cmdline.txt

## // TODO:
- [ ] Terraform
- [ ] Add and use service accounts
- [ ] Add Traefik and some general Observability tools -> https://doc.traefik.io/traefik/observability/metrics/overview/

- [ ] Move the portainer to k3s
- [ ] Set users and roles
- [ ] Add https with custom cert? -> https://cert-manager.io/docs/releases/
