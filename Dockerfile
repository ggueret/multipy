FROM debian:stretch
ENV DEBIAN_FRONTEND noninteractive

ENV PYTHON_37_VERSION 3.7.3
ENV PYTHON_36_VERSION 3.6.8
ENV PYTHON_35_VERSION 3.5.7
ENV PYTHON_34_VERSION 3.4.10
ENV PYTHON_27_VERSION 2.7.16

RUN apt-get update && apt-get install -y build-essential curl make libffi6 libffi-dev libssl1.1 libssl-dev zlib1g zlib1g-dev && \
	mkdir /tmp/python && \
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
	apt-get remove -y build-essential curl make libffi-dev libssl-dev zlib1g-dev && \
	apt-get autoremove -y && rm -rf /var/lib/apt/lists/*
