terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.10.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
  #  backend "azurerm" {
  #     resource_group_name  = "dushyrg"          # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
  #     storage_account_name = "randomsto"                              # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
  #     container_name       = "terenamm"                               # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
  #     key                  = "terraform.tfstate"                # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  #   }

}


provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "afd16d4c-a9a7-4226-a637-b843d1e25f1e"
}

provider "random" {

}

