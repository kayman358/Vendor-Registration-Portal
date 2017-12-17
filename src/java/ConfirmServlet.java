///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.annotation.Resource;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.sql.DataSource;
//
///**
// *
// * @author TN041502
// */
//@WebServlet(urlPatterns = {"/ConfirmServlet"})
//public class ConfirmServlet extends HttpServlet {
//    @Resource(name="jdbc/SupplierCapture")
//	private DataSource ds;
//Connection con = null;
//    ResultSet rst = null;
//    PreparedStatement stmt = null;
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//      
//        try {
//            con = ds.getConnection();
//        } catch (SQLException ex) {
//            Logger.getLogger(ConfirmServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        String id = request.getParameter("confirmedIds");
//        String[] spl;
//        spl = id.split(" ");
//        System.out.println("inde 0 ");
//        System.out.println("Id of the clicked button is " + id);
//        System.out.println("index of 0 "+spl[0]);
//        
//        
//                 String sql2;
//                 
//    for (String spl1 : spl) {
//        try {
//            sql2 = "Update VendorInformation set status = 'confirmed' where id =?";
//            
//            stmt = con.prepareStatement(sql2);
//            stmt.setString(1, spl1);
//            stmt.executeUpdate();
//        }
//        catch (SQLException ex) {
//            Logger.getLogger(ConfirmServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//               
//              
//
//                
//
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
