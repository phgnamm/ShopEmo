/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author PC
 */
public class UserDAO {
    private static final String LOGIN = "SELECT userID, fullName, roleID FROM tblUsers WHERE userID = ? AND password= ? ";
    private static final String SEARCH = "SELECT userID, fullName, roleID FROM tblUsers WHERE fullName like ? ";
    private static final String DELETE = "DELETE tblUsers WHERE userID = ? ";
    private static final String UPDATE = "UPDATE tblUsers SET  fullName = ?, roleID = ? WHERE userID = ? ";
     public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID_tmp = rs.getString("userID");
                     //check userID
                    if(!userID_tmp.equals(userID)){
                       return null; 
                    }
                    
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    user = new UserDTO(userID, fullName, roleID, "");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
     public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullname = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String password ="*****";
                    listUser.add(new UserDTO(userID, fullname, roleID, password));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return listUser;
    }
     
     
    public boolean delete(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
                check = ptm.executeUpdate() > 0 ? true : false;

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }
        public boolean update(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, user.getFullName());
                ptm.setString(2, user.getRoleID());
                ptm.setString(3, user.getUserID());
                check = ptm.executeUpdate() > 0 ? true : false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }
            public UserDTO getUserID(String userID) {
        String sql = "select * from tblUsers where userID =?";
        try {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
            ptm.setString(1, userID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                UserDTO fash = new UserDTO(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4));
                return fash;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;

    }
            public void insert(UserDTO u) {
        String sql = "INSERT INTO [dbo].[tblUsers]\n"
                + "           ([userID]\n"
                + "           ,[fullName]\n"
                + "           ,[roleID]\n"
                + "           ,[password])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            Connection conn = null;
           PreparedStatement pre = null;
           ResultSet rs = null;
            conn = DBUtils.getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, u.getUserID());
            pre.setString(2, u.getFullName());
            pre.setString(3, u.getRoleID());
            pre.setString(4, u.getPassword());                       
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
