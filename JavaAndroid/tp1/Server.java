package tp1;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ServerSocket B;
		Socket C;
		
		try {
			B =  new ServerSocket(2023);
			System.out.println("Je suis le serveur j'attends un Client");
			C = B.accept();
			System.out.print("Un client vient de se connecter"+ C.getInetAddress());
			C.close();
			B.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
