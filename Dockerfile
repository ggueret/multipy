FROM debian:buster
ENV DEBIAN_FRONTEND noninteractive

ENV PYTHON_38_VERSION 3.8.1
ENV PYTHON_37_VERSION 3.7.6
ENV PYTHON_36_VERSION 3.6.10
ENV PYTHON_35_VERSION 3.5.9
ENV PYTHON_34_VERSION 3.4.10
ENV PYTHON_27_VERSION 2.7.16

RUN apt-get update && apt-get -y install --no-install-recommends build-essential ca-certificates curl libffi6 libffi-dev libsqlite3-0 libsqlite3-dev libssl1.1 libssl-dev zlib1g zlib1g-dev && \
	mkdir /tmp/python && \
	# Python 3.8
	cd /tmp/python && curl -sL https://www.python.org/ftp/python/$PYTHON_38_VERSION/Python-$PYTHON_38_VERSION.tgz > Python-$PYTHON_38_VERSION.tgz && \
	tar xf Python-$PYTHON_38_VERSION.tgz && cd Python-$PYTHON_38_VERSION/ && \
	./configure && make -j$(nproc) build_all && make altinstall && \
	# Python 3.7
	cd /tmp/python && curl -sL https://www.python.org/ftp/python/$PYTHON_37_VERSION/Python-$PYTHON_37_VERSION.tgz > Python-$PYTHON_37_VERSION.tgz && \
	tar xf Python-$PYTHON_37_VERSION.tgz && cd Python-$PYTHON_37_VERSION/ && \
	./configure && make -j$(nproc) build_all && make altinstall && \
	# Python 3.6
	cd /tmp/python && curl -sL https://www.python.org/ftp/python/$PYTHON_36_VERSION/Python-$PYTHON_36_VERSION.tgz > Python-$PYTHON_36_VERSION.tgz && \
	tar xf Python-$PYTHON_36_VERSION.tgz && cd Python-$PYTHON_36_VERSION/ && \
	./configure && make -j$(nproc) build_all && make altinstall && \
	# Python 3.5
	cd /tmp/python && curl -sL https://www.python.org/ftp/python/$PYTHON_35_VERSION/Python-$PYTHON_35_VERSION.tgz > Python-$PYTHON_35_VERSION.tgz && \
	tar xf Python-$PYTHON_35_VERSION.tgz && cd Python-$PYTHON_35_VERSION/ && \
	./configure && make -j$(nproc) build_all && make altinstall && \
	# Python 3.4
	cd /tmp/python && curl -sL https://www.python.org/ftp/python/$PYTHON_34_VERSION/Python-$PYTHON_34_VERSION.tgz > Python-$PYTHON_34_VERSION.tgz && \
	tar xf Python-$PYTHON_34_VERSION.tgz && cd Python-$PYTHON_34_VERSION/ && \
	./configure && make -j$(nproc) build_all && make altinstall && \
	# Python 2.7
	cd /tmp/python && curl -sL https://www.python.org/ftp/python/$PYTHON_27_VERSION/Python-$PYTHON_27_VERSION.tgz > Python-$PYTHON_27_VERSION.tgz && \
	tar xf Python-$PYTHON_27_VERSION.tgz && cd Python-$PYTHON_27_VERSION/ && \
	./configure && make -j$(nproc) build_all && make altinstall && \
	# clean the layer
	cd / && rm -rf /tmp/python/ && \
	apt-get -y remove build-essential curl libffi-dev libsqlite3-dev libssl-dev zlib1g-dev && apt-get -y autoremove --purge && rm -rf /var/lib/apt/lists/*
