FROM python:3.7

WORKDIR /app

COPY . .

RUN pip install Flask Flask-SQLAlchemy PyMySQL 

EXPOSE 5000

ENTRYPOINT ["/usr/local/bin/python3","app.py"]
