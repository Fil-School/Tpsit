package socketserver;

import java.io.*;
import java.net.*;

public class SocketServer {
    public static void main(String[] args) throws Exception {
        String clientNumber;
        int number;
        int clientSumm = 0;

        ServerSocket welcomeSocket = new ServerSocket(6666);
        System.out.println("Server in ascolto sulla porta 6666...");

            Socket connectionSocket = welcomeSocket.accept();
            System.out.println("Client connesso: " + connectionSocket.getInetAddress());

            BufferedReader inFromClient = new BufferedReader(
                new InputStreamReader(connectionSocket.getInputStream())
            );

            PrintWriter writer = new PrintWriter(connectionSocket.getOutputStream(), true);

            clientNumber = inFromClient.readLine();
                
            System.out.println(clientNumber);
            number = Integer.parseInt(clientNumber);
                
            clientSumm = clientSumm + number;

            writer.println(clientSumm);
            
            while (number!=0) {
                
                clientNumber = inFromClient.readLine();
                
                System.out.println(clientNumber);
                number = Integer.parseInt(clientNumber);
                
                clientSumm = clientSumm + number;

                writer.println(clientSumm);
                
                //capitalizedSentence = clientSentence.toUpperCase();
                //writer.println(capitalizedSentence);
                //writer.println("Lunghezza: " + clientSentence.length());
            }
            
            writer.println(clientSumm);
            
            
            
            connectionSocket.close();
        }
    }
