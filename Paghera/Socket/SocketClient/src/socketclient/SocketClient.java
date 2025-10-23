package socketclient;

import java.io.*;
import java.net.*;

public class SocketClient {

    public static void main(String[] args) throws Exception {
        String sentence;
        String response;
        String partialSum;

        BufferedReader inFromUser = new BufferedReader(new InputStreamReader(System.in));

        System.out.print("Inserisci un numero da inviare al server: ");
        sentence = inFromUser.readLine();

        Socket clientSocket = new Socket("localhost", 6666);

        // Invia la stringa al server
        PrintWriter outToServer = new PrintWriter(clientSocket.getOutputStream(), true);
        outToServer.println(sentence);
        
        
        // Legge le due risposte del server
        BufferedReader inFromServer = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
        partialSum = inFromServer.readLine();
        System.out.println("La somma parziale è " + partialSum);
        
        
        while (!sentence.equals("0")) {
            System.out.print("Inserisci un numero da inviare al server: ");
            sentence = inFromUser.readLine();
            
            outToServer.println(sentence);
            
            partialSum = inFromServer.readLine();
            System.out.println("La somma parziale è " + partialSum);
        }
        
        String finalResponse = inFromServer.readLine();
        int intFinalResponse = Integer.parseInt(finalResponse);
        
        System.out.println("Risposta Finale: " + intFinalResponse);
        
        /*
        while (inFromUser.readLine().equals("0")) {
            
            sentence = inFromUser.readLine();
            if (sentence.equals("0")) {
                break;
            } else {
                outToServer.println(sentence);
            }
            
            response = inFromServer.readLine();
            System.out.println(response);
        }
        */
    }
}
