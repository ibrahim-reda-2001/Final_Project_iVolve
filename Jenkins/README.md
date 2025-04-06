# Jenkins Pipeline Documentation

## Pipeline Overview

```mermaid
graph TD
    A[Checkout SCM] --> B[Build Application]
    B --> C[Run Unit Tests]
    C --> D[SonarQube Analysis]
    D --> E[Docker Build]
    E --> F[Kubernetes Deploy]
    F --> G[Publish to Nexus]
    G --> H[Post-Build Actions]
    H --> I[Slack Notifications]
    H --> J[Workspace Cleanup]
```
### Install this plugins 
**1.Timestamp**

**2.Nexus artifact uploader**

**3.Sonarqube scanner**

**4.stageview**

**5.slack notfication**

**6.Blue  ocean**
### Prerequist

**Docker**

**Kubectl**

### Enable slave

![slave](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Jenkins/screenshots/slave.png)

### Add sonar server 

![sonar](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Jenkins/screenshots/integratewithsoner.png)

## Add slack notfication

![Slack](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Jenkins/screenshots/intgratedSL.png)

## Runing application 
![sonar](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Jenkins/screenshots/dockerhub.png)
![sonar](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Jenkins/screenshots/nexus.png)
![sonar](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Jenkins/screenshots/sonarqube.png)
![sonar](https://github.com/ibrahim-reda-2001/Final_Project_iVolve/blob/master/Jenkins/screenshots/slack.png)







