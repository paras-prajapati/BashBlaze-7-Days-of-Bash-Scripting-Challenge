
# BashBlaze: 7 Days of Bash Scripting Challenge

The shell scripts are:
- `remote_execute.sh` - which remotely executes commands to all the remote servers listed within it.
- `secure_transfer.sh` - To transfer files and folders from master to remote servers
- `deploy_app.sh ` - To run deployment-related commands in the remote servers

## Steps
1. Establish key-based ssh authentication between the master and two remote servers. For this, I referred to this video https://www.youtube.com/watch?v=S1a7RmqeZ5E&t=185s
2. Install docker  and nginx in the remote servers using the `remote_execute.sh` script
4. Write Dockerfile for your application, I used a python flask application for this project.
5. Configure nginx-reverse-proxy.conf to redirect requests from port 80 to my container (port 5000)
6. Run `remote_execute.sh` and `secure_transfer.sh` scripts to start the deployment to remote servers

    ----Docker and Nginx install command and run with nginx proxy
   ![deploy1](https://github.com/paras-prajapati/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39645281/1e8668f5-a641-4c44-a825-4a91900459c8)

   ----- App deploy
   ![docker-run](https://github.com/paras-prajapati/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39645281/c19b0dbc-043a-463a-8531-2857e0936015)

------Docker Success
   ![docker success](https://github.com/paras-prajapati/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39645281/97d72108-6695-49bf-bb3e-666a2104217c)

   -----File copy from Client1 to client 2
   ![secure](https://github.com/paras-prajapati/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/39645281/0d306ef5-0b43-4ada-add4-ae348480cbaa)




