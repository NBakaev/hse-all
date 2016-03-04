import java.sql.*;
import java.io.*;
class Books_JDBC{
    public static void main(String args[])
    {
	if(args.length<2){
	    System.out.println("usage:Books_JDBC user_name password\n");
	    return;
	}
	BufferedReader reader=new BufferedReader(
				  new InputStreamReader(System.in));
	try{
	    Class.forName("org.postgresql.Driver");
	}
	catch(Exception ex){
	    System.out.println("can't load driverObject "+ex);
	    return;
	}

	Connection conn=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	try{
	    conn=DriverManager.getConnection(
		  "jdbc:postgresql:books",
		  args[0],args[1]);
	    ps=conn.prepareStatement(
	      "select s.oid,c.name,s.data,s.sum_price from"+
	      "(supply s JOIN customer c ON s.cust_id=c.cid)"+
	      "where s.sum_price>= ?"+
	      "order by c.name;");

	    System.out.println("input price");
	    String str=reader.readLine();
	    int sum_price=Integer.parseInt(str);

	    ps.clearParameters();
	    ps.setInt(1,sum_price);
	    rs=ps.executeQuery();
	    int oid;
	    String name;
	    Date date;
	    int price;
	    while(rs.next()){
		oid=rs.getInt(1);
		name=rs.getString(2);
		date=rs.getDate(3);
		price=rs.getInt(4);
		System.out.println("oid="+oid+" name="+name+" date="+date+
				   " price="+price);
	    }

	}
	catch(SQLException ex){
	    System.out.println("SQLException: "+ex);
	    return;
	}
	catch(IOException ex){
	    System.out.println("IOException: "+ex);
	    return;
	}
	catch(NumberFormatException ex){
	    System.out.println("you should input integer: "+ex);
	    return;
	}
	finally{
	    try{
		if(rs!=null)
		    rs.close();
		if(ps!=null)
		    ps.close();
		if(conn!=null)
		    conn.close();
	    }
	    catch(SQLException ex){}
	}

    }
}
