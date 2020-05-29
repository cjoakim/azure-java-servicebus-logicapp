#!/bin/bash

# Chris Joakim, Microsoft, 2020/02/21

# azure-specific values
resource_group="cjoakim-logic"
rg_region="eastus"

# construct unique time-based names for the deployment output files
name="logicapp"
epoch_time=`date +%s`
dep_name=""$epoch_time"-"$name"-deployment"

echo "resource_group:       "$resource_group
echo "epoch_time:           "$epoch_time

#az login

echo '=========='
echo 'az group list...'
az group list 

echo 'Create the Resource Group (RG) with command: az group create...'
az group create --name $resource_group --location $rg_region

echo 'Deploy to the Resource Group (RG) with command: az group deployment create...'
az group deployment create \
  --name $dep_name \
  --resource-group $resource_group \
  --template-file logic-app-template.json \
  --parameters @logic-app-parameters.json


# ==========

https://microsoft.github.io/AzureTipsAndTricks/blog/tip159.html

{
    "method": "post",
    "headers": {
        "x-ms-documentdb-raw-partitionkey": "postal_codes_oh.csv"
    },
    "path": "/dbs/dev/colls/simulations/docs",
    "host": {
        "connection": {
            "name": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakim-logic/providers/Microsoft.Web/connections/documentdb"
        }
    },
    "body": {
        "body": {
            "Id": "JTJmc2ltdWxhdGlvbnMlMmZwb3N0YWxfY29kZXNfb2guY3N2",
            "Name": "postal_codes_oh.csv",
            "DisplayName": "postal_codes_oh.csv",
            "Path": "/simulations/postal_codes_oh.csv",
            "LastModified": "2020-02-21T17:06:32Z",
            "Size": 80376,
            "MediaType": "text/csv",
            "IsFolder": false,
            "ETag": "\"0x8D7B6F0667C1F47\"",
            "FileLocator": "JTJmc2ltdWxhdGlvbnMlMmZwb3N0YWxfY29kZXNfb2guY3N2",
            "LastModifiedBy": null
        },
        "pk": "postal_codes_oh.csv"
    }
}

triggerBody()?['Name']
{
"pk": 
  "body @{body(triggerBody())},

}

{
  "code": "BadRequest",
  "message": "Partition key [postal_codes_oh.csv] is invalid.\r\nActivityId: 35e3d7db-75cc-4ed3-80a9-17a3d9a20c9d, \r\nRequestStartTime: 2020-02-21T17:06:42.4446296Z, RequestEndTime: 2020-02-21T17:06:42.4446296Z,  Number of regions attempted:1\r\n, Microsoft.Azure.Documents.Common/2.9.2"
}

{
  "id": @{triggerBody()?['Id']},
  "pk": @{triggerBody()?['Name']},
  "body": @{triggerBody()}
}


