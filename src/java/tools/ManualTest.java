/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import dao.GenericDao;
import dao.IGeneric;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import models.Useraccount;

/**
 *
 * @author JOE
 */
public class ManualTest {

    public static void main(String[] args) throws IOException {
        IGeneric<Useraccount> generic = new GenericDao();
        String pw_hash = BCrypt.hashpw("test", BCrypt.gensalt());
        Date date = new Date();
        long time = date.getTime();
        Timestamp ts = new Timestamp(time);
        List<Useraccount> listUser;
        listUser = generic.manageData(new Useraccount(), "username", "atlanticaid2@gmail.com", new String(), false, false);
        int minutes = 60;
        long m=minutes*60*1000;
        long t = listUser.get(0).getTimer().getTime();
        Timestamp theNewTimestamp=new Timestamp (t+m);
        if(theNewTimestamp.getTime() > time){
            System.out.println("yes");
        }
        System.out.println(theNewTimestamp);
        System.out.println(listUser.get(0).getTimer());
        System.out.println(ts);
//        generic.manageData(new Useraccount("atlanticaid2@gmail.com", pw_hash, 'Y', "Juang", "Nasution", ts), "", "", new String(), true, false);
    }

}
