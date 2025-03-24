#!/bin/bash

question(){
    local app="$1" 
    echo
    read -p "Do you want to install $app? (y/n): " choice
    case "$choice" in 
        y|Y ) 
            echo "Installing $app..."
            echo
            return 0
            ;;
        n|N ) 
            echo "Skipping $app installation."
            echo
            return 1
            ;;
        * ) 
            echo
            echo "Invalid input. Please enter 'y' or 'n'."
            echo
            question
            ;;
    esac
}

########################################## APP INSTALL

app_install(){
    echo "Welcome $USER to the APP INSTALLER! 🚀"

    if question "an update"; then
	echo updating the machine
        bash ./update.sh
    fi
    
    # List all .sh files in the APPS directory and store them in an array
    apps=($(ls ./APPS/*.sh 2>/dev/null | xargs -n 1 basename | sed 's/\.sh$//'))

    # Check if any .sh files were found
    if [[ ${#apps[@]} -eq 0 ]]; then
        echo "No installation scripts found in ./APPS directory."
        exit 1
    fi

    # Loop through the list of app scripts
    for app in "${apps[@]}"; do
        if question "$app"; then
            if [[ -f "./APPS/$app.sh" ]]; then 
                echo "Running $app to install $app..."
                ./APPS/"$app".sh || { echo "Failed to execute $app"; exit 1; }
            else
                echo "Error: $app not found!"
                exit 1
            fi
        fi
    done
}

app_install

echo "##################################################"
echo
echo "DONE: $(basename "$0") has completed successfully! ✅"
