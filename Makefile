.PHONY: up down init cluster-up install uninstall logs repos namespaces cluster-down clean provision

up: cluster-up init platform

down: cluster-down

cluster-down:
	k3d cluster delete labs

clean: logs
	
cluster-up:
	k3d cluster create labs \
	    -p 80:80@loadbalancer \
	    -p 443:443@loadbalancer \
	    -p 30000-32767:30000-32767@server[0] \
	    -v /etc/machine-id:/etc/machine-id:ro \
	    -v /var/log/journal:/var/log/journal:ro \
	    -v /var/run/docker.sock:/var/run/docker.sock \
	    --k3s-server-arg '--no-deploy=traefik' \
	    --agents 3

init: logs repos namespaces
platform: install-ingress install-cicd install-logging install-monitoring
deplatform: delete-ingress delete-cicd delete-logging delete-monitoring

logs:
	touch output.log
	rm -f output.log
	touch output.log

repos:
	helm repo add stable https://kubernetes-charts.storage.googleapis.com/
	helm repo add hashicorp https://helm.releases.hashicorp.com
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo add grafana https://grafana.github.io/helm-charts
	helm repo add elastic https://helm.elastic.co
	helm repo add fluent https://fluent.github.io/helm-charts
	helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
	helm repo update

namespaces:
	kubectl apply -f platform/namespaces

install-cicd:
	echo "cicd: install" | tee -a output.log
	kubectl apply -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
	kubectl apply -f https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml
	kubectl patch svc tekton-dashboard -n tekton-pipelines --type='json' -p '[{"op":"replace", "path":"/spec/type", "value":"NodePort"}]'

delete-cicd:
	echo "cicd: delete" | tee -a output.log
	kubectl delete -f https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml
	kubectl delete -f https://storage.googleapis.com/tekton-releases/dashboard/latest/tekton-dashboard-release.yaml

install-dashboard:
	echo "Dashboard: install" | tee -a output.log
	helm install dashboard kubernetes-dashboard/kubernetes-dashboard -n dashboard
	kubectl patch svc dashboard-kubernetes-dashboard -n dashboard --type='json' -p '[{"op":"replace","path":"/spec/type","value":"NodePort"}]'

delete-dashboard:
	echo "Dashboard: delete" | tee -a output.log
	helm delete -n dashboard dashboard 2>/dev/null | true

install-ingress:
	echo "Ingress: install" | tee -a output.log
	kubectl apply -n ingress-nginx -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml | tee -a output.log
	kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=120s

delete-ingress:
	echo "Ingress: delete" | tee -a output.log
	kubectl delete -n ingress -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/cloud/deploy.yaml | tee -a output.log 2>/dev/null | true

install-monitoring: install-prometheus install-grafana
delete-monitoring: delete-prometheus delete-grafana


install-prometheus:
	echo "Monitoring: install-grafana" | tee -a output.log
	helm install -n monitoring -f platform/monitoring/prometheus-values.yaml prometheus prometheus-community/prometheus| tee -a output.log

delete-prometheus:
	echo "Monitoring: delete-prometheus" | tee -a output.log
	helm delete -n monitoring prometheus 2>/dev/null | true

install-grafana:
	echo "Monitoring: install-grafana" | tee -a output.log
	helm install grafana grafana/grafana -n monitoring -f platform/monitoring/grafana-values.yaml | tee -a output.log

delete-grafana:
	echo "Monitoring: delete-grafana" | tee -a output.log
	helm delete -n monitoring grafana 2>/dev/null | true

install-logging:
	echo "Logging: install-elasticsearch" | tee -a output.log
	helm install elasticsearch elastic/elasticsearch -n logging | tee -a output.log
	echo "Logging: install-fluent-bit" | tee -a output.log
	helm install fluent-bit fluent/fluent-bit -n logging | tee -a output.log
	echo "Logging: install-kibana" | tee -a output.log
	helm install kibana elastic/kibana -n logging --set service.type=NodePort | tee -a output.log

delete-logging:
	echo "Logging: delete-elasticsearch" | tee -a output.log
	helm delete elasticsearch -n logging  | tee -a output.log 2>/dev/null | true
	echo "Logging: delete-elasticsearch" | tee -a output.log
	helm delete fluent-bit -n logging | tee -a output.log 2>/dev/null | true
	echo "Logging: delete-elasticsearch" | tee -a output.log
	helm delete kibana elastic/kibana -n logging | tee -a output.log 2>/dev/null | true
