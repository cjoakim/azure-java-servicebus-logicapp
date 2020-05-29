package com.chrisjoakim.azure;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import com.microsoft.azure.servicebus.Message;
import com.microsoft.azure.servicebus.QueueClient;
import com.microsoft.azure.servicebus.ReceiveMode;
import com.microsoft.azure.servicebus.primitives.ConnectionStringBuilder;
import com.microsoft.azure.servicebus.primitives.ServiceBusException;


/**
 * Java Client using the Azure Service Bus SDK to put messages on a queue.
 * @author Chris Joakim, Microsoft, 2020/05/29
 */
public class App {
	
    public static void main(String[] args) throws Exception {
    	
        List<String> airportData = readAirportData();
        
        // Read Azure Service Bus configuration from Environment Variables:
        String connString = System.getenv("AZURE_DEMO_SERVICEBUS_CONN_STRING");
        String queueName  = System.getenv("AZURE_DEMO_SERVICEBUS_QUEUE");
        System.out.println("connString: " + connString);
        System.out.println("queueName:  " + queueName);
        
        // Create a QueueClient for sending messages to Azure Service Bus
        QueueClient client = new QueueClient(
	    		new ConnectionStringBuilder(connString, queueName),
	    		ReceiveMode.PEEKLOCK);
        System.out.println("client Id:  " + client.getClientId());
        
        // Loop through both the lines of the Airport data, as well as the 
        // command-line arg tokens, and send messages to the Service Bus Queue
        // when the data line matches the token.
        for (int airportIdx = 0; airportIdx < airportData.size(); airportIdx++) {
        	String jsonLine = airportData.get(airportIdx);
        	for (int argIdx = 0; argIdx < args.length; argIdx++) {
        		String token = args[argIdx];
        		if (jsonLine.contains(token)) {
            		sendMessageSynch(client, jsonLine);
        		}
        	}
        }
        
        if (client != null) {
        	System.out.println("");
        	System.out.println("closing client...");
        	Thread.currentThread().sleep(3000);
        	client.close();
        	System.out.println("client closed");
        }
        System.exit(0);
    }
    
	private static List<String> readAirportData() throws Exception {
        
        String infile = "data/us_airports_flat.json";
		List<String> lines = new ArrayList<String>();
		Stream<String> stream = Files.lines(Paths.get(infile));
		stream.forEach(lines::add);
		System.out.println("airport data read; line count: " + lines.size());
		return lines;
	}
	
    private static void sendMessageSynch(QueueClient client, String messageText)
    		throws ServiceBusException, InterruptedException {

		System.out.println("");
		System.out.println("sending message: " + messageText);
	    Message msg = new Message(messageText);
	    client.send(msg);
    }
    
}
