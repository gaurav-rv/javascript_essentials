<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.*"%>

<%@ page import="java.io.*" %>

<%@ page import="java.sql.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<div align = "center" font size = "12">
			<b>
				<font size = "18">
					EECS 118 : Galleria <br>
					-Gaurav Venkatesh
				</font>
			</b>
		</div>
	</head>
  <body bgcolor = "#E6E6FA" >
  
  <% 
	String funcID = request.getParameter("funcID");
	String galleryID = request.getParameter("gallery_id");
	String name = request.getParameter("name");
	String description= request.getParameter("description");
	String birth_year = request.getParameter("birth_year");
	String country = request.getParameter("country");
	String b_year = request.getParameter("birth_year");
	String artistID = request.getParameter("artist_id");
	String title = request.getParameter("title");
	String imagelink = request.getParameter("imagelink");
	String detailID = request.getParameter("detailID");
	String number = request.getParameter("number");
	String ImageID = request.getParameter("ImageID");
	String year	= request.getParameter("year");
	String d_type = request.getParameter("d_type");
	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String location = request.getParameter("location");
%>
  
  
<%
try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
}
catch(Exception e) {
	out.println("can't load mysql driver");
	out.println(e.toString());
}%>

<b>1. List All the galleries:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="1">
    		<input type="submit" value="GO!"/>
</form>

<b>2. List all the images and the number of images in a gallery (including title and
link).</b>
<form method="post">
    		<input name="funcID" type="hidden" value="2">
		Please Enter Gallery ID of picture list  to be seen: <input name="number" type="int">
    		<input type="submit" value="GO!"/>
</form>

<b>3. List the details of a given image</b>
<form method="post">
    		<input name="funcID" type="hidden" value="2">
    		<input type="submit" value="GO!"/>
</form>

<b>4. List the details of an artist.</b>
<form method="post">
    		<input name="funcID" type="hidden" value="2">
    		<input type="submit" value="GO!"/>
</form>

<b>5.Create a new gallery.</b>
<form method="post">
    		<input name="funcID" type="hidden" value="5">
		Gallery name: <input name="name" type="text">
		Description: <input name="description" type="text">
    		<input type="submit" value="GO!"/>
</form>

<b>6.Create a new Artist </b>
<form method="post">
    		<input name="funcID" type="hidden" value="6">
		ArtistName: <input name="name" type="text">
		BirthYear:  <input name="birth_year" type="int">
		Country:  <input name="country" type="text">
		Description: <input name="description" type="text">
    		<input type="submit" value="GO!"/>
</form>


<b>7.Add a new image to a gallery</b>
<form method="post">
    		<input name="funcID" type="hidden" value="7">
		Title:		<input name="title" type="text">
		Image link: <input name="imagelink" type="text"> <br />
		galleryID: <input name="gallery_id" type="int">
		ArtistID:	<input name="artist_id" type="int">
		ImageID:	<input name="ImageID" type="int">
		year: 		<input name="year" type="int">
		type: 		<input name="d_type" type="text">
		width:		<input name="width" type="int"> <br />
		height:		<input name="height" type="int">
		Location:  	<input name="location" type="text">
		Description	<input name="description" type="text"> <br />
    		<input type="submit" value="GO!"/>
</form>

<b>8.Enter gallery Id and Image ID that you wish to delete</b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
				galleryID: <input name="gallery_id" type="int">
				ImageID:	<input name="ImageID" type="int">
    		<input type="submit" value="GO!"/>
</form>

<b>9.Modify the details of an image (including title and link)</b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
			Input the gallery_id: <input name="gallery_id" type="int"> and ImageID: <input name="ImageID" type="int">of the image you want to modify <br />
    		Now enter the new details of the image you want to modify <br />
			Title <input name="title" type="text"> <br />
			Link <input name="imagelink" type="text">
			ArtistID <input name="artist_id" type="int">
			<input type="submit" value="GO!"/>
</form>

<b>10. Modify the details of an artist </b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
			Input the ArtistID <input name="artist_id" type="int"> of the artist you want to modify information <br />
			Now enter the details of the artist you want to change:<br/>
		    Name <input name="name" type="text"> birth_year <input name="birth_year" type="int"> <br />
			country <input name="country" type="text"> description <input name="description" type="text"> <br />
			
    		<input type="submit" value="GO!"/>
</form>

<b>11. Modify the title and description of a gallery. </b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
			Enter the gallery_ID <input name="gallery_id" type="int"> of the gallery you want to modify.</br>
			Now enter the details of the gallery you want to modify</br>
			Name <input name="name" type="text">
			description <input name="description" type="text"> <br />
    		<input type="submit" value="GO!"/>
</form>

<b>12. Find the images by type (“Find” means to list all the results.)</b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
    		<input type="submit" value="GO!"/>
</form>

<b>13. Find the images by a given range of creation year.</b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
    		<input type="submit" value="GO!"/>
</form>

<b>14. Find the images by artist name.</b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
    		<input type="submit" value="GO!"/>
</form>

<b>15. Find the images by location.</b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
    		<input type="submit" value="GO!"/>
</form>

<b>16. Find the artists by country.</b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
    		<input type="submit" value="GO!"/>
</form>

<b>17. Find the artists by birth year.</b>
<form method="post">
    		<input name="funcID" type="hidden" value="8">
    		<input type="submit" value="GO!"/>
</form>


