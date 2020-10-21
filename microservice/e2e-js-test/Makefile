default: build

build:
	docker build --tag node4 .

install:
	#docker run -it --rm -v "$$(pwd)":/app -w /app node4 npm install
	docker run -v "$$(pwd)":/app -w /app node4 npm install

test:
	#docker run -it --rm -v "$$(pwd)":/app -w /app node4 mocha test.js
	docker run --rm -v "$$(pwd)":/app -w /app node4 npm test

init:
	#docker run -it --rm -v "$$(pwd)":/app -w /app node4 npm init
	docker run -v "$$(pwd)":/app -w /app node4 npm init

	
npm:
	#docker run -it --rm -v "$$(pwd)":/app -w /app node4 npm install --save chrome-remote-interface chrome-launcher mocha express request body-parser sinon chai chai-http http 
	docker run -v "$$(pwd)":/app -w /app node4 npm install --save chrome-remote-interface chrome-launcher mocha express request body-parser sinon chai chai-http http 

upgrade:
	#docker run -it --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/migrate-to-v5.js *.js
	#docker run -it --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/migrate-to-v5.js e2e/*.js
	#docker run -it --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/extract-calls-fake.js e2e/*.js
	#docker run -it --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/extract-calls-fake.js *.js
	docker run --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/migrate-to-v5.js *.js
	docker run --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/migrate-to-v5.js e2e/*.js
	docker run --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/extract-calls-fake.js e2e/*.js
	docker run --rm -v "$$(pwd)":/app -w /app node4 jscodeshift -t tmp/sinon-codemod/extract-calls-fake.js *.js
