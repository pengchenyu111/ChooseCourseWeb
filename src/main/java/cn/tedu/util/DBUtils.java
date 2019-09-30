package cn.tedu.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.apache.commons.dbcp2.BasicDataSource;

/**
 * 数据库的工具类
 * 
 * 解决的问题是：
 * 1. 去除了代码中大量重复的代码
 * 2. 简化JDBC的开发
 * 3. 配置信息转换到db.properties外部文件中
 *     面向所有数据库编写代码；避免强耦合某个数据库
 * 4. 使用连接池，重用连接
 */
public class DBUtils {
	private static String driver = null;
	private static String url = null;
	private static String user = null;
	private static String pwd = null;
	private static int initialSize = 0;
	private static int maxTotal = 0;
	private static int maxWaitMillis = 0;
	
	private static BasicDataSource ds = null; //连接池
	
	//当DBUtil类被加载时，执行一次static代码块，且只执行这一次！
	static {
		try {
			Properties props = new Properties();
				//实例化Properties工具，底层其实是一个Map，
				//	额外提供了从文件中加载键值对等功能
			props.load(DBUtils.class.getClassLoader()
					.getResourceAsStream("db.properties"));
			  //db.properties文件，目前直接放在了src目录下
		      //  src中全部代码编译完之后，会拷贝到bin目录中
			  //  jvm运行时，类加载默认路径就是从bin或src开始
			  //    目前文件写在src下，加载的目录是："db.properties"
			  //    如果拷贝到day02包下，目录变为："day02/db.properties"
			
			//System.out.println(props);
			
			driver = props.getProperty("driver");
			url = props.getProperty("url");
			user = props.getProperty("user");
			pwd = props.getProperty("pwd");
			initialSize = Integer.parseInt(
					props.getProperty("initialSize"));
			maxTotal = Integer.parseInt(
					props.getProperty("maxTotal"));
			maxWaitMillis = Integer.parseInt(
					props.getProperty("maxWaitMillis"));
			
			ds = new BasicDataSource(); //实例化连接池对象
			ds.setDriverClassName(driver);
			ds.setUrl(url);
			ds.setUsername(user);
			ds.setPassword(pwd);
			ds.setInitialSize(initialSize);
			ds.setMaxTotal(maxTotal);
			ds.setMaxWaitMillis(maxWaitMillis);
			
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("加载配置文件失败", e);
		}
	}
	
	public static void main(String[] args) throws SQLException {
		Connection conn = DBUtils.getConnection();
		System.out.println(conn.getClass().getName());
			//org.apache.commons.dbcp2.PoolingDataSource$PoolGuardConnectionWrapper
			//获得的连接，是连接池中的连接
		
		System.out.println(conn);
		System.out.println(DBUtils.getConnection());
		System.out.println(DBUtils.getConnection());
		System.out.println(DBUtils.getConnection());		
		System.out.println(DBUtils.getConnection());
		
		conn.close(); 
			//此处连接的关闭，是指连接归还给连接池
			//连接池，将归还连接中的数据清空，再放回连接池，给别的程序使用
		
		//取第6个连接
		System.out.println(DBUtils.getConnection());
			//连接超时，没有获得到连接，抛出异常
	}
	
	public static Connection getConnection() throws SQLException {
		if( ds!=null ) {
			return ds.getConnection();
		} else {
			throw new RuntimeException("从连接池中获得连接失败！");
		}
	}
	
	public static void close(Connection conn) {
		try {
			if(conn!=null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(
				"数据库异常：数据库连接关闭出现异常", e);
		}
	}

	public static void close(Statement stmt) {
		try {
			if(stmt!=null) {stmt.close();}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(
				"数据库异常：Statement关闭出现异常", e);
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if(rs!=null) {rs.close();}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(
				"数据库异常：ResultSet关闭出现异常", e);
		}
	}
}
