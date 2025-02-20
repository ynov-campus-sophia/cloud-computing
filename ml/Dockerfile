FROM python:3.10.16-slim-bookworm

ADD requirements.txt .
RUN pip install -r requirements.txt

ADD main.py .
ADD model.py .
ENTRYPOINT ["python"]

CMD ["model.py"]
