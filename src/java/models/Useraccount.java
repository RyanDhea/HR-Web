package models;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Juang Nasution
 */
@Entity
@Table(name = "USERACCOUNT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Useraccount.findAll", query = "SELECT u FROM Useraccount u")
    , @NamedQuery(name = "Useraccount.findByUsername", query = "SELECT u FROM Useraccount u WHERE u.username = :username")
    , @NamedQuery(name = "Useraccount.findByPassword", query = "SELECT u FROM Useraccount u WHERE u.password = :password")
    , @NamedQuery(name = "Useraccount.findByStatus", query = "SELECT u FROM Useraccount u WHERE u.status = :status")
    , @NamedQuery(name = "Useraccount.findByFirstname", query = "SELECT u FROM Useraccount u WHERE u.firstname = :firstname")
    , @NamedQuery(name = "Useraccount.findByLastname", query = "SELECT u FROM Useraccount u WHERE u.lastname = :lastname")})
public class Useraccount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "USERNAME")
    private String username;
    @Basic(optional = false)
    @Column(name = "PASSWORD")
    private String password;
    @Basic(optional = false)
    @Column(name = "STATUS")
    private Character status;
    @Column(name = "FIRSTNAME")
    private String firstname;
    @Column(name = "LASTNAME")
    private String lastname;

    public Useraccount() {
    }

    public Useraccount(String username) {
        this.username = username;
    }

    public Useraccount(String username, String password, Character status) {
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (username != null ? username.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Useraccount)) {
            return false;
        }
        Useraccount other = (Useraccount) object;
        if ((this.username == null && other.username != null) || (this.username != null && !this.username.equals(other.username))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "models.Useraccount[ username=" + username + " ]";
    }
    
}
