package tp;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class TP0 {

	public static void main(String[] args) {
		
		InetAddress local;
		InetAddress server;
		InetAddress []myIPs;
		
		try {
			local = InetAddress.getLocalHost();
			System.out.println("L'adresse local est " + local.getHostAddress());
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			server = InetAddress.getByName("www.google.com");
			System.out.println("L'adresse du serveur est " + server.getHostAddress());
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			myIPs = InetAddress.getAllByName("www.facebook.com");
			for(int i = 0; i <myIPs.length; i++) {
				System.out.println("Addresses: " + myIPs[i].getHostAddress());
			}
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
