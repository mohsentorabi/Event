<?php
	$con = @mysqli_connect("localhost","miladshop_eventresume","Event1402","miladshop_eventresume");
	mysqli_set_charset($con,'UTF8');
	if (!mysqli_connect_error()) {
		$sabt = "INSERT INTO person(datetime,name,birth,city,number,email,sex,sch-list,edu-skil-list,joblist,pic) VALUES($_POST['datetime'],$_POST['name'],$_POST['birth'],$_POST['city'],$_POST['number'],$_POST['email'],$_POST['sex'],$_POST['sch-list'],$_POST['edu-skil-list'],$_POST['joblist'],$_POST['pic'])";
		if (mysqli_query($con,$sabt)) {
				$arr['title'] = 'regdone'; echo json_encode($arr);
		} else {
				$arr['title'] = 'regfailed'; echo json_encode($arr); 
		}
	} else {
		$arr['title'] = 'dbfailed'; echo json_encode($arr);
	}
	mysqli_close($con);
?>