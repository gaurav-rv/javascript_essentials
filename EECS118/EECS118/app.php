<?php 
    echo '<body background="http://img.wallpaper.sc/desktop/images/5k/desktop-pc-5120x2880-wallpaper_00009.jpg" >';
    $key = '716fe551154fdcff6e3c448c2fac6135';
    $q = $_GET["q"];
    $json = file_get_contents('http://food2fork.com/api/search?key=' . $key . '&q=' . $q); # Get JSON from food2fork
    $obj = json_decode($json); # Decode JSON into STD object
#    echo $obj->count ."<br />"; # print out the count variable
    $count = $obj->count;
    $recipes = $obj->recipes;
    $test = array_values($recipes)[0]; 
    echo "<table border='0'cellpadding='5' cellspacing='5' >";
    echo "<tr>";
    echo '<td> <h2 style="text-align:center; color:white;font-family: Rockwell,Courier Bold,Courier,Georgia,Times,Times New Roman,serif;
"> Dish</h2> </td>';
    echo '<td>  <h2 style="text-align:center; color:white;font-family: Rockwell,Courier Bold,Courier,Georgia,Times,Times New Roman,serif;
">  How it could look</h2></td>';
    echo '<td> <h2 style="text-align:center; color:white;font-family: Rockwell,Courier Bold,Courier,Georgia,Times,Times New Roman,serif;
">  How did people rate the dish?</td>';
    echo "</tr>";
    for ($x = 0; $x < $count; $x++) {
        $val = array_values($recipes)[$x]; # val = recipes[x]
        echo "<tr>\n";
#        echo "<td>$val->title</td>\n";
	$rId = $val->recipe_id;
	echo '<td><h2 style="text-align:center; color:white;font-family: Rockwell,Courier Bold,Courier,Georgia,Times,Times New Roman,serif;
"> <a href="app1.php?rId=' . $rId . '">' . $val->title . '</a></h2></td>';
	$img = $val->image_url;
        echo '<td><img src="' . $img . '" width = "400" height = "220" /></td>';
	$r = (100 == $val->social_rank) ?  '10.0' : '9.5-9.8';
	echo '<td><h2 style="text-align:center; color:white;font-family: Rockwell,Courier Bold,Courier,Georgia,Times,Times New Roman,serif;
">' . $r . '</h2></td>';
	echo "</tr>\n";
    } 
    echo "</table>\n";
?>

