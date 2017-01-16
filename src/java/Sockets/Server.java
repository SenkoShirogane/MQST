/*
package Sockets;

import java.net.InetSocketAddress;
import java.net.UnknownHostException;
import java.util.Scanner;
import org.java_websocket.WebSocket;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

public class Server extends WebSocketServer{
    
    Scanner src = new Scanner(System.in);
    
    public InetSocketAddress var;
    public Server(int puerto) throws UnknownHostException {
		super(new InetSocketAddress(puerto));
		System.out.println("Esperando conexiones en el puerto " + puerto);		
    }
     
    @Override
    public void onOpen(WebSocket ws, ClientHandshake ch) {
        ws.send("Buenas tardes, ¿en qué puedo ayudarle?");
	System.out.println("Se ha iniciado una nueva conexión");
    }

    @Override
    public void onClose(WebSocket ws, int i, String string, boolean bln) {
        System.out.println("Se ha cerrado la conexión");
    }

    @Override
    public void onMessage(WebSocket ws, String mensaje) {
        System.out.println(mensaje);
        
        System.out.println("Escribe un mensaje al cliente");
        String msjServer = src.nextLine();
        ws.send(msjServer);
    }

    @Override
    public void onError(WebSocket ws, Exception e) {
        System.out.println("Error de conexión");
	e.printStackTrace();
    }
    
}
*/