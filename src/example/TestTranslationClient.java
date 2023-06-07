package example;
import translation.*;

import javax.xml.rpc.ServiceException;
import java.rmi.RemoteException;

public class TestTranslationClient {
    public static void main(String[] args) {
        EnglishChineseLocator locator = new EnglishChineseLocator();
        EnglishChineseSoap_PortType service = null;
        try {
            service = locator.getEnglishChineseSoap();
        } catch (ServiceException e) {
            throw new RuntimeException(e);
        }

        String[] reply = new String[0];
        try {
            reply = service.translatorString("house");
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        }
        for (int i = 0; i < reply.length; i++) {
            System.out.println(reply[i]);
        }
    }
}
