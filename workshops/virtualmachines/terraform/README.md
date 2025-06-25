## add you public ssh key to digitalocean

```
doctl compute ssh-key list
```

## get list of existing vpcs

```
doctl vpcs list
```

## create then destroy it
```
terraform apply  -var-file="ynov-vm.tfvars"
terraform state rm digitalocean_vpc.network
terraform destroy  -var-file="ynov-vm.tfvars"
```