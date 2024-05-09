import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;


public class BMPSend{
    public static byte[] short2byte(short s){
		byte[] res = new byte[2];
		res[1] = (byte)((s & 0xFF));
		res[0] = (byte)(((s >> 8) & 0xFF));
		return res;
	}
    public static void main(String[] args)throws IOException,InterruptedException {
        try{
            DatagramSocket socket = new DatagramSocket(20001);
            InputStream in = new FileInputStream(args[0]);
            int field_count = 20;
            int buffer_size = 4 + field_count*2; 
            byte[] buffer = new byte[buffer_size];
            short i = 0;
            while((in.read(buffer, 4, buffer_size-4))!= -1){
                if(i % 1 == 0) Thread.sleep(1);
                byte[] index = short2byte(i);
                System.arraycopy(index,0,buffer,2,2);
                i += 1;
		            if(i == 262144) break;
                DatagramPacket packet = new DatagramPacket(buffer,buffer_size,InetAddress.getByName("10.0.0.1"),20000);
                socket.send(packet);
            }
            // int buffer_size = 1000;
            // byte[] buffer = new byte[buffer_size];
            // for(short i = 0; i < 1;i++){
            //   byte[] index = short2byte(i);
            //   System.arraycopy(index,0,buffer,0,2);
            //   DatagramPacket packet = new DatagramPacket(buffer,buffer_size,InetAddress.getByName("10.0.0.1"),20000);
            //   socket.send(packet);
            // }
            System.out.println(i);
            socket.close();
            in.close();
        } catch (Exception e){
            e.printStackTrace();
        }

    }
}