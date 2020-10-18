
build-frontend:
	kubectl apply -f front-end/build-task.yml
	kubectl apply -f front-end/deploy-task.yml
	kubectl apply -f front-end/pipeline.yml
	kubectl apply -f front-end/pipeline-run.yml

delete-frontend:
	
	kubectl delete -f front-end/build-task.yml
	kubectl delete -f front-end/deploy-task.yml
	kubectl delete -f front-end/pipeline.yml
	kubectl delete -f front-end/pipeline-run.yml


pull:
	docker pull abdul125/frontend:1
	docker pull abdul125/user:1
	docker pull abdul125/user-db
	docker pull abdul125/catalogue
	docker pull abdul125/catalogue-db
	docker pull abdul125/orders
	docker pull abdul125/carts
	docker pull abdul125/shipping
	docker pull abdul125/queue-master
	docker pull abdul125/payment
	docker pull abdul125/edge-router
	docker pull abdul125/e2e-tests
