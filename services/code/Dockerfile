FROM codercom/code-server:4.97.2

USER root

WORKDIR /home/coder

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    bash fish git less build-essential tmux zip unzip vim python3 python3-dev python3-venv python3-numpy

RUN mkdir -p /usr/lib/jvm/java-21-amazon-corretto && wget -qO- https://corretto.aws/downloads/latest/amazon-corretto-21-aarch64-linux-jdk.tar.gz | tar xz --strip-components=1 -C /usr/lib/jvm/java-21-amazon-corretto

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY config/settings.json /home/coder/.local/share/code-server/User/settings.json

RUN chown -R coder:coder /home/coder

USER coder

RUN echo "# java" >> ~/.bashrc
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto' >> ~/.bashrc
RUN echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc

RUN curl -fsSL https://bun.sh/install | bash

ENV DEFAULT_WORKSPACE="/home/coder/workspace"

RUN mkdir -p ${DEFAULT_WORKSPACE}

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "/home/coder/workspace"]
