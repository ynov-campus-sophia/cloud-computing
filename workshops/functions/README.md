# test functions
```
doctl serverless connect
doctl serverless deploy  . --remote-build                                                                                                                

Deploying '/home/asinatra/personal/cloud-computing/workshops/functions'
  to namespace 'fn-00951930-c138-415b-9676-169dc3854a8c'
  on host 'https://faas-fra1-afec6ce7.doserverless.co'

Deployed functions ('doctl sls fn get <funcName> --url' for URL):
  - ynov/hello

doctl sls fn get ynov/hello --url                                                                                                                         
https://faas-fra1-afec6ce7.doserverless.co/api/v1/web/fn-00951930-c138-415b-9676-169dc3854a8c/ynov/hello
```

# Assignement

```
1. create 1 function each one
2. deploy it
3. automate the deployment via github workflows
```

# how to DOCTL ACTIONS

```
https://github.com/digitalocean/action-doctl
```

# ideas of functions to implement

1. ROUTING TRACING:  https://www.geeksforgeeks.org/traceroute-implementation-on-python/  XX (permission probblems)
2. EMAIL: https://www.digitalocean.com/community/tutorials/sending-confirmation-emails-with-resend
3. SNIFFER XX (python 2.7 not supported)
3. SECURITY SCAN: https://www.geeksforgeeks.org/webdork-python-tool-to-automate-dorking/   XX (429 blacklisted by google NEED a IP ROTATING PROXY)