{
  "code": "BadRequest",
  "message": "Message: {\"Errors\":[\"The partition key supplied in 
  x-ms-partitionkey header has fewer components than defined in the the collection.\"]}\r\nActivityId: 0aefdcba-f8f3-408a-8dd8-25044fe6ac45, Request URI: /apps/274509a2-d536-4a09-b0a3-f4fd526feb25/services/685a235b-f741-4e78-bdcb-090aeb081948/partitions/63fa0093-7d23-42f7-8380-4ad81341b9f0/replicas/132267756015606708p/, RequestStats: \r\nRequestStartTime: 2020-02-21T16:45:53.3280292Z, RequestEndTime: 2020-02-21T16:45:53.3580260Z,  Number of regions attempted:1\r\nResponseTime: 2020-02-21T16:45:53.3580260Z, StoreResult: StorePhysicalAddress: rntbd://cdb-ms-prod-eastus1-fd32.documents.azure.com:14182/apps/274509a2-d536-4a09-b0a3-f4fd526feb25/services/685a235b-f741-4e78-bdcb-090aeb081948/partitions/63fa0093-7d23-42f7-8380-4ad81341b9f0/replicas/132267756015606708p/, LSN: 1, GlobalCommittedLsn: 1, PartitionKeyRangeId: 0, IsValid: True, StatusCode: 400, SubStatusCode: 1001, RequestCharge: 0, ItemLSN: -1, SessionToken: 1, UsingLocalLSN: False, TransportException: null, ResourceType: Document, OperationType: Create\r\n, SDK: Microsoft.Azure.Documents.Common/2.9.2"
}
{
  "body": {
    "Id": "JTJmc2ltdWxhdGlvbnMlMmZwb3N0YWxfY29kZXNfY3QuY3N2",
    "Name": "postal_codes_ct.csv",
    "DisplayName": "postal_codes_ct.csv",
    "Path": "/simulations/postal_codes_ct.csv",
    "LastModified": "2020-02-21T16:45:46Z",
    "Size": 24394,
    "MediaType": "text/csv",
    "IsFolder": false,
    "ETag": "\"0x8D7B6ED7FE51E88\"",
    "FileLocator": "JTJmc2ltdWxhdGlvbnMlMmZwb3N0YWxfY29kZXNfY3QuY3N2",
    "LastModifiedBy": null
  },
  "pk": "/simulations/postal_codes_ct.csv"
}

# Body 
# {
#   "Id": "JTJmc2ltdWxhdGlvbnMlMmZwb3N0YWxfY29kZXNfY3QuY3N2",
#   "Name": "postal_codes_ct.csv",
#   "DisplayName": "postal_codes_ct.csv",
#   "Path": "/simulations/postal_codes_ct.csv",
#   "LastModified": "2020-02-21T16:31:08Z",
#   "Size": 24394,
#   "MediaType": "text/csv",
#   "IsFolder": false,
#   "ETag": "\"0x8D7B6EB74A77588\"",
#   "FileLocator": "JTJmc2ltdWxhdGlvbnMlMmZwb3N0YWxfY29kZXNfY3QuY3N2",
#   "LastModifiedBy": null
# }

# ==========

