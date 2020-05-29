#!/bin/bash

# Shell script to initially generate this Java/Maven project.
# Chris Joakim, Microsoft, 2020/05/29

mvn archetype:generate \
    -DgroupId=com.chrisjoakim.azure \
    -DartifactId=servicebusdemo \
    -DarchetypeArtifactId=maven-archetype-quickstart \
    -DinteractiveMode=false

echo 'done'

# Sample output:
# [INFO] Parameter: package, Value: com.chrisjoakim.azure
# [INFO] Parameter: groupId, Value: com.chrisjoakim.azure
# [INFO] Parameter: artifactId, Value: servicebusdemo
# [INFO] Parameter: packageName, Value: com.chrisjoakim.azure
# [INFO] Parameter: version, Value: 1.0-SNAPSHOT
# [INFO] project created from Old (1.x) Archetype in dir: /Users/cjoakim/github/azure-java-servicebus-logicapp/servicebusdemo
# [INFO] ------------------------------------------------------------------------
# [INFO] BUILD SUCCESS
# [INFO] ------------------------------------------------------------------------
# [INFO] Total time:  7.851 s
# [INFO] Finished at: 2020-05-29T11:31:32-04:00
# [INFO] ------------------------------------------------------------------------
