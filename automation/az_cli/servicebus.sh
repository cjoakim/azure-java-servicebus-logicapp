#!/bin/bash

# Bash script with AZ CLI to automate the creation/deletion of my Azure Service Bus account.
# Chris Joakim, Microsoft, 2020/05/29
#
# See https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest
# Seehttps://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-quickstart-cli

# az login   <-- you'll occasionally have to execute this command

source ../env.sh

arg_count=$#
processed=0

delete() {
    processed=1
    echo 'deleting ServiceBus rg: '$servicebus_rg
    az group delete \
        --name $servicebus_rg \
        --subscription $subscription \
        --yes
}

create() {
    processed=1
    echo 'creating ServiceBus rg: '$servicebus_rg
    az group create \
        --location $servicebus_region \
        --name $servicebus_rg \
        --subscription $subscription

    echo 'creating ServiceBus namespace: '$servicebus_namespace
    az servicebus namespace create \
        --name $servicebus_namespace \
        --resource-group $servicebus_rg \
        --subscription $subscription \
        --location $servicebus_region \
        --sku $servicebus_sku

    echo 'creating ServiceBus queue: '$servicebus_queuename
    az servicebus queue create \
        --name $servicebus_queuename \
        --resource-group $servicebus_rg \
        --namespace-name $servicebus_namespace \
        --status $servicebus_queue_status
}

recreate() {
    processed=1
    delete
    create
    info 
}

info() {
    processed=1
    echo 'ServiceBus namespace show: '$servicebus_namespace
    az servicebus namespace show  \
        --name $servicebus_namespace \
        --resource-group $servicebus_rg \
        --subscription $subscription

    echo 'ServiceBus queue show: '$servicebus_queuename
    az servicebus queue show \
        --name $servicebus_queuename \
        --resource-group $servicebus_rg \
        --namespace-name $servicebus_namespace \
        --subscription $subscription

    echo 'ServiceBus authorization-rule show: '$servicebus_keyname
    az servicebus namespace authorization-rule show \
        --resource-group $servicebus_rg \
        --namespace-name $servicebus_namespace \
        --name $servicebus_keyname

    echo 'ServiceBus authorization-rule keys list: '$servicebus_keyname
    az servicebus namespace authorization-rule keys list \
        --resource-group $servicebus_rg \
        --namespace-name $servicebus_namespace \
        --name $servicebus_keyname
}

display_usage() {
    echo 'Usage:'
    echo './servicebus.sh delete  (disabled for now)'
    echo './servicebus.sh create'
    echo './servicebus.sh recreate'
    echo './servicebus.sh info'
}

# ========== "main" logic below ==========

if [ $arg_count -gt 0 ]
then
    for arg in $@
    do
        #if [ $arg == "delete" ];   then delete; fi 
        if [ $arg == "create" ];   then create; fi 
        if [ $arg == "recreate" ]; then recreate; fi 
        if [ $arg == "info" ];     then info; fi 
    done
fi

if [ $processed -eq 0 ]; then display_usage; fi

echo 'done'
