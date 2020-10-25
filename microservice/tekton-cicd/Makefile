
build-tasks:
	kubectl apply -f tasks/

rm-tasks:
	kubectl delete -f tasks/

ls:
	tkn t ls
	tkn pr ls
pr:
	tkn pr logs -f

rm-all:
	kubectl delete -f tasks/ -f .


catalogue:
	kubectl apply -f run-catalogue-pipeline.yml

rm-catalogue:
	kubectl delete -f run-catalogue-pipeline.yml

frontend:
	kubectl apply -f run-frontend-pipeline.yml

rm-frontend:
	kubectl delete -f run-frontend-pipeline.yml

user:
	kubectl apply -f run-user-pipeline.yml

rm-user:
	kubectl delete -f run-user-pipeline.yml

orders:
	kubectl apply -f run-orders-pipeline.yml

rm-orders:
	kubectl delete -f run-orders-pipeline.yml

