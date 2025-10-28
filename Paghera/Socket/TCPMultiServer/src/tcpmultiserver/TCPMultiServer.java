/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tcpmultiserver;

import java.net.*;
import java.io.*;
import java.util.Random;
   //Creazione di una classe per il Multrithreading
   class ServerThread extends Thread {
     private Socket socket;
     public ServerThread (Socket socket) {
       this.socket = socket;
     }
     //esecuzione del Thread sul Socket
     public void run() {
        Random rand = new Random();
        int count = 1;

        int numeroLotto = rand.nextInt(90); // Numero tra 0 e 99
        System.out.println(numeroLotto);
        
       try {
         DataInputStream is = new DataInputStream(socket.getInputStream());
         DataOutputStream os = new DataOutputStream(socket.getOutputStream());
         while(true) {
           String userInput = is.readLine();
           if (userInput == null || userInput.equals("QUIT")) {
                os.close();
                is.close();
           }
           
           if (numeroLotto > Integer.parseInt(userInput)) {
               os.writeBytes("Errato! Il numero ");
               os.writeBytes(userInput + " e' troppo basso" + '\n');
               os.writeBytes("Hai effettuato " + count + " tentativi/o" + '\n');
               count++;
           } else if (numeroLotto < Integer.parseInt(userInput)){
               os.writeBytes("Errato! Il numero ");
               os.writeBytes(userInput + " e' troppo alto" + '\n');
               os.writeBytes("Hai effettuato " + count + " tentativi/o" + '\n');
               count++;
           } else {
               os.writeBytes("Corretto!!" + '\n');
               os.writeBytes("Hai terminato il gioco con " + count + " tentativi/o" + '\n');
               count++;
                os.close();
                is.close();
                socket.close();
                System.exit(0);
           }
           
           System.out.println("Il Client ha scritto: " + userInput);
         }
         
       }
       catch (IOException e) {
         System.out.println("IOException: " + e);
       }
     }
   }
   //Classe Server per attivare la Socket
   public class TCPMultiServer {
     public void start() throws Exception {
       ServerSocket serverSocket = new ServerSocket(7777);
       //Ciclo infinito di ascolto dei Client
       while(true) {
         System.out.println("In attesa di chiamate dai Client... ");
         Socket socket = serverSocket.accept();
         System.out.println("Ho ricevuto una chiamata di apertura da:\n" + socket);
         ServerThread serverThread = new ServerThread(socket);
         //Il metodo che permette la gestione del servizio sull'oggetto appena creato
	serverThread.start();
       }
     }
     public static void main (String[] args) throws Exception {
       TCPMultiServer  tcpServer = new TCPMultiServer ();
      tcpServer.start();
     }
   }