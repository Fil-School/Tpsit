/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tcpmulticlient;

//Importo i package necessari
import java.net.*;
import java.io.*;
   public class TCPMultiClient {
     public void start()throws IOException {
       //Connessione della Socket con il Server
       Socket socket = new Socket("localhost", 7777);
       //Stream di byte da passare al Socket
       DataOutputStream os = new DataOutputStream(socket.getOutputStream());
       DataInputStream is = new DataInputStream(socket.getInputStream());
       BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));
       System.out.print("Per disconnettersi dal Server scrivere: QUIT\n");
       //Ciclo infinito per inserimento testo del Client
       
       boolean status = true;
       
       while (status == true) {
         System.out.print("Inserisci: ");
         String userInput = stdIn.readLine();
         if (userInput.equals("QUIT")) {
            os.close();
            is.close();
            socket.close();
         }
         os.writeBytes(userInput + '\n');
         String a1 = is.readLine();
         System.out.println(a1);
         System.out.println(is.readLine());
         
         if (a1.equals("Corretto!!")) {
         System.out.println(a1);
            os.close();
            is.close();
            socket.close();       
            status = false;
            System.out.println("Chiusura gioco in corso");
            System.exit(0);
         }
       }
       //Chiusura dello Stream e del Socket

     }
     public static void main (String[] args) throws Exception {
       TCPMultiClient tcpClient = new TCPMultiClient();
       tcpClient.start();
     }
   }