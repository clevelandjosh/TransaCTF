# TransaCTF
A transaction based, adversarial CTF using Docker for modularity

# NOTE - YOU MAY INCURE COSTS FROM THE CLOUD SERVICES. 

This is a robust CTF environment with at least three major parts, two (or more) team environments and a scorekeeper environment.

The teams will be provided their own "newly inherited" modular web service environments that they will be responsible for defending, and keeping transactions flowing smoothly on. 

Each team will be provided access to the servers in their own environment, each module in the stack that are used to build the transaction services has something wrong with it. Something the other teams can leverage to gain access and decrease your uptime.

To make it more interesting each team doesn't necessarily have the same set of services. These will either be selected on initialization by the scorekeeper/provisioner or randomly selected. 

# The goals of the CTF
The goal for each team is to keep the servers up and running with as little impact on availability and integrity within the data.
Part of the idea is that most CTFs differ from "real life" in that they don't have any stakes around the integrity and availabity of the services provided. This does.

The scorekeeper will be constantly checking the uptime and running transactions that will be reconciled at the end of the event. 

The team with the most uptime and highest number of reconcilable transactions wins. 

Access lists will be in place to prevent this from becoming a DoS-fest.

To add to it both teams will host flags that need to remain on the server, and the services that provide access to the flags running, though the method of accessing the flags CAN and SHOULD be prevented. 

How the teams choose to do this is up to them, but be cautious not to impact uptime. 

Note - It is recommended to provide lead time to allow each team to checkout and script up solutions ahead of time. Not being online from the start counts against, so the faster a team can hit the ground running, the better for that team.

# How do I get set up?

There is a point of chicken/egg. Either vagrant can be used to build a launch system, that will be used as a local point of initialization, or the scripts that this server uses can be launched locally. 

Up to you. The plus side of the vagrant script is that it is all contained, the downside is the VM's overhead.

Either way this uses a boatload of containers, so the short answer is with ansible and docker.

As an Admin for a CTF there are several key pieces and decisions, but none of this will be super complicated. 

It can be set up, as is, with just the following commands:

<setup goes here>

# Summary of set up

For each instance there are several steps you will need to go through as setup. 

For your cloud provider (so far this is set up to work with AWS, <Placeholder_GCC_Azure_DigitalOcean> 

The next series of steps I am following information I got from here : https://www.linuxschoolonline.com/use-ansible-to-build-and-manage-aws-ec2-instances/

It explains the parts that are needed to be set up manually, basically an IAM account. I configured it with the following permissions:


You need an account to build into. Follow the best practices and don't use your root account. Set up an account in IAM. 

Once the account is made you will have the following information. This goes into the VARIABLE file. 


This is all set up using Ansible playbooks. You can clone the playbooks then run them from your desktop, provided your desktop has access outbound to Google's APIs.

Each team will need a Domain they are the admin of for DNS, and to provide the scorekeeper with the domainname, or the scorekeeper can dole them out, though that will auto solve the cert setup piece.
This is supposed to be a learning excercise, so letting the teams handle some of these components is part of the experience. 
For example, the teams should, ideally, look through the source and find out what to include in their certificates to get the points incrementing in their favor for that ;)

Once the scorekeeper sets everything up, those teams will get the hostnames in the domain from the scorekeeper, and have to set up their DNS for monitoring. 

# Configuration

The biggest part of this is the transaction and service monitoring. Since I wanted to leverage the awesomeness of Facebook's CTF scoreboard's Base properites I decided to have each transaction write out to a field.
Then those flags are checked. That lets me keep everything check related on the scoring server. 

Similarly the noise logs get sent and parsed there too. 


Dependencies

* Ansible
* Docker
* Vagrant
* Nagios
* Facebook CTF scoreboard
* AWS
* CentOS



# Contribution guidelines

* Ideally, once this is all set up, and the stacks are laid out people will be able to/want to submit containers and scenerios that fit in. I am totally on board with that. I will probably need to define/make it so that if another set of checks are to be done, they can easily fit in. I would love to work with anyone who has constructive ideas for this. 

# Who do I talk to?

You can @ me @ClevelandJosh on Twitter or submit requests through here. 
