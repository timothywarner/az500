# AZ-500 Lab Environment Setup Guide

This guide will help you prepare your environment for the hands-on labs in this AZ-500 crash course.

## Prerequisites

### Azure Subscription

You'll need an Azure subscription with:
- Owner or Contributor rights
- Sufficient quota for creating the following resources:
  - Virtual Networks
  - Virtual Machines (2-3 B-series VMs)
  - Storage Accounts
  - Key Vault
  - Microsoft Defender for Cloud (Standard tier features)

### Recommended Options:
1. **Azure Pass** (if provided by instructor)
2. **Free Azure Account** ([Create here](https://azure.microsoft.com/en-us/free/))
3. **Visual Studio Subscription** (formerly MSDN)
4. **Company subscription** (if allowed for training)

### Local Environment Setup

1. **Required Software:**
   - [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) (latest version)
   - [PowerShell 7+](https://github.com/PowerShell/PowerShell#get-powershell)
   - [Az PowerShell module](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps)
   - [Visual Studio Code](https://code.visualstudio.com/download)
   
2. **VS Code Extensions:**
   - [Azure Account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account)
   - [Azure CLI Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-cli)
   - [PowerShell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
   - [Azure Resource Manager Tools](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools)

## Quick Setup Steps

### 1. Verify Azure CLI Installation

```bash
# Check version
az --version

# Login to Azure
az login

# List subscriptions
az account list --output table

# Set your subscription (if you have multiple)
az account set --subscription "Your-Subscription-Name-or-ID"
```

### 2. Verify PowerShell Setup

```powershell
# Check PowerShell version
$PSVersionTable.PSVersion

# Install/update Az module if needed
Install-Module -Name Az -Force -AllowClobber -Scope CurrentUser

# Login to Azure
Connect-AzAccount

# List subscriptions
Get-AzSubscription

# Set your subscription (if you have multiple)
Set-AzContext -Subscription "Your-Subscription-Name-or-ID"
```

### 3. Create Resource Group for Labs

```bash
# Azure CLI
az group create --name AZ500-Labs --location eastus2

# PowerShell
New-AzResourceGroup -Name AZ500-Labs -Location eastus2
```

### 4. Enable Microsoft Defender for Cloud

For some labs, we'll use Microsoft Defender for Cloud. Enable it in advance:

1. Navigate to **Microsoft Defender for Cloud** in the Azure Portal
2. Go to **Environment Settings**
3. Select your subscription
4. Enable the **Servers** and **Databases** plans (you can disable after the course)
5. Set **Continuous export** to **On**

### 5. Download Lab Files

Clone this repository to have local access to all lab files:

```bash
git clone https://github.com/timothywarner/az500
cd az500
```

## Troubleshooting Tips

### Cannot Create Resources / Permission Issues
- Verify you have Owner or Contributor role on your subscription
- Check if you have any Resource Policy restrictions
- Ensure you're working in the correct subscription

### Azure CLI or PowerShell Connection Issues
- Re-authenticate with `az login` or `Connect-AzAccount`
- Check your internet connection
- Verify any proxy or firewall settings

### Resource Creation Fails
- Check your subscription quota limits
- Try a different region if you're hitting regional limits
- Ensure you've accepted any required marketplace terms

## Getting Help During Labs

If you encounter issues during the labs:
1. Check the lab instructions carefully for any hints
2. Ask the instructor during the session
3. Search the [Microsoft Q&A for Azure](https://docs.microsoft.com/en-us/answers/products/azure?product=all)

Good luck with your labs! 