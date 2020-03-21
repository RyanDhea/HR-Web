/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import dao.GenericDao;
import dao.IGeneric;
import java.text.ParseException;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import models.Useraccount;

/**
 *
 * @author JOE
 */
public class ManualTest {

    public static void main(String[] args) {
        IGeneric<Useraccount> generic = new GenericDao<>();
        String pw_hash = BCrypt.hashpw("test", BCrypt.gensalt());
        generic.manageData(new Useraccount("atlanticaid2@gmail.com", pw_hash, 'Y'), "", "", new String(), true, false);
    }

}
