# sockFactory3

This is a testing app that evaluates the performance of using `TCP_FASTACK` for JDBC connections to SQL Server.
The image is published at `twrightmsft/pocapp:v1` on Docker Hub (`docker pull twrightmsft/pocapp:v1`).
You can deploy to K8s by using `pod.yaml` (`kubectl create -f pod.yaml`).
When you run the container, you need to specify the env vars of the SQL instance to connect to.  The app assumes SQL DB in Azure.
```
    env:
    - name: DBNAME
      value: ""
    - name: USERNAME
      value: "azureuser"
    - name: SERVERNAME
      value: ""
    - name: PASSWORD
      value: ""
    - name: PORT
      value: "1433"
    - name: USEFASTACK
      value: "true" #true/false
```

`USEFASTACK` determines whether or not TCP_FASTACK is used on the socket or not.

The test connects to SQL DB using the settings provided in the env vars and then executes a simple T-SQL query against the AdventureWorks database 5 times with 2 seconds in between each iteration.
If you need a SQL DB with AdventureWorks DB you can create one by following the documentation: https://learn.microsoft.com/en-us/azure/azure-sql/database/scripts/create-and-configure-database-cli?view=azuresql#run-the-script

DON'T FORGET TO OPEN YOUR FIREWALL!!  Easiest thing to do is try running the app once and you'll get a firewall failure error message in it with the node IP address in the error message. You can then just go add that to the firewall exception rules in your SQL DB server.  https://learn.microsoft.com/en-us/azure/azure-sql/database/firewall-create-server-level-portal-quickstart?view=azuresql

If running on K8s:
```
kubectl create -f pod.yaml
kubectl logs pocapp
```

