import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.io.OutputStream;
public class BMPRecv{
    public static byte[] short2byte(short s){
		byte[] res = new byte[2];
		res[1] = (byte)((s & 0xFF));
		res[0] = (byte)(((s >> 8) & 0xFF));
		return res;
	}
    public static void main(String[] args)throws IOException,InterruptedException {
        InetAddress bindIP = InetAddress.getByName(args[0]);
        DatagramSocket socket = new DatagramSocket(20000,bindIP);

        byte[] image = new byte[80454];
        int field_count = 20;
        int buffer_size = 4 + field_count*2; 
		    byte[] buf = new byte[buffer_size];
		    DatagramPacket packet = new DatagramPacket(buf,buf.length);
        int count = 0;
        int pos = 0;
            System.out.println("here");
		    while(pos < 80454){
		System.out.println(pos);
            socket.receive(packet);
            count++;
            //System.out.println(pos);
            try{
                byte[] bytes = packet.getData();
                if(80454-pos < buffer_size - 4){
                  System.arraycopy(bytes, 4, image, pos, 80454-pos); 
                  pos += 80454-pos;
                }else{
                  System.arraycopy(bytes, 4, image, pos, buffer_size - 4); 
                  pos += (buffer_size - 4);
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            System.out.println(pos);
        } 
        try{
            OutputStream out = new FileOutputStream("recon.bmp");
            out.write(image);
            //out.flush();
            out.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
