# necceries softwares and apps installation
#!bin/bash
if ${first_initialize}
then
    softwares=("helm", "kubectl")
    apps=("vscode", "whatsapp", "telegram", "google chrome")
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
        #
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
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
            sudo apt install ./google-chrome-stable_current_amd64.deb
        #
    fi
fi