<% if(funcID!=null) {
	try {
				String url="jdbc:mysql://127.0.0.1:3307/gallery";
				String id="gallery";
				String pwd="eecs118";
				Connection con= DriverManager.getConnection(url,id,pwd); 
				int func=Integer.valueOf(funcID);
				Statement stmt;
				PreparedStatement pstmt;
				ResultSet rs;
				switch(func) {
					case 1:
						stmt = con.createStatement();
						String sql = "SELECT * FROM gallery";
						rs = stmt.executeQuery(sql);
						out.println("<table border=\"1\">");
						out.println("<caption> Gallery List </caption>");
						out.println("<tr>");
						out.println("<th>galleryID</th>");
						out.println("<th>name</th>");
						out.println("<th>description</th>");
						out.println("<tr>");
						while (rs.next()) {
							out.println("<tr>");
							out.println("<td>"+rs.getString("gallery_id")+"</td>");
							out.println("<td>"+rs.getString("name")+"</td>");
							out.println("<td>"+rs.getString("description")+"</td>");
							out.println("</tr>");
						}
						rs.close();
						stmt.close();
						out.println("</table>");
						break;
					case 2:
						pstmt = con.prepareStatement("SELECT * FROM image WHERE gallery_id=?",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1, number);
						rs = pstmt.executeQuery();
						out.println("<table border=\"2\">");
						out.println("<caption> Images in gallery List </caption>");
						out.println("<tr>");
						out.println("<th>title</th>");
						out.println("<th>link</th>");
						out.println("<tr>");						
						while (rs.next()) {
							out.println("<tr>");
							out.println("<td>"+rs.getString("title")+"</td>");
							out.println("<td>"+rs.getString("link")+"</td>");
							out.println("</tr>");
							%>
							<div id="display"><center>
							<img class="imgDis" src=<%=rs.getString("link")%> style="width:304px;height:228px;/>
							<p class="textDesc" > "<%=rs.getString("title")%>"</p>
							<p class="textDesc" > "<%=rs.getString("link")%>"</p>
							</center>
							</div>
						<%				
							out.println("<tr>");
						}
						%>
						
						<%
						rs.close();
						pstmt.close();
						break;
					case 5:
						pstmt = con.prepareStatement("insert into gallery values (default,?,?)",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1, name);
						pstmt.setString(2, description);
						pstmt.executeUpdate();
						rs=pstmt.getGeneratedKeys();
						while (rs.next()) {
							out.println("Successfully added. gallery_ID:"+rs.getInt(1));
						}
						rs.close();
						pstmt.close();
						break;
						
					case 6:
						pstmt = con.prepareStatement("insert into artist values (default,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1, name);
						pstmt.setString(2, birth_year);
						pstmt.setString(3, country);
						pstmt.setString(4, description);
						pstmt.executeUpdate();
						rs=pstmt.getGeneratedKeys();
						while (rs.next()) {
							out.println("Successfully added. gallery_ID:"+rs.getInt(1));
						}
						rs.close();
						pstmt.close();
						break;
					case 7: 
						pstmt = con.prepareStatement("insert into image values (?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1,ImageID);
						pstmt.setString(2, title);
						pstmt.setString(3, imagelink);
						pstmt.setString(4, galleryID);
						pstmt.setString(5, artistID);
						pstmt.setString(6, ImageID);
						pstmt.executeUpdate();
						
						rs=pstmt.getGeneratedKeys();
						while (rs.next()) {
							out.println("Successfully added. ImageID:"+rs.getInt(1));
						}
						
						pstmt = con.prepareStatement("insert into detail values (?,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1, ImageID);
						pstmt.setString(2, ImageID);
						pstmt.setString(3, year);
						pstmt.setString(4, d_type);
						pstmt.setString(5, width);
						pstmt.setString(6, height);
						pstmt.setString(7, location);
						pstmt.setString(8, description);
						pstmt.executeUpdate();
						
						rs=pstmt.getGeneratedKeys();
						while (rs.next()) {
							out.println("Successfully added. ImageID:"+rs.getInt(1));
						}
						
						rs.close();
						pstmt.close();
						break;	
					case 8:
						pstmt = con.prepareStatement("Delete from image where gallery_id=? and image_id=? ",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1, galleryID);
						pstmt.setString(2, ImageID);
						pstmt.executeUpdate();
						pstmt = con.prepareStatement("Delete from detail where image_id=? ",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1, ImageID);
						pstmt.executeUpdate();
						pstmt.close();
						break;	
					case 9:
						pstmt = con.prepareStatement("Update image SET title=? link=? artist_id=? where gallery_id=? and image_id=? ",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1, title );
						pstmt.setString(2, imagelink);
						pstmt.setString(3, artistID);
						pstmt.setString(4, galleryID);
						pstmt.setString(5, ImageID);
						pstmt.executeUpdate();
						pstmt.close();
						break;
					case 10:
						pstmt = con.prepareStatement("Update artist SET name=? birth_year=? country=? description=? where artist_id=? ",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1, name);
						pstmt.setString(2, birth_year);
						pstmt.setString(3, country);
						pstmt.setString(4, description);
						pstmt.setString(5, artistID);
						pstmt.executeUpdate();
						pstmt.close();
						break;
					case 11:
						pstmt = con.prepareStatement("Update gallery SET name=? description=? where gallery_id=? ",Statement.RETURN_GENERATED_KEYS);
						pstmt.clearParameters();
						pstmt.setString(1, name);
						pstmt.setString(2, description);
						pstmt.setString(3, galleryID);
						pstmt.executeUpdate();
						pstmt.close();
						break;
				}	
				
	}
	catch(Exception e)
		{
			out.println(e.toString());
	} 	
			
}%>



</body>
</html>