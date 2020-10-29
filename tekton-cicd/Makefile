
create-secret: login docker-secret

login:
	docker login -u abdul125

docker-secret:
	kubectl create secret generic docker-auth -n tekton-pipelines \
 	--from-file=.dockerconfigjson=/home/ubuntu/.docker/config.json \
 	--type=kubernetes.io/dockerconfigjson

set-namespace:
	kubectl config set-context --current --namespace=tekton-pipelines

rm-all: rm-tasks rm-pipelines

apply-tasks:
	kubectl apply -f tasks/

apply-pipelines: carts catalogue frontend orders payment queue-master shipping user

rm-all: rm-tasks rm-pipelines

rm-pipelines: rm-carts rm-catalogue rm-frontend rm-orders rm-payment rm-queue-master rm-shipping rm-user

rm-tasks:
	kubectl delete -f tasks/

ls-test:
	kubectl get all -n test

ls-prod:
	kubectl get all -n prod

rm-test:
	kubectl delete all --all -n test
	kubectl delete ingress socks-ingress -n test || true

rm-prod:
	kubectl delete all --all -n prod 
	kubectl delete ingress socks-ingress -n prod || true

rm-tasks:
	kubectl delete -f tasks/

ls:
	tkn t ls
	tkn pr ls
pr:
	tkn pr logs -f

catalogue:
	kubectl apply -f run-catalogue-pipeline.yml

rm-catalogue:
	kubectl delete -f run-catalogue-pipeline.yml || true

frontend:
	kubectl apply -f run-frontend-pipeline.yml

rm-frontend:
	kubectl delete -f run-frontend-pipeline.yml || true

user:
	kubectl apply -f run-user-pipeline.yml

rm-user:
	kubectl delete -f run-user-pipeline.yml || true

orders:
	kubectl apply -f run-orders-pipeline.yml

rm-orders:
	kubectl delete -f run-orders-pipeline.yml || true

carts:
	kubectl apply -f run-carts-pipeline.yml

rm-carts:
	kubectl delete -f run-carts-pipeline.yml || true

payment:
	kubectl apply -f run-payment-pipeline.yml

rm-payment:
	kubectl delete -f run-payment-pipeline.yml || true

shipping:
	kubectl apply -f run-shipping-pipeline.yml

rm-shipping:
	kubectl delete -f run-shipping-pipeline.yml || true

queue-master:
	kubectl apply -f run-queue-master-pipeline.yml

rm-queue-master:
	kubectl delete -f run-queue-master-pipeline.yml || true
