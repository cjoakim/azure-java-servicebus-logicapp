#!/bin/bash

# Execute the Java code with Maven.
# Chris Joakim, Microsoft, 2020/05/29

mvn exec:java -Dexec.mainClass="com.chrisjoakim.azure.App" -Dexec.args="CLT"

echo 'done'
