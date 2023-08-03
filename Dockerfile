FROM python:3.11
WORKDIR /opt/app
ADD . .

ENV POETRY_HOME="/opt/poetry"
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 -
RUN make install

CMD ["ls", "-la"]