FROM python:3.7-alpine

WORKDIR ./backend

COPY . .

RUN pip install -r requirements.txt

EXPOSE 5001

ENTRYPOINT ["/usr/local/bin/python3","app.py"]