# $ az login
# You have logged in. Now let us find all the subscriptions to which you have access...
# [
#   {
#     "cloudName": "AzureCloud",
#     "homeTenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
#     "id": "61761119-d249-4507-90c6-a16517e1874c",
#     "isDefault": true,
#     "managedByTenants": [
#       {
#         "tenantId": "2f4a9838-26b7-47ee-be60-ccc1fdec5953"
#       }
#     ],
#     "name": "Microsoft Azure Internal Consumption",
#     "state": "Enabled",
#     "tenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
#     "user": {
#       "name": "chjoakim@microsoft.com",
#       "type": "user"
#     }
#   },
#   {
#     "cloudName": "AzureCloud",
#     "homeTenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
#     "id": "97227f43-3143-4d5f-921c-bc9de25314e2",
#     "isDefault": false,
#     "managedByTenants": [],
#     "name": "Microsoft Azure Internal Consumption",
#     "state": "Enabled",
#     "tenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
#     "user": {
#       "name": "chjoakim@microsoft.com",
#       "type": "user"
#     }
#   },
#   {
#     "cloudName": "AzureCloud",
#     "homeTenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
#     "id": "d21a0e9f-5e29-4b39-8ba5-0e189bc5fe2d",
#     "isDefault": false,
#     "managedByTenants": [],
#     "name": "Edge DevTools Client",
#     "state": "Enabled",
#     "tenantId": "72f988bf-86f1-41af-91ab-2d7cd011db47",
#     "user": {
#       "name": "chjoakim@microsoft.com",
#       "type": "user"
#     }
#   },
#   {
#     "cloudName": "AzureCloud",
#     "homeTenantId": "b9d7f5f1-da5b-4f62-80c3-4d06030ff5f5",
#     "id": "395cecaf-bfc0-46c3-b285-eaddfd065aa8",
#     "isDefault": false,
#     "managedByTenants": [],
#     "name": "Howden Group Ltd(Converted to EA)",
#     "state": "Enabled",
#     "tenantId": "b9d7f5f1-da5b-4f62-80c3-4d06030ff5f5",
#     "user": {
#       "name": "chjoakim@microsoft.com",
#       "type": "user"
#     }
#   }
# ]
# [~/github/cj-azure/automation/arm/logic_app]$ l
# total 32
# drwxr-xr-x  5 cjoakim  staff   160 Feb 21 11:14 .
# drwxr-xr-x  8 cjoakim  staff   256 Feb 21 11:11 ..
# -rwxr-xr-x@ 1 cjoakim  staff   825 Feb 21 11:15 deploy-logic-app.sh
# -rw-r--r--@ 1 cjoakim  staff  1421 Feb 21 11:16 logic-app-parameters.json
# -rw-r--r--@ 1 cjoakim  staff  6370 Feb 21 11:14 logic-app-template.json
# [~/github/cj-azure/automation/arm/logic_app]$ chmod 744 *.sh
# [~/github/cj-azure/automation/arm/logic_app]$ ./deploy-logic-app.sh
# resource_group:       cjoakim-logic
# epoch_time:           1582301828
# ==========
# az group list...
# [
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakim-function-test",
#     "location": "centralus",
#     "managedBy": null,
#     "name": "cjoakim-function-test",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimstorage",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimstorage",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/NetworkWatcherRG",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "NetworkWatcherRG",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimcosmossql",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimcosmossql",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimeventhubs",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimeventhubs",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimservicebus",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimservicebus",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimredis",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimredis",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimloganalytics",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimloganalytics",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimakv",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimakv",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimacr",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimacr",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimdsvm",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimdsvm",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimpostgresql",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakimpostgresql",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   },
#   {
#     "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakim-logic",
#     "location": "eastus",
#     "managedBy": null,
#     "name": "cjoakim-logic",
#     "properties": {
#       "provisioningState": "Succeeded"
#     },
#     "tags": null,
#     "type": "Microsoft.Resources/resourceGroups"
#   }
# ]
# Create the Resource Group (RG) with command: az group create...
# {
#   "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakim-logic",
#   "location": "eastus",
#   "managedBy": null,
#   "name": "cjoakim-logic",
#   "properties": {
#     "provisioningState": "Succeeded"
#   },
#   "tags": null,
#   "type": "Microsoft.Resources/resourceGroups"
# }
# Deploy to the Resource Group (RG) with command: az group deployment create...
# {
#   "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakim-logic/providers/Microsoft.Resources/deployments/1582301828-logicapp-deployment",
#   "location": null,
#   "name": "1582301828-logicapp-deployment",
#   "properties": {
#     "correlationId": "9df81db0-d8dd-49d8-ae5d-4d622fab2f28",
#     "debugSetting": null,
#     "dependencies": [
#       {
#         "dependsOn": [
#           {
#             "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakim-logic/providers/Microsoft.Logic/workflows/cjoakimlogicaci",
#             "resourceGroup": "cjoakim-logic",
#             "resourceName": "cjoakimlogicaci",
#             "resourceType": "Microsoft.Logic/workflows"
#           }
#         ],
#         "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakim-logic/providers/Microsoft.Logic/workflows/cjoakimlogicaci/providers/microsoft.insights/diagnosticSettings/service",
#         "resourceGroup": "cjoakim-logic",
#         "resourceName": "cjoakimlogicaci/microsoft.insights/service",
#         "resourceType": "Microsoft.Logic/workflows/providers/diagnosticSettings"
#       }
#     ],
#     "duration": "PT1M23.9087108S",
#     "mode": "Incremental",
#     "onErrorDeployment": null,
#     "outputResources": [
#       {
#         "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakimloganalytics/providers/Microsoft.OperationsManagement/solutions/LogicAppsManagement(cjoakimloganalytics1)",
#         "resourceGroup": "cjoakimloganalytics"
#       },
#       {
#         "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakim-logic/providers/Microsoft.Logic/workflows/cjoakimlogicaci",
#         "resourceGroup": "cjoakim-logic"
#       },
#       {
#         "id": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourceGroups/cjoakim-logic/providers/Microsoft.Logic/workflows/cjoakimlogicaci/providers/microsoft.insights/diagnosticSettings/service",
#         "resourceGroup": "cjoakim-logic"
#       }
#     ],
#     "outputs": null,
#     "parameters": {
#       "definition": {
#         "type": "String",
#         "value": "{\"contentVersion\":\"1.0.0.0\",\"parameters\":{},\"actions\":{},\"triggers\":{},\"outputs\":{},\"$schema\":\"https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#\"}"
#       },
#       "diagnosticsApiVersion": {
#         "type": "String",
#         "value": "2016-09-01"
#       },
#       "logicAppApiVersion": {
#         "type": "String",
#         "value": "2016-10-01"
#       },
#       "logicAppState": {
#         "type": "String",
#         "value": "Enabled"
#       },
#       "logsEnabled": {
#         "type": "Bool",
#         "value": true
#       },
#       "omsSolutionApiVersion": {
#         "type": "String",
#         "value": "2015-11-01-preview"
#       },
#       "omsSolutionLocation": {
#         "type": "String",
#         "value": "eastus"
#       },
#       "omsSolutionName": {
#         "type": "String",
#         "value": "LogicAppsManagement"
#       },
#       "omsWorkspaceId": {
#         "type": "String",
#         "value": "/subscriptions/61761119-d249-4507-90c6-a16517e1874c/resourcegroups/cjoakimloganalytics/providers/microsoft.operationalinsights/workspaces/cjoakimloganalytics1"
#       },
#       "omsWorkspaceName": {
#         "type": "String",
#         "value": "cjoakimloganalytics1"
#       },
#       "omsWorkspaceResourceGroupName": {
#         "type": "String",
#         "value": "cjoakimloganalytics"
#       },
#       "parameters": {
#         "type": "Object",
#         "value": {}
#       },
#       "resourceDeploymentApiVersion": {
#         "type": "String",
#         "value": "2017-05-10"
#       },
#       "retentionDays": {
#         "type": "Int",
#         "value": 0
#       },
#       "retentionPolicyEnabled": {
#         "type": "Bool",
#         "value": false
#       },
#       "tags": {
#         "type": "Object",
#         "value": {}
#       },
#       "workflowLocation": {
#         "type": "String",
#         "value": "eastus"
#       },
#       "workflowName": {
#         "type": "String",
#         "value": "cjoakimlogicaci"
#       },
#       "workflowSchema": {
#         "type": "String",
#         "value": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#"
#       }
#     },
#     "parametersLink": null,
#     "providers": [
#       {
#         "id": null,
#         "namespace": "Microsoft.Logic",
#         "registrationPolicy": null,
#         "registrationState": null,
#         "resourceTypes": [
#           {
#             "aliases": null,
#             "apiVersions": null,
#             "capabilities": null,
#             "locations": [
#               "eastus"
#             ],
#             "properties": null,
#             "resourceType": "workflows"
#           },
#           {
#             "aliases": null,
#             "apiVersions": null,
#             "capabilities": null,
#             "locations": [
#               null
#             ],
#             "properties": null,
#             "resourceType": "workflows/providers/diagnosticSettings"
#           }
#         ]
#       },
#       {
#         "id": null,
#         "namespace": "Microsoft.Resources",
#         "registrationPolicy": null,
#         "registrationState": null,
#         "resourceTypes": [
#           {
#             "aliases": null,
#             "apiVersions": null,
#             "capabilities": null,
#             "locations": [
#               null
#             ],
#             "properties": null,
#             "resourceType": "deployments"
#           }
#         ]
#       }
#     ],
#     "provisioningState": "Succeeded",
#     "template": null,
#     "templateHash": "5176432674754305631",
#     "templateLink": null,
#     "timestamp": "2020-02-21T16:18:37.835107+00:00"
#   },
#   "resourceGroup": "cjoakim-logic",
#   "type": "Microsoft.Resources/deployments"
# }