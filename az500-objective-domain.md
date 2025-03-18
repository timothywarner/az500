# Exam AZ-500: Microsoft Azure Security Technologies

![Microsoft Azure Security](images/az500-cover-slide-final.png)

## Exam Information
**Skills measured as of January 31, 2025**

---

## 🎯 Audience Profile

As the Azure security engineer, you implement, manage, and monitor security for resources in Azure, multi-cloud, and hybrid environments as part of an end-to-end infrastructure. You implement and manage security components and configurations by using Microsoft Defender for Cloud and other tools. You ensure that the infrastructure aligns with standards and best practices such as the Microsoft Cloud Security Benchmark (MCSB).

### Your responsibilities include:

- ✅ Managing the security posture
- ✅ Implementing threat protection
- ✅ Identifying and remediating vulnerabilities
- ✅ Implementing regulatory compliance controls for Azure infrastructure including identity and access, network, compute, storage, data, applications, asset management, backup and recovery, and DevOps security

As an Azure security engineer, you work with architects, administrators, and developers to plan and implement solutions that meet security and compliance requirements. You may also collaborate with security operations in responding to security incidents in Azure.

### Required Experience

- Practical experience in administration of Microsoft Azure and hybrid environments
- Strong familiarity with Microsoft Entra ID, as well as compute, network, and storage in Azure

---

## 📊 Skills at a Glance

| Skill Area | Weight |
|------------|--------|
| Secure identity and access | 15–20% |
| Secure networking | 20–25% |
| Secure compute, storage, and databases | 20–25% |
| Secure Azure using Microsoft Defender for Cloud and Microsoft Sentinel | 30–35% |

---

## 🔐 Detailed Skills Outline

### 1. Secure Identity and Access (15–20%)

#### 1.1 Manage Security Controls for Identity and Access

- Manage Azure built-in role assignments
- Manage custom roles, including Azure roles and Microsoft Entra roles
- Implement and manage Microsoft Entra Permissions Management
- Plan and manage Azure resources in Microsoft Entra Privileged Identity Management, including settings and assignments
- Implement multi-factor authentication (MFA) for access to Azure resources
- Implement Conditional Access policies for cloud resources in Azure

#### 1.2 Manage Microsoft Entra Application Access

- Manage access to enterprise applications in Microsoft Entra ID, including OAuth permission grants
- Manage Microsoft Entra app registrations
- Configure app registration permission scopes
- Manage app registration permission consent
- Manage and use service principals
- Manage managed identities

---

### 2. Secure Networking (20–25%)

#### 2.1 Plan and Implement Security for Virtual Networks

- Plan and implement Network Security Groups (NSGs) and Application Security Groups (ASGs)
- Manage virtual networks by using Azure Virtual Network Manager
- Plan and implement user-defined routes (UDRs)
- Plan and implement Virtual Network peering or VPN gateway
- Plan and implement Virtual WAN, including secured virtual hub
- Secure VPN connectivity, including point-to-site and site-to-site
- Implement encryption over ExpressRoute
- Configure firewall settings on Azure resources
- Monitor network security by using Network Watcher

#### 2.2 Plan and Implement Security for Private Access to Azure Resources

- Plan and implement virtual network Service Endpoints
- Plan and implement Private Endpoints
- Plan and implement Private Link services
- Plan and implement network integration for Azure App Service and Azure Functions
- Plan and implement network security configurations for an App Service Environment (ASE)
- Plan and implement network security configurations for an Azure SQL Managed Instance

#### 2.3 Plan and Implement Security for Public Access to Azure Resources

- Plan and implement Transport Layer Security (TLS) to applications, including Azure App Service and API Management
- Plan, implement, and manage an Azure Firewall, including Azure Firewall Manager and firewall policies
- Plan and implement an Azure Application Gateway
- Plan and implement an Azure Front Door, including Content Delivery Network (CDN)
- Plan and implement a Web Application Firewall (WAF)
- Recommend when to use Azure DDoS Protection Standard

---

### 3. Secure Compute, Storage, and Databases (20–25%)

#### 3.1 Plan and Implement Advanced Security for Compute

- Plan and implement remote access to virtual machines, including Azure Bastion and just-in-time (JIT)
- Configure network isolation for Azure Kubernetes Service (AKS)
- Secure and monitor AKS
- Configure authentication for AKS
- Configure security monitoring for Azure Container Instances (ACIs)
- Configure security monitoring for Azure Container Apps (ACAs)
- Manage access to Azure Container Registry (ACR)
- Configure disk encryption, including Azure Disk Encryption (ADE), encryption at host, and confidential disk encryption
- Recommend security configurations for Azure API Management

#### 3.2 Plan and Implement Security for Storage

- Configure access control for storage accounts
- Manage storage account access keys
- Select and configure an appropriate method for access to Azure Files
- Select and configure an appropriate method for access to Azure Blob Storage
- Select and configure appropriate methods for protecting against data security threats, including:
  - Soft delete
  - Backups
  - Versioning
  - Immutable storage
- Configure Bring your own key (BYOK)
- Enable double encryption at the Azure Storage infrastructure level

#### 3.3 Plan and Implement Security for Azure SQL Database and Azure SQL Managed Instance

- Enable Microsoft Entra database authentication
- Enable database auditing
- Plan and implement dynamic masking
- Implement Transparent Data Encryption (TDE)
- Recommend when to use Azure SQL Database Always Encrypted

---

### 4. Secure Azure using Microsoft Defender for Cloud and Microsoft Sentinel (30–35%)

#### 4.1 Implement and Manage Enforcement of Cloud Governance Policies

- Create, assign, and interpret policies and initiatives in Azure Policy
- Configure Azure Key Vault network settings
- Configure access to Key Vault, including vault access policies and Azure Role Based Access Control
- Manage certificates, secrets, and keys
- Configure key rotation
- Perform backup and recovery of certificates, secrets, and keys
- Implement security controls to protect backups
- Implement security controls for asset management

#### 4.2 Manage Security Posture by Using Microsoft Defender for Cloud

- Identify and remediate security risks by using the Microsoft Defender for Cloud Secure Score and Inventory
- Assess compliance against security frameworks by using Microsoft Defender for Cloud
- Manage compliance standards in Microsoft Defender for Cloud
- Add custom standards to Microsoft Defender for Cloud
- Connect hybrid cloud and multi-cloud environments to Microsoft Defender for Cloud, including:
  - Amazon Web Services (AWS)
  - Google Cloud Platform (GCP)
- Implement and use Microsoft Defender External Attack Surface Management (EASM)

#### 4.3 Configure and Manage Threat Protection by Using Microsoft Defender for Cloud

- Enable workload protection services in Microsoft Defender for Cloud
- Configure Microsoft Defender for:
  - Servers
  - Databases
  - Storage
- Implement and manage agentless scanning for virtual machines in Microsoft Defender for Servers
- Implement and manage Microsoft Defender Vulnerability Management for Azure virtual machines
- Connect to and configure settings in Microsoft Defender for Cloud Devops Security, including:
  - GitHub
  - Azure DevOps
  - GitLab

#### 4.4 Configure and Manage Security Monitoring and Automation Solutions

- Manage and respond to security alerts in Microsoft Defender for Cloud
- Configure workflow automation by using Microsoft Defender for Cloud
- Monitor network security events and performance data by configuring data collection rules (DCRs) in Azure Monitor
- Configure data connectors in Microsoft Sentinel
- Enable analytics rules in Microsoft Sentinel
- Configure automation in Microsoft Sentinel