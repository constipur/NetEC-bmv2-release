import java.io.IOException;
import java.io.InputStream;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileInputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;


public class LogTableSend{
    public static byte[] short2byte(short s){
		byte[] res = new byte[2];
		res[1] = (byte)((s & 0xFF));
		res[0] = (byte)(((s >> 8) & 0xFF));
		return res;
    }
    public static byte[] intToByteArray(int a) {   
        return new byte[] {   
                (byte) ((a >> 24) & 0xFF),   
                (byte) ((a >> 16) & 0xFF),      
                (byte) ((a >> 8) & 0xFF),      
                (byte) (a & 0xFF)   
            };   
        } 
    public static void main(String[] args)throws IOException,InterruptedException {
        try{
            DatagramSocket socket = new DatagramSocket(20001);
            BufferedReader reader = new BufferedReader(new FileReader(args[0]));
            int helper_field_count = 16;
            int buffer_size = 4 + 2 * helper_field_count; 
            int line_no = 0;
            String str = null;
            byte[] buffer = new byte[buffer_size];
            int[] table = new int[65536*3];
            while((str = reader.readLine()) != null){
                table[line_no++] = Integer.parseInt(str);
            }
            for (int i = 0;i < 65536 / 16;i++){
                byte[] key = short2byte((short)(i*16));
                System.arraycopy(key, 0, buffer, 2, 2);
                for (int j = 0;j < 16;j++){
                    byte[] value = short2byte((short)table[16*i+j]);
                    System.arraycopy(value, 0, buffer, 4 + 2 * j, 2);
                }
                DatagramPacket packet = new DatagramPacket(buffer,buffer_size,InetAddress.getByName("10.0.0.1"),19998);
                socket.send(packet);
                if (i % 2 == 0)Thread.sleep(1);
            }

            for (int i = 0;i < 65536 * 2 / 16;i++){
                byte[] key = intToByteArray(i*16);
                System.arraycopy(key, 0, buffer, 0, 4);
                for (int j = 0;j < 16;j++){
                    byte[] value = short2byte((short)table[65536 + 16*i+j]);
                    System.arraycopy(value, 0, buffer, 4 + 2 * j, 2);
                }
                DatagramPacket packet = new DatagramPacket(buffer,buffer_size,InetAddress.getByName("10.0.0.1"),19999);
                socket.send(packet);
                if (i % 2 == 0)Thread.sleep(1);
            }

        } catch (Exception e){
            e.printStackTrace();
        }
    }
}