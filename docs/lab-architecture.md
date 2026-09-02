# Network Architecture & SOC Topology

## Executive Overview
This document outlines the network topology, IP schema, software configurations, and log telemetry flow for the Enterprise SOC Detection & Response Lab. The entire environment is isolated within a private hypervisor network, permitting safe adversary emulation, telemetry ingestion, and rule validation.

---

## 📐 Network Topology & Diagram

```text
               +------------------------------------+
               |           Host System              |
               | (VirtualBox / VMware Host-Only)    |
               +------------------------------------+
                                 |
        +------------------------+------------------------+
        |                        |                        |
        v                        v                        v
+------------------+   +------------------+   +------------------+
|   Kali Linux     |   |   Windows 11     |   |   AlmaLinux 9    |
|   (Attacker)     |   |    (Target)      |   | (SIEM / Manager) |
|  192.168.10.5    |   |  192.168.10.10   |   |  192.168.10.15   |
+------------------+   +------------------+   +------------------+
  Attacks:                Telemetry:             Ingestion & Alerts:
  - Hydra (RDP)           - Security Logs        - Wazuh Indexer
  - Metasploit            - Sysmon v15           - Wazuh Dashboard
  - Encoded PowerShell    - Wazuh Agent          - Custom Rules Engine
