FROM mcr.microsoft.com/devcontainers/python:1.1.11-3.12-bookworm

# Install apt packages
RUN sudo apt-get update -y --fix-missing \
    && sudo apt-get install -y genisoimage qemu-utils qemu-system ovmf cloud-image-utils make curtain git curl zsh tzdata iputils-ping

# Install oh-my-zsh
# Default powerline10k theme, no plugins installed
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Clone zsh-autosuggestions plugin
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone zsh-syntax-highlighting plugin
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy ssh keys
COPY .ssh /root/.ssh

# Download SSH keys and create .ssh directory
RUN curl -sL 'https://github.com/SinLess-Games.keys' >> /root/.ssh/authorized_keys



