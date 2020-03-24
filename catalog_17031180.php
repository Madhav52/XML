<?php

	$hostname="localhost";
	$username="root";
	$password="";
	$database="coursework";

	// create connection
	$conn=mysqli_connect($hostname,$username,$password,$database)
	or die("Could not connect to the database");
	// checking the connection establishment of the database
	if (mysqli_connect_error()){
		echo "Failed to connect to the database";
	}else{
		echo "Sucessfully connected to the database.";
	}
	$com_query = "Select * from companyinfo";
	$com_result = $conn->query($com_query);
	
	$dep_query = "Select * from department";
	$dep_result = $conn->query($dep_query);

	$ceo_query = "Select * from ceo";
	$ceo_result = $conn->query($ceo_query);

	// create XML document
	$xml = new DomDocument("1.0");
	$xml -> formatOutput=true;

	// linking CSS file into the XML file
	$cssStyle = $xml -> createProcessingInstruction("xml-stylesheet", "type=\"text/css\" href=\"catalog_17031180.css\"");
	$xml->appendChild($cssStyle);

	// linking DTD file into the XML file
	$domImplementation = new DOMImplementation();
	$dtdFile = $domImplementation->createDocumentType('company', '','catalog_17031180.dtd');
	$xml->appendChild($dtdFile);

	/* create xml element using creatElement() method
	append child to its parent element using appendChild() method */
	$company = $xml->createElement("company");
	$xml->appendChild($company);
	
	$navbar = $xml -> createElement("navbar");
	$company -> appendChild($navbar);

	$logo = $xml -> createElement("logo");
	$info = $xml -> createElement("info");
	$background = $xml -> createElement("background_image");
	$navbar -> appendChild($logo);	
	$navbar -> appendChild($info);
	$company -> appendChild($background);

	// fetching values from table of database
	while ($row = mysqli_fetch_assoc($com_result)){
		$companyinfo = $xml -> createElement("companyInfo");
		$company -> appendChild($companyinfo);
		
		$company_name = $xml -> createElement("com_name", $row["companyName"]);
		$company_add = $xml -> createElement("com_address", $row["companyAddress"]);
		$company_tel = $xml -> createElement("com_telephone", $row["companyTelNo"]);
		$company_url  = $xml -> createElement("com_url", $row["companyUrl"]);
		$company_email  = $xml -> createElement("com_email", $row["companyEmailId"]);	

		$companyinfo -> appendChild($company_name);
		$companyinfo -> appendChild($company_add);
		$companyinfo -> appendChild($company_tel);
		$companyinfo -> appendChild($company_url);
		$companyinfo -> appendChild($company_email);	
	}
	while ($row = mysqli_fetch_assoc($ceo_result)) {
		$ceo = $xml -> createElement("ceo");
		$company -> appendChild($ceo);
		$ceo_name  = $xml -> createElement("ceo_name", $row["ceoName"]);
		$ceo_address  = $xml -> createElement("ceo_address", $row["ceoAddress"]);
		$ceo_contact  = $xml -> createElement("ceo_contact", $row["ceoContact"]);
		$ceo_email  = $xml -> createElement("ceo_email", $row["ceoEmail"]);
		
		$ceo -> appendChild($ceo_name);
		$ceo_name -> setAttribute("title", $row["title"]);
		$ceo -> appendChild($ceo_address);
		$ceo -> appendChild($ceo_contact);
		$ceo -> appendChild($ceo_email);
	}
		$department_info = $xml -> createElement("department_info");
		$company -> appendChild($department_info);
		$services = $xml -> createElement("services");
		$company -> appendChild($services);
		$departments = $xml -> createElement("departments");
		$company -> appendChild($departments);

	while ($row = mysqli_fetch_assoc($dep_result)) {
		
		$department = $xml -> createElement("department");
		$dep_name  = $xml -> createElement("department_name", $row["departmentName"]);
		$dep_mem  = $xml -> createElement("department_mem", $row["departmentMembers"]);
		$project_manager  = $xml -> createElement("project_manager", $row["projectManager"]);
		$team_leader  = $xml -> createElement("team_leader", $row["teamLeader"]);

		$departments -> appendChild($department);
		$department -> appendChild($dep_name);
		$department -> setAttribute("id", $row["departmentId"]);
		$department -> appendChild($dep_mem);
		$department -> appendChild($project_manager);
		$department -> appendChild($team_leader);

	}
	$footer = $xml -> createElement("footer");
	$company -> appendChild($footer);
	$footer_title = $xml -> createElement("footer_title");
	$footer -> appendChild($footer_title);
	$footer_info = $xml -> createElement("footer_info");
	$footer -> appendChild($footer_info);

	echo "<xmp>".$xml->saveXML()."</xmp>";
	// save xml file externally
	$xml->save("catalog_17031180.xml");

?>