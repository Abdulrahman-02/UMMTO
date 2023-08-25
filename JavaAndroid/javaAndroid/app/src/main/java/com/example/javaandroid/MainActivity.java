package com.example.javaandroid;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.fragment.app.FragmentActivity;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

/*
 * Main Activity class that loads {@link MainFragment}.
 */
public class MainActivity extends activity_main {

    private Socket socket = null;

    private String ip;
    private String port;
    private String sms;

    private EditText editIp;
    private EditText editPort;
    private EditText editSms;


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        editIp = editIp.findViewById(R.id.ip);
        editPort = editPort.findViewById(R.id.port);
        editSms = editSms.findViewById(R.id.message);

        /* if (savedInstanceState == null) {
            getSupportFragmentManager().beginTransaction()
                    .replace(R.id.main_browse_fragment, new MainFragment())
                    .commitNow();
        } */
    }

    public void Cliquer(View view) {
        Toast.makeText(this,"je viens de cliquer",Toast.LENGTH_LONG).show();

        // récupérer les données
        ip = editIp.getText().toString();
        Toast.makeText(this,"IP = " + ip,Toast.LENGTH_LONG).show();

        port = editPort.getText().toString();
        sms = editSms.getText().toString();

        new Thread(new ClientThread()).start();
    }

    class ClientThread implements Runnable {
        @Override
        public void run() {
            try {
              socket = new Socket(ip,Integer.parseInt(port));
              PrintWriter out = new PrintWriter(socket.getOutputStream());
              System.out.println(sms);
              System.out.flush();
              System.out.close();
              socket.close();
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }
}