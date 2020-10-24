
build-tasks:
	kubectl apply -f tasks/

rm-tasks:
	kubectl delete -f tasks/

catalogue-db:
	kubectl apply -f run-catalogue-db-pipeline.yml

rm-catalogue-db:
	kubectl apply -f run-catalogue-db-pipeline.yml

catalogue:
	kubectl apply -f run-catalogue-pipeline.yml

rm-catalogue:
	kubectl delete -f run-catalogue-pipeline.yml

frontend:
	kubectl apply -f run-frontend-pipeline.yml

rm-frontend:
	kubectl delete -f run-frontend-pipeline.yml

user-db:
	kubectl apply -f run-user-db-pipeline.yml

rm-user-db:
	kubectl delete -f run-user-db-pipeline.yml
