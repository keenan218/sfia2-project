FROM python:3.7-alpine

WORKDIR /frontend

COPY . .

RUN pip install -r requirements.txt 

EXPOSE 5000

ENTRYPOINT ["/usr/local/bin/python3","app.py"]
