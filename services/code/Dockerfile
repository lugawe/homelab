FROM codercom/code-server:4.97.2

USER root

WORKDIR /home/coder

RUN apt-get update && apt-get upgrade -y && apt-get install -y git less build-essential vim python3
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY config/settings.json /home/coder/.local/share/code-server/User/settings.json

RUN chown -R coder:coder /home/coder

USER coder

ENV DEFAULT_WORKSPACE="/home/coder/workspace"

RUN mkdir -p ${DEFAULT_WORKSPACE}

EXPOSE 8080

CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none", "/home/coder/workspace"]
