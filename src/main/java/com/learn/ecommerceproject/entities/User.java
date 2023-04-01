package com.learn.ecommerceproject.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;
    private String userName;
    private String userEmail;
    private String userPassword;
    private String userhone;
    private String userpic;
    private String userAddress;
    private String userType;

    public User() {
    }

    public User(String userName, String userEmail, String userPassword, String userhone, String userpic, String userAddress,String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userhone = userhone;
        this.userpic = userpic;
        this.userAddress = userAddress;
        this.userType = userType;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserhone() {
        return userhone;
    }

    public void setUserhone(String userhone) {
        this.userhone = userhone;
    }

    public String getUserpic() {
        return userpic;
    }

    public void setUserpic(String userpic) {
        this.userpic = userpic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userhone=" + userhone + ", userpic=" + userpic + ", userAddress=" + userAddress + ", userType=" + userType + '}';
    }

    
    
    
}
