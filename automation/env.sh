#!/bin/bash

# Bash shell that defines parameters and environment variables used 
# in this app, and is "sourced" by the other scripts in this repo.
# Chris Joakim, Microsoft, 2020/05/29

# ===

export subscription=$AZURE_SUBSCRIPTION_ID
export user=$USER
export primary_region="eastus"
export primary_rg="cjoakimdemo"

export cosmos_sql_region=$primary_region
export cosmos_sql_rg=$primary_rg
export cosmos_sql_acct_name="cjoakimcosmosdemo"
export cosmos_sql_acct_consistency="Session"    # {BoundedStaleness, ConsistentPrefix, Eventual, Session, Strong}
export cosmos_sql_acct_kind="GlobalDocumentDB"  # {GlobalDocumentDB, MongoDB, Parse}
export cosmos_sql_dbname="dev"
export cosmos_sql_events_collname="events"
export cosmos_sql_events_pk="/pk"
export cosmos_sql_events_ru="400"

export servicebus_region=$primary_region
export servicebus_rg=$primary_rg
export servicebus_namespace="cjoakimsvcbusdemo"
export servicebus_sku="Standard"
export servicebus_queuename="events"
export servicebus_queue_status="Active"
export servicebus_keyname="RootManageSharedAccessKey"
