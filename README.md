# DevSecOps Bootcamp Final Project


#### In this project, I build, test, deploy of Weavework Sock Shop  microservices using Tekton CI/CD pipeline.

## What i did to get this running:
 1. Update the all the dockerfiles of every service using multi-stages then release every new dockerfile to my docker hub repo.
 2. Created deploy-all.yml to deploy it to K8S cluster to see if my services are working. 

 3. Created my Tekton CI/CD tasks, pipelines, and pipelinerunner for every service. Every pipeline consists of multiple of stages/tasks build, release, deploy to test namespace, apply e2e-test to test the deployed services in test namespace. If all services passed the test, the services are deployed to production.

## How to run it:
#### There is two Makefile:

 1. One in the main directory which is used to setup the cluster and install tools and 
 2. the second one in the tekton-cicd to which it does build deploy and test.
 
 **for both of them use :** make up 
