# Ansible-Docker-Socket

The is a multi-container demo using Ansible Playbook.  The only requirement is that you have docker installed. You can get a copy [here](https://docs.docker.com/engine/installation/mac/). This demo was tested with Docker for Mac.

There are two containers in this demo, one container for the flask app and another for the redis database.  We will be running the Ansible command in a third container so you will not need to install anything other than docker.


## Download the zip file
On this GitHub page you should find a green button labeled "clone or download".  Click the button and select "Download Zip".  Save the file to your local drive and unzip it. Get a shell prompt and change to the directory where you unzipped the file. 

## Start the ansible container

```{r, engine='bash', count_lines}
$ ./run

```

You should how see a bash prompt where you can run your commands.

## Inspect the playbook and run it

Change to the infrastructure directory and open the playbook.yml in your favorite editor. There are two tasks in this playbook, one for the flask container and the other for the redis container. Notice that the flask container is linked to the redis container. Run the Ansible playbook.

```{r, engine='bash', count_lines}
$ ./run-playbook.sh
 [WARNING]: Host file not found: /etc/ansible/hosts

 [WARNING]: provided hosts list is empty, only localhost is available


PLAY [127.0.0.1] ***************************************************************

TASK [setup] *******************************************************************
ok: [127.0.0.1]

TASK [Launch redis database container] *****************************************
changed: [127.0.0.1]

TASK [Launch flask app container] **********************************************
changed: [127.0.0.1]

PLAY RECAP *********************************************************************
127.0.0.1                  : ok=3    changed=2    unreachable=0    failed=0   

```

Verify that the containers are running. You should see a flask-app container and a redis container listed under the image column.

```
# docker ps -a
CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS              PORTS                    NAMES
583cff0c8b8d        whale1990/flask-app   "/bin/sh -c 'python a"   4 minutes ago       Up 4 minutes        0.0.0.0:5000->5000/tcp   app
8d3deea0b586        redis                 "docker-entrypoint.sh"   4 minutes ago       Up 4 minutes        6379/tcp                 redis

```


Open a web browser and connect to the running app at http://localhost:5000.  You should see "Hello World! I have been seen 1 times". The number should increment each time you reload the page.


## Cleanup

Stop and remove the running containers using the continer ids from the previous step.

```{r, engine='bash', count_lines}
# docker rm -f 583cff0c8b8d 8d3deea0b586
583cff0c8b8d
8d3deea0b586
```

Stop the Ansible container. The container will be automatically removed after the exit command.

```{r, engine='bash', count_lines}
# exit

```


