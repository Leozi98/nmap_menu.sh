#!/bin/bash

# Function to clear the screen
clear_screen() {
    clear
}

# Function to display header
show_header() {
    clear_screen
    echo -e "\e[1;36m"
    echo "============================================"
    echo "           Nmap Automation Tool             "
    echo "           Termux Edition v1.0             "
    echo "============================================"
    echo -e "\e[0m"
}

# Function to check Nmap installation
check_nmap() {
    if ! command -v nmap &> /dev/null; then
        echo -e "\e[1;31mNmap is not installed!\e[0m"
        read -p "Install Nmap now? (y/n): " choice
        if [[ $choice == "y" || $choice == "Y" ]]; then
            pkg install nmap -y
        else
            exit 1
        fi
    fi
}

# Main function
main_menu() {
    while true; do
        show_header
        echo -e "\e[1;33mMENU OPTIONS:\e[0m"
        echo "1. Single Host Scan"
        echo "2. Local Network Scan"
        echo "3. Specific Port Scan"
        echo "4. Service Version Scan"
        echo "5. Target OS Scan"
        echo "6. Quick Scan (Top Ports)"
        echo "7. Save Results to File"
        echo "8. Exit"
        echo -e "\e[1;34m"
        read -p "Choose option (1-8): " option
        echo -e "\e[0m"

        case $option in
            1)
                read -p "Enter IP/host address: " target
                [ -z "$target" ] && echo -e "\e[1;31mError: Target cannot be empty!\e[0m" && continue
                nmap -v $target
                ;;
            2)
                read -p "Enter IP range (example: 192.168.1.0/24): " range
                [ -z "$range" ] && echo -e "\e[1;31mError: Range cannot be empty!\e[0m" && continue
                nmap -sn $range
                ;;
            3)
                read -p "Enter IP/host address: " target
                [ -z "$target" ] && echo -e "\e[1;31mError: Target cannot be empty!\e[0m" && continue
                read -p "Enter port (example: 80 or 1-1000): " port
                [ -z "$port" ] && echo -e "\e[1;31mError: Port cannot be empty!\e[0m" && continue
                nmap -p $port $target
                ;;
            4)
                read -p "Enter IP/host address: " target
                [ -z "$target" ] && echo -e "\e[1;31mError: Target cannot be empty!\e[0m" && continue
                nmap -sV $target
                ;;
            5)
                read -p "Enter IP/host address: " target
                [ -z "$target" ] && echo -e "\e[1;31mError: Target cannot be empty!\e[0m" && continue
                nmap -O $target
                ;;
            6)
                read -p "Enter IP/host address: " target
                [ -z "$target" ] && echo -e "\e[1;31mError: Target cannot be empty!\e[0m" && continue
                nmap -F $target
                ;;
            7)
                read -p "Enter IP/host address: " target
                [ -z "$target" ] && echo -e "\e[1;31mError: Target cannot be empty!\e[0m" && continue
                read -p "Output filename (without extension): " filename
                [ -z "$filename" ] && echo -e "\e[1;31mError: Filename cannot be empty!\e[0m" && continue
                if touch "$filename.txt" 2>/dev/null; then
                    nmap -oN "$filename.txt" $target
                    echo -e "\e[1;32mResults saved to: $(pwd)/$filename.txt\e[0m"
                else
                    echo -e "\e[1;31mError: Cannot write to file! Check permissions.\e[0m"
                fi
                ;;
            8)
                echo -e "\e[1;31mExiting...\e[0m"
                exit 0
                ;;
            *)
                echo -e "\e[1;31mInvalid choice!\e[0m"
                ;;
        esac

        read -p "Press Enter to continue..."
    done
}

# Execute program
check_nmap
main_menu