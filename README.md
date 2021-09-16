## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![TODO: Update the path with the name of your diagram](https://github.com/crutchj/Cyber-Security-Bootcamp/blob/main/Images/Azure%20Resource%20Group.JPG)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML file may be used to install only certain pieces of it, such as Filebeat.

  Ansible/install-elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly Redundant, in addition to restricting Access to the network.
For security purposes a load balancer would help protect against DDOS attacks. A jump box will be used so all admin access would be restricted to a single pathway via SSH for security concerns. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the Network and system Logs.
Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.
Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as: Apache.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web 1    | DVWS     | 10.0.0.5   | Linux            |    
| Web 2    | DVWS     | 10.0.0.8   | Linux            |
| Web 3    | DVWS     | 10.0.0.7   | Linux            |
| ELK      | Elk Stack| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Admin's home address (my public IP address)

Machines within the network can only be accessed by Jump-Box-Provisioner.
- Jump-Box-Provisioner  104.40.70.73 (10.0.0.4)

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box |     Yes             | My Public IP         |
| Web 1    |     No              | 40.112.132.214       |
| Web 2    |     No              | 40.112.132.214       |
| Web 3    |     No              | 40.112.132.214       |
| Elk      |     Yes             | My Public IP         |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
-Ansible was great because it automates everything, I can also share the ansible to others for them to use on their networks.

The playbook implements the following tasks:
- Install docker.io 
- Install python3
- Install docker module
- Increase virtual memory
- Download and launch a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![TODO: Update the path with the name of your screenshot of docker ps output](https://github.com/crutchj/Cyber-Security-Bootcamp/blob/main/Diagrams/Docker-PS.JPG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.8
- 10.0.0.7

We have installed the following Beats on these machines:
- Filebeats
- Metricbeats

These Beats allow us to collect the following information from each machine:
- Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing. For example, sudo commands, ssh logins, etc.   
- Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as: Apache. For example, cpu useage, network useage, etc.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the .yml files to your Control Node or jump-box.
- Update the Host file to include the IP addresses on your network
- Run the playbook, and navigate to The Kibana Public IP to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
ansible-playbook install-elk.yml
ansible-playbook filebeat-playbook.yml
ansible-playbook metricbeat-playbook.yml
nano filebeat-config.yml
nano metricbeat-config.yml
nano host.txt
nano ansible.cfg
