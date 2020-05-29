# azure-java-servicebus-logicapp

Java console app putting messages on an Azure Service Bus queue, triggering an Azure Logic App

## Links

- https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-java-how-to-use-queues
- https://docs.microsoft.com/en-us/azure/developer/java/sdk/java-sdk-azure-get-started
- https://search.maven.org/artifact/com.microsoft.azure/azure-servicebus/3.3.0/jar

---

## Java Project

- Generated with **mvn-generate.sh**
- Compiled with **build.sh**
- Executed with **run.sh**

### Versions

```
$ java -version
openjdk version "1.8.0_232"
OpenJDK Runtime Environment (Zulu 8.42.0.23-CA-macosx) (build 1.8.0_232-b18)
OpenJDK 64-Bit Server VM (Zulu 8.42.0.23-CA-macosx) (build 25.232-b18, mixed mode)

$ mvn -version
Apache Maven 3.6.3
```

### pom.xml entry for the Azure Service Bus SDK

```
    <dependency>
      <groupId>com.microsoft.azure</groupId>
      <artifactId>azure-servicebus</artifactId>
      <version>3.3.0</version>
    </dependency>
```

### Airport Data Messages

This app uses file **us_airports_flat.json** in this repo. 
Each line consists of a JSON document, like the following.
These are put on the Azure Service Queue as messages.

```
{
  "name": "Charlotte Douglas Intl",
  "city": "Charlotte",
  "country": "United States",
  "iata_code": "CLT",
  "latitude": "35.214",
  "longitude": "-80.943139",
  "altitude": "748",
  "timezone_num": "-5",
  "timezone_code": "America/New_York",
  "location": {
    "type": "Point",
    "coordinates": [
      -80.943139,
      35.214
    ]
  },
  "id": "4b98b172-2e9e-11ea-a7b6-7fc29890ecb3",
  "pk": "CLT"
}
```

### Compiling

```
$ ./build.sh

...

[INFO] Building jar: /Users/cjoakim/github/azure-java-servicebus-logicapp/servicebusdemo/target/servicebusdemo-1.0-SNAPSHOT.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  2.420 s
[INFO] Finished at: 2020-05-29T13:33:35-04:00
[INFO] ------------------------------------------------------------------------
done
```

### Executing the Java program to send Service Bus Messages

```
./run.sh

...
airport data read; line count: 1697
connString: ...
queueName:  events
SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
SLF4J: Defaulting to no-operation (NOP) logger implementation
SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.

sending message: {"name":"Miami Intl","city":"Miami","country":"United States","iata_code":"MIA","latitude":"25.79325","longitude":"-80.290556","altitude":"8","timezone_num":"-5","timezone_code":"America/New_York","location":{"type":"Point","coordinates":[-80.290556,25.79325]},"id":"4b96dcb7-2e9e-11ea-a7b6-7fc29890ecb3","pk":"MIA"}

sending message: {"name":"Hartsfield Jackson Atlanta Intl","city":"Atlanta","country":"United States","iata_code":"ATL","latitude":"33.636719","longitude":"-84.428067","altitude":"1026","timezone_num":"-5","timezone_code":"America/New_York","location":{"type":"Point","coordinates":[-84.428067,33.636719]},"id":"4b97a003-2e9e-11ea-a7b6-7fc29890ecb3","pk":"ATL"}

sending message: {"name":"Bradley Intl","city":"Windsor Locks","country":"United States","iata_code":"BDL","latitude":"41.938889","longitude":"-72.683222","altitude":"173","timezone_num":"-5","timezone_code":"America/New_York","location":{"type":"Point","coordinates":[-72.683222,41.938889]},"id":"4b986351-2e9e-11ea-a7b6-7fc29890ecb3","pk":"BDL"}

sending message: {"name":"Charlotte Douglas Intl","city":"Charlotte","country":"United States","iata_code":"CLT","latitude":"35.214","longitude":"-80.943139","altitude":"748","timezone_num":"-5","timezone_code":"America/New_York","location":{"type":"Point","coordinates":[-80.943139,35.214]},"id":"4b98b172-2e9e-11ea-a7b6-7fc29890ecb3","pk":"CLT"}

closing client...
client closed
done
```

---

## Azure Logic App



---

## Azure CosmosDB


