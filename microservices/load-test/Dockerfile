FROM python:3.7.9

RUN pip install pyzmq locust faker

COPY locustfile.py /config/locustfile.py
COPY runLocust.sh /usr/local/bin/runLocust.sh

ENV LOCUST_FILE /config/locustfile.py

EXPOSE 8089

ENTRYPOINT ["/usr/local/bin/runLocust.sh"]
