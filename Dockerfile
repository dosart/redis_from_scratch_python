FROM python:3.11 as base
WORKDIR /opt
ENV POETRY_HOME=/opt/poetry
ADD . .
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 -
RUN make install

FROM base as test
RUN ["make", "run_test"]