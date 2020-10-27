default: build

build:
	docker build --tag node4 .

test:
	docker run --rm -v "$$(pwd)":/app -w /app node4 mocha test.js

itest:
	#docker run -it --rm -v "$$(pwd)":/app -w /app node4 casperjs test *_test.js catalogue_test.js
	docker run --rm -v "$$(pwd)":/app -w /app node4 casperjs test homepage_test.js
	#docker run --rm -v "$$(pwd)":/app -w /app node4 casperjs test login_test.js
	#docker run --rm -v "$$(pwd)":/app -w /app node4 casperjs test catalogue_test.js
	#docker run --rm -v "$$(pwd)":/app -w /app node4 casperjs test cart_test.js
	#docker run --rm -v "$$(pwd)":/app -w /app node4 casperjs test checkout_test.js

init:
	docker run --rm -v "$$(pwd)":/app -w /app node4 npm init


install:
	docker run --rm -v "$$(pwd)":/app -w /app node4 npm install
	
npm:
	docker run --rm -v "$$(pwd)":/app -w /app node4 npm install --save chrome-remote-interface chrome-launcher mocha express request body-parser sinon chai chai-http http 

upgrade:
	docker run -it --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/migrate-to-v5.js *.js
	docker run -it --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/migrate-to-v5.js e2e/*.js
	docker run -it --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/extract-calls-fake.js e2e/*.js
	docker run -it --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/extract-calls-fake.js *.js
