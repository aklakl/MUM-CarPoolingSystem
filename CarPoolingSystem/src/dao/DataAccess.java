package dao;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.StringUtils;

import Model.Likes;
import util.DBUtil;

public class DataAccess<T> {

	
	private static final String dburl = "jdbc:mysql://localhost:3306/carpoolingdb";
	private static final String DBNAME_STRING = "root";
	private static final String DBNAME_P_STRING = "";
	private static Connection connection = getConection();
	
	public static synchronized  Connection getConection(){
		if (connection == null){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(dburl, DBNAME_STRING,DBNAME_P_STRING);
				System.out.println("connection ok");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return connection;
	}
	
	private static final DataAccess instance = new DataAccess();  

    public static DataAccess getInstance() {  
        return instance;  
    }
	
	public ResultSet executeQuery(String sql) {
	        ResultSet rs = null;
	        try{
	        	Statement stmt = connection.createStatement();
	            System.out.println(this.getClass().getSimpleName()+" the query: " + sql);
	          	rs = stmt.executeQuery(sql);
	          	/*
	            while (rs.next()) {
	            	//rs.get
	                //fullname = rs.getString("fullname");
	                System.out.println("User Fullname: " + fullname);
	            }
	            */
	            //stmt.close();
	        } catch (SQLException s) {
	            System.out.println("Exception thrown in retrieveUser ....");
	            s.printStackTrace();
	        }
	        return rs;
	}
	
	
	public boolean execute(String sql) {
        boolean result = false;
        try{
        	Statement stmt = connection.createStatement();
            System.out.println(this.getClass().getSimpleName()+" the execute: " + sql);
            //result = stmt.execute(sql);
            stmt.execute(sql);
            int i = stmt.getUpdateCount();
            if (i>0){
            	result = true;
            }
            //stmt.close();
        } catch (SQLException s) {
            System.out.println("Exception thrown in retrieveUser ....");
            s.printStackTrace();
        }
        return result;
	}
	
	public Collection search(  T t  ,  Map m ){ //p1 is like user, post,Likes Comment; p2 filter map  
		Class clazz = t.getClass();
		Collection list = null ;
		try {
			String tableName = clazz.getName().toUpperCase();
			StringBuffer  sqlBuffer = new StringBuffer("select * from ");
			sqlBuffer.append(" "+tableName+" ");
			if (m.size() != 0){
				 String paramterString = DBUtil.mapConvertParamterString(m);
				 System.out.println(this.getClass().getSimpleName()+" paramterString:"+paramterString);
				 sqlBuffer.append(paramterString);
			}
    		ResultSet rs = this.executeQuery(sqlBuffer.toString());
    		list = DBUtil.resultSetToBean(rs, t.getClass());
    		System.out.println(list.size());
    		
    	} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public Collection search(  T t ,  String sqlParamter ){ //p1 is like user, post,Likes Comment; p2 filter map  
		Class clazz = t.getClass();
		Collection list = null ;
		try {
			String tableName = clazz.getName().toUpperCase();
			StringBuffer  sqlBuffer = new StringBuffer("select * from ");
			sqlBuffer.append(" "+tableName+" ");
			if (!StringUtils.isNullOrEmpty(sqlParamter) ){
				 System.out.println(this.getClass().getSimpleName()+" paramterString:"+sqlParamter);
				 sqlBuffer.append(sqlParamter);
			}
    		ResultSet rs = this.executeQuery(sqlBuffer.toString());
    		list = DBUtil.resultSetToBean(rs, t.getClass());
    		System.out.println(list.size());
    	} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean  add ( T t ){ //p1 is like user, post,Likes Comment; p2 filter map  
		boolean result = false;
		try {
			String sqlBuffer = DBUtil.generInsertString(t);
			result = this.execute(sqlBuffer.toString());
    	} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
 
	
	
	
	public static void main(String[] args) throws SQLException, IllegalArgumentException, IllegalAccessException {
		Connection connection = DBConnection.getConection();
		Statement statement = connection.createStatement(); 
		Likes l = new Likes(0);
		DataAccess da = new DataAccess();
		boolean result = da.delete(l);
		System.out.println(result);
		Likes l1 = new Likes(1);
		l1.setPostid(2542);
		da.update(l1);
		
		//String result = db1.retrieveUserFullname("hi");
		//System.out.println(result);
		
	}
	
	/*public List<T>  search ( Object p1  ,  Object p2 ){ //p1 is like user, post,Likes Comment; p2 filter map  
	
		
	}
	
	public boolean  add ( Object p1   ){ //p1 is like user, post,Likes Comment; p2 filter map  
	
		
	}*/
	
	public boolean  delete ( T t   ) throws SQLException, IllegalArgumentException, IllegalAccessException{ //p1 is like user, post,Likes Comment; p2 filter map  
		Class clazz = t.getClass();
		String tableName = clazz.getName().toUpperCase();
		tableName = tableName.split("\\.")[tableName.split("\\.").length-1];
		Field[] fields=t.getClass().getDeclaredFields(); 
		String id = fields[0].getName(); //first attribute name
		fields[0].setAccessible(true);	//make the field and value can access
		Object value = fields[0].get(t);//first felid value
		Connection connection = DBConnection.getConection();
		Statement statement = connection.createStatement(); 
		
		String query = "delete from " + tableName + " where " + id + " = " +  value.toString();
		
		PreparedStatement preparedStmt = connection.prepareStatement(query);
		return preparedStmt.execute();
		
		//return query;
 		//delete t from tableName; //do something 
		
	}
	
	public boolean  update ( T t  ){ //p1 is like user, post,Likes Comment; p2 filter map  
		Connection connection = DBConnection.getConection();
		String query = null ;
		PreparedStatement preparedStmt; 
		boolean result = false;
		try {
			Field[] fields=t.getClass().getDeclaredFields(); 
			String id = fields[0].getName(); //first attribute name
			fields[0].setAccessible(true);	//make the field and value be accessed
			Object value = fields[0].get(t);//first felid value
			Statement statement = connection.createStatement(); 
			query = generateUpdateSql(t);
			preparedStmt =  connection.prepareStatement(query);
			result = preparedStmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(query);
		return result;
	}
	
	
	
	public String generateUpdateSql(T model) throws IllegalArgumentException, IllegalAccessException{
		 Field[] field = model.getClass().getDeclaredFields();
	        String tableName = model.getClass().getName().toLowerCase();
	        tableName = tableName.split("\\.")[tableName.split("\\.").length-1];
	    	StringBuffer sqlBufferHead = new StringBuffer("update "+tableName+"");
			StringBuffer sqlBufferCondition = new StringBuffer(" set ");
			String[] numberTypeArray = {"java.lang.Long","java.lang.Int","java.lang.Integer","java.lang.Short","java.lang.Float","java.lang.Double","int","long","double","float"};
			List<String> numberTypes = Arrays.asList(numberTypeArray);
			
	        for(int j=1 ; j<field.length ; j++){     	// 
	              String name = field[j].getName();    	//get attribute
	              field[j].setAccessible(true);
	              Object value = field[j].get(model);
	              String methodType = field[j].getGenericType().toString(); 
	              //System.out.println("attribute:"+name +"|value:"+value +"|type:"+methodType); 
	              //name = name.substring(0,1).toUpperCase()+name.substring(1); // 
	              methodType = methodType.replace("class ", "");
	              //System.out.println("=>:"+methodType);
	            
	              if (value != null && !value.equals("")) {
	  					if (numberTypes.contains(methodType)) {
	  						sqlBufferCondition.append(" "+name +" = "+value);
		  				} else if (methodType.equalsIgnoreCase("java.lang.Boolean")) {
		  					sqlBufferCondition.append(" "+name +" = "+value);
		  				} else if (methodType.equalsIgnoreCase("java.util.Date")) {
		  					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  					String dateString = formatter.format(value);
		  					sqlBufferCondition.append(" "+name +" = "+dateString);
		  				} else if (methodType.equalsIgnoreCase("java.lang.String")) {
		  					sqlBufferCondition.append(" "+name +" = '"+value+"'");
		  				} else if (methodType.equalsIgnoreCase("java.io.InputStream")) {
		  					System.err.println("error:");
		  				} else if (methodType.equalsIgnoreCase("char")) {
		  					sqlBufferCondition.append(" "+name +" = '"+value+"'");
		  				}
	  					if (j<field.length-1){
	  						sqlBufferCondition.append(",");
	  					} 
	  			}
	              
	        }
	        sqlBufferHead.append(sqlBufferCondition);
	        field[0].setAccessible(true);
	        sqlBufferHead.append(" where "+field[0].getName()+"="+field[0].get(model));
	        System.out.println("generInsertString:"+sqlBufferHead.toString());
	        return sqlBufferHead.toString();
	}
	
	
		

}
