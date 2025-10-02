# Custom image to run crush LLM tooling. It can be run as follows
# 
# ```bash
# # Create a volume for the `.local`, this stores some settings for crush
# podman volume create --ignore crush_dot_local
# 
# podman run \
#     -it \
#     -e TERM=tmux-256color \
#     -e OPENAI_API_KEY=$OPENAI_API_KEY \
#     -v crush_dot_local:/root/.local \
#     -v ./:/app/:z \
#     the-tag-that-was-used-for-building
# ```
#
FROM golang:1.25-trixie

# Make sure the system is updated and contains the necessary packages we need
RUN apt update && apt upgrade -y
RUN apt install zip gradle apt-transport-https gpg -y

# Install java-temurin, reference docs: https://adoptium.net/installation/linux
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public \
    | gpg --dearmor \
    | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
RUN echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" \
    | tee /etc/apt/sources.list.d/adoptium.list
RUN apt update && apt install temurin-25-jdk -y

# Setup crush 
# TODO put at the end but here for caching layers and debugging
RUN go install github.com/charmbracelet/crush@v0.10.4

# Install the different LSP's
WORKDIR /opt/kotlin-lsp
RUN wget "https://download-cdn.jetbrains.com/kotlin-lsp/0.253.10629/kotlin-0.253.10629.zip"
RUN unzip kotlin-0.253.10629.zip && rm ./kotlin-0.253.10629.zip
RUN chmod +x ./kotlin-lsp.sh

# Finalize the setup as the non root user
COPY ./crush.json /root/.config/crush/crush.json

# Add a workdir to mount stuff to
RUN mkdir /app
WORKDIR /app

# Start crush
CMD ["/go/bin/crush"]
