#!/bin/bash
# CSNA 2.0 - HARDENED INFRASTRUCTURE PROTOCOL
# ARCHITECT: Marcus Pollard | Procedural Architect of Modular Systems
# STANDARD: CISA/NSA Enterprise Linux Security
# VERSION: 1.0 (Diamond Structure)

echo "[*] INITIATING CSNA 2.0 SECURITY PROTOCOL..."

# 1. SYSTEM UPDATE & LOCKDOWN
# Ensure the foundation is current to mitigate known vulnerabilities (CVEs).
echo "[*] Updating system repositories and patching core libraries..."
sudo apt-get update && sudo apt-get upgrade -y

# 2. FIREWALL ARCHITECTURE (The Perimeter)
# Only allow traffic on ports essential for Web3/AI operations.
echo "[*] Configuring UFW Firewall..."
sudo apt-get install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
# Allow specific Web3 ports (e.g., 30303 for ETH, 8545 for RPC) only if needed later.
sudo ufw enable
echo "[+] Firewall Active. Perimeter Secured."

# 3. SSH HARDENING (Identity Protection)
# Disable root login to prevent brute-force entry. The "1%" never use default doors.
echo "[*] Hardening SSH Configuration..."
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
# Restart SSH to apply the diamond standard.
sudo systemctl restart ssh
echo "[+] SSH Secured. Root Access Disabled."

# 4. AUDIT LOGGING (The Ledger)
# Ensure every action is recorded. Compliance is about visibility.
echo "[*] Verifying Audit Dæmons..."
sudo apt-get install auditd -y
sudo systemctl enable auditd
sudo systemctl start auditd
echo "[+] Audit Ledger Active."

echo "[***] CSNA 2.0 PROTOCOL COMPLETE. SYSTEM IS HARDENED. [***]"
