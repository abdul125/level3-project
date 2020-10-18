apply:
	kubectl apply -f resource/
	kubectl apply -f tasks/frontend.yml -f tasks/shipping.yml
	kubectl apply -f pipelines/
delete:
	kubectl delete -f resource/
	kubectl delete -f tasks/frontend.yml -f tasks/shipping.yml
	kubectl delete -f pipelines/

ls-task:
	t t ls -n tekton-pipelines
pr:
	t pr ls -n tekton-pipelines
pr-logs:
	t pr logs -f -n tekton-pipelines
