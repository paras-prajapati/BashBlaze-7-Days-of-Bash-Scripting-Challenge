![secure](https://github.com/paras-prajapati/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39645281/268b3e07-7193-4a24-ad6b-9ecf0163bee6)
![Uploading docker success.png…]()
# BashBlaze: 7 Days of Bash Scripting Challenge

The shell scripts are:
- `remote_execute.sh` - which remotely executes commands to all the remote servers listed within it.
- `secure_transfer.sh` - To transfer files and folders from master to remote servers
- `deploy_app.sh ` - To run deployment-related commands in the remote servers

## Steps
1. Establish key-based ssh authentication between the master and two remote servers. For this, I referred to this video https://www.youtube.com/watch?v=S1a7RmqeZ5E&t=185s
2. Install docker  and nginx in the remote servers using the `remote_execute.sh` script
 ![deploy1](https://github.com/paras-prajapati/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39645281/f548547a-620d-4fbe-a080-4e28e9fed930)
![Uploading docker-run.png…]()
![Uploading deploy1.png…]()


4. Write Dockerfile for your application, I used a python flask application for this project.
5. Configure nginx-reverse-proxy.conf to redirect requests from port 80 to my container (port 5000)
6. Run `remote_execute.sh` and `secure_transfer.sh` scripts to start the deployment to remote servers
