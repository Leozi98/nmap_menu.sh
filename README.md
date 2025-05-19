# Nmap Automation Tool - Termux Edition

A simple Bash script that provides a menu-driven interface for common Nmap scanning tasks on Termux (Android).

## Features

- User-friendly menu interface
- Common Nmap scan options:
  - Single host scan
  - Local network scan
  - Specific port scan
  - Service version detection
  - OS detection
  - Quick scan (top ports)
- Results saving to file
- Automatic Nmap installation check

## Requirements

- Termux (Android)
- Nmap (will be installed automatically if missing)

## Installation

1. Copy the script to your Termux:
   ```bash
   git clone https://github.com/Leozi98/nmap_menu.sh.git
```

2. Make it executable:

   ```bash
   chmod +x nmap_menu.sh
```

## Usage

Run the script:
```bash
./nmap_menu.sh
```

Follow the on-screen menu options to perform various Nmap scans.

## Menu Options

1. **Single Host Scan**: Basic scan of a single host
2. **Local Network Scan**: Ping scan of a local network range
3. **Specific Port Scan**: Scan specific ports on a target
4. **Service Version Scan**: Detect service versions on target
5. **Target OS Scan**: Attempt to determine target's operating system
6. **Quick Scan**: Fast scan of most common ports
7. **Save Results**: Save scan results to a text file
8. **Exit**: Quit the program

## Notes

- Requires storage permission in Termux for saving files
- Some scans may require root privileges for full functionality
- Be ethical - only scan networks you have permission to scan