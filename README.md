
# parity-kubernetes
Scripts for deploying a simple gas free PoA chain into an k8s environment. Can be deployed to any local or cloud kubernetes provider (minikube, AWS, Google Cloud, Azure).

## Usage
Project comes with three sample generated Ethereum accounts accounts. 

Deploy:
`./deploy.sh deploy`

Remove:
`./deploy.sh remove`

### Link the separate deployed nodes together with the following commands:
Get the enode from the first node:


```
curl --data '{"jsonrpc":"2.0","method":"parity_enode","params":[],"id":0}' -H "Content-Type: application/json" -X POST localhost:8540 (Replace with your RPC port!)
```
Update RESULT with the result of the previous command, two nodes should now be connected
```
curl --data '{"jsonrpc":"2.0","method":"parity_addReservedPeer","params":["enode://RESULT "],"id":0}' -H "Content-Type: application/json" -X POST localhost:8541
```
Repeat to connect the third:
```
curl --data '{"jsonrpc":"2.0","method":"parity_addReservedPeer","params":["enode://RESULT "],"id":0}' -H "Content-Type: application/json" -X POST localhost:8541
```
Reference: [https://wiki.parity.io/Demo-PoA-tutorial](https://wiki.parity.io/Demo-PoA-tutorial)


**Generate new accounts if you want to use this for production!** 
- Example to generate new Ethereum accounts: `geth account new`  
- Replace the files in `/config/keys/ProductionChain` with the generated account files
- Update the passwords in  `/config/passwords/node.pwds`
- Update the validator addresses in `/config/genesis.json`
- Update the `engine_singer`  address in `config/node1.toml` `config/node2.toml` and  `config/node3.toml`
-  Rebuild the Docker image with the new configs: `docker build -t your_image_name .`
-  Replace the used image in the parity nodes from `marlowl/parity-poa:latest`  to your image
