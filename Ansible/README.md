# Ansible Playbook for DevOps Toolchain Setup

This playbook automates the installation and configuration of Docker, Java 17, Jenkins, and SonarQube with PostgreSQL on Ubuntu-based systems.

## Table of Contents
1. [Docker Installation](#docker-installation)
2. [Java 17 Setup](#java-17-setup)
3. [Jenkins Installation](#jenkins-installation)
4. [SonarQube Configuration](#sonarqube-configuration)
5. [Ansible Configuration](#ansible-configuration)

---

## Docker Installation
Sets up Docker Engine and container runtime.

**Tasks:**
1. Updates package cache
2. Installs required packages (`ca-certificates`, `curl`)
3. Adds Docker's official GPG key
4. Detects system architecture using `dpkg`
5. Configures Docker APT repository
6. Installs Docker components:
   - `docker-ce`
   - `docker-ce-cli`
   - `containerd.io`
   - `docker-buildx-plugin`
   - `docker-compose-plugin`
7. Adds `ubuntu` user to `docker` group

---

## Java 17 Setup
Installs and configures OpenJDK 17.

**Tasks:**
1. Updates package cache
2. Installs `openjdk-17-jdk`
3. Sets Java 17 as default using alternatives
4. Verifies installation with version check

---

## Jenkins Installation
Deploys Jenkins CI/CD server.

**Tasks:**
1. Updates package cache
2. Installs Java 17 dependency
3. Adds Jenkins GPG key
4. Configures Jenkins APT repository
5. Installs Jenkins package

---

## SonarQube Configuration
Sets up SonarQube with PostgreSQL database and Nginx reverse proxy.

**Key Components:**
### System Configuration
- Updates kernel parameters (`vm.max_map_count`, `fs.file-max`)
- Configures user limits for `sonarqube` user
- Installs required packages (`unzip`)

### PostgreSQL Setup
1. Adds PostgreSQL 15 repository
2. Installs PostgreSQL and contrib packages
3. Creates `sonar` user with password `admin123`
4. Creates `sonarqube` database

### SonarQube Installation
1. Downloads and extracts SonarQube 9.9.8
2. Creates dedicated `sonar` user/group
3. Configures `sonar.properties` with:
   - Database connection details
   - Web server settings
   - JVM options

### Service Configuration
- Creates systemd service file
- Enables and starts SonarQube service

### Nginx Reverse Proxy
1. Installs Nginx
2. Configures reverse proxy on port 80
3. Sets up proxy headers and buffering
4. Enables firewall rules for ports 80, 9000, 9001

---

## Ansible Configuration
`ansible.cfg` settings:
```ini
[defaults]
inventory = /home/ec2-user/environment/Ansible/aws_ec2.yml
private_key_file = /home/ec2-user/environment/Ansible/vockey
host_key_checking = False
remote_user = ubuntu  

[privilege_escalation]
become = True
become_method = sudo

[plugin: amazon.aws.aws_ec2]
regions = us-east-1
filters = 
  instance-state-name: running
  tag:Name: 
    - jenkins
    - jenkins-slave
hostnames = ip-address  
keyed_groups = 
  - key: tags.Name
```
### photo 
**Running Docker**
![docker](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Ansible/screenshots/docker-role.png)
![docker](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Ansible/screenshots/test-docker.png)
**Runnig Java**
![java](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Ansible/screenshots/install-java.png)
![java](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Ansible/screenshots/test-java.png)
**Runing Jenkins**
![jenkins](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Ansible/screenshots/intstall-jenkins.png)
![jenkins](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Ansible/screenshots/test-jenkins.png)
**Running SonarQube**
![sonarqube](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Ansible/screenshots/intsall-sonar.png)
![sonarqube](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Ansible/screenshots/test-sonar.png)

