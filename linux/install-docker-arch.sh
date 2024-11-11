# This script will install docker on the system
# It first uninstalls any conflicting/old docker packages and then installs the latest version of docker
# sudo is required to run this script

# Uninstall old docker versions
echo "Uninstalling old docker versions"
sudo pacman -R --noconfirm docker docker-compose

# Install docker
echo "Installing latest docker"
sudo pacman -S --noconfirm docker docker-compose

# Start and enable docker
echo "Starting docker.service"
sudo systemctl start docker
echo "Enabling docker.service"
sudo systemctl enable docker

# Add user to docker group
if getent group docker > /dev/null 2>&1; then
    echo "Adding user to docker group"
    sudo usermod -aG docker $USER
else
    echo "Group docker does not exist. Creating group"
    sudo groupadd docker
    echo "Adding user to group docker"
    sudo usermod -aG docker $USER
fi