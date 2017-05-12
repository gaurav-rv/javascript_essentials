<?php
    $key = '';
    $q = $_GET["rId"];
  #  $q = '35120';
    echo '<body background="http://faceitformobile.com/wp-content/uploads/2014/06/Face-It-black.jpg" >';
    $json = file_get_contents('http://food2fork.com/api/get?key=' . $key . '&rId=' . $q); # Get JSON from food2fork
    $obj = json_decode($json,true); # Decode JSON into STD object
    $img = $obj['recipe']['image_url'];
    $title = $obj['recipe']['title'];
#    $social = $obj['recipe']['social_rank'];
     echo '<h4 style="text-align:right;color:white"><a href=search.html> \ Too much? Try another recipe / </a> </h4>';
     echo '<h1 style="text-align:center;color:white;font-family: Rockwell,Courier Bold,Courier,Georgia,Times,Times New Roman,serif;
">' .$title. '</h1>';
     echo '<p style="text-align:center"><img src="' . $img . '" width = "700" height = "500" align="center" /></p> <br>';
     echo '<h1 style="text-align:left;color:white;font-family: Rockwell,Courier Bold,Courier,Georgia,Times,Times New Roman,serif;
"> Materials required (yeah you need all these materials :/ )</h1>';
    $output="<ul>";
    foreach ($obj['recipe']['ingredients'] as $ing){
       echo '<h4 style="text-align:left;color:white;font-family: Rockwell,Courier Bold,Courier,Georgia,Times,Times New Roman,serif;
">' . $ing .'</h4>';
    } 
    $outlink = $obj['recipe']['source_url'];
   echo '<h1 style="text-align:right;color:white;font-family: Rockwell,Courier Bold,Courier,Georgia,Times,Times New Roman,serif;"><a href="' . $outlink . '">CLick here to see the recipe</a>';    
?>
