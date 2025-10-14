# Custom image to run crush LLM tooling. It can be run as follows
# 
# ```bash
# # Create a volume for the `.local`, this stores some settings for crush
# podman volume create --ignore opencode_dot_local
# 
# # Build the image
# podman build -t the-tag-for-building .
#
# # In the code/source folder
# podman run \
#     -it \
#     -e OPENAI_API_KEY=$OPENAI_API_KEY \
#     -v opencode_dot_local:/root/.local \
#     -v ./:/app/:z \
#     the-tag-for-building
# ```
#
FROM node:24-trixie

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

# Install the different LSP's
WORKDIR /opt/kotlin-lsp
RUN wget "https://download-cdn.jetbrains.com/kotlin-lsp/0.253.10629/kotlin-0.253.10629.zip"
RUN unzip kotlin-0.253.10629.zip && rm ./kotlin-0.253.10629.zip
RUN chmod +x ./kotlin-lsp.sh

# Setup opencode 
RUN npm install -g opencode-ai@latest

# Add a workdir to mount stuff to
RUN mkdir /app
WORKDIR /app

# Copy configs. When using docker instead of podman make sure to add a non-root
# user
COPY ./opencode.json /root/.config/opencode/opencode.json

# !!!!!
# When using docker instead of podman make sure to add a non-root user here
# !!!!!

# Start crush
CMD ["opencode"]
