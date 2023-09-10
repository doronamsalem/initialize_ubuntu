# Installation of necessary softwers and apps
# Execute the following foe activate the script in the next shell session:
# sed -i 's/export first_initialize=false/export first_initialize=true/' $COUSTOM_CONFIGURATION_DIR/main.sh

#!bin/bash
if $first_initialize
then
    sed -i 's/export first_initialize=true/export first_initialize=false/' $COUSTOM_CONFIGURATION_DIR/main.sh

    softwares=("helm" "kubectl" "docker" "python3" "ansible" "terraform")
    apps=("vscode" "whatsapp" "telegram" "google chrome" "zoom")

    echo -e "intallations file path" `pwd` "\n"

    echo -ne "Do you want to install:\n${softwares[@]}\n[y/n]\n"
    read confermation
    if [[ "$confermation" == "y" || "$confermation" == "Y" ]]
    then
        #snap
            sudo apt update -y
            sudo apt install snapd -y
        #helm
            curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
            sudo apt-get install apt-transport-https --yes
            echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
            sudo apt-get update -y
            sudo apt-get install helm -y
        #kubectl
            curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
            curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
            echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
            sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
        #docker
            sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	#python3
	    sudo apt-get install python3 -y
	#ansible
	    python3 -m pip install --user ansible -y
	#terraform
	    wget -O "https://apt.releases.hashicorp.com/gpg" | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
	    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	    sudo apt install terraform -y
    fi

    echo -ne "Do you want to install:\n${apps[@]}\n[y/n]\n"
    read confermation
    if [[ "$confermation" == "y" || "$confermation" == "Y" ]]
    then
        #vscode
            sudo snap install --classic code
        #whatsapp
            sudo snap install whatsapp-for-linux
        #telegram
            sudo snap install telegram-desktop
        #google chrome
            wget -O /tmp/google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo apt install /tmp/google-chrome-stable_current_amd64.deb
        #zoom
            wget -O /tmp/zoom_amd64.deb https://zoom.us/client/5.13.10.1208/zoom_amd64.deb
            sudo apt install /tmp/zoom_amd64.deb
        #
    fi
fi
