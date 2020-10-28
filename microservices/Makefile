
pip:
	kubectl apply -f pipeline.yml
	kubectl apply -f carts/pipeline.yml
	kubectl apply -f shipping/pipeline.yml
	kubectl apply -f payment/pipeline.yml

ls:
	tkn tasks ls
	tkn pr ls
 
pr:
	tkn pr logs -f


build-frontend:
	kubectl apply -f front-end/build-task.yml
	kubectl apply -f front-end/unit-test-task.yml
	kubectl apply -f front-end/deploy-task.yml
	kubectl apply -f front-end/pipeline.yml
	kubectl apply -f front-end/pipeline-run.yml

delete-frontend:
	
	kubectl delete -f front-end/build-task.yml
	kubectl delete -f front-end/unit-test-task.yml
	kubectl delete -f front-end/deploy-task.yml
	kubectl delete -f front-end/pipeline.yml
	kubectl delete -f front-end/pipeline-run.yml

apply-account:
	kubectl apply -f tekton-cicd/

delete-account:
	kubectl delete -f tekton-cicd/
