# Configure /etc/hosts file
echo "" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "# Host config for Ansible Controller and Targets Nodes" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.39.10   ansible.local  ansible" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.36.11   target01.local  target01" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.36.12   target02.local  target02" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.36.13   target03.local  target03" | sudo tee --append /etc/hosts 2> /dev/null && \
echo "192.168.36.14   target04.local  target04" | sudo tee --append /etc/hosts 2> /dev/null

apt-get update -y
apt-get install python3 python3-pip -y
pip3 install ansible
