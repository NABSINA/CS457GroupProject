
#b1topleft.pl



sub TopLeft  {

my($i);
my($dealername, $dllogin, $dlpasswordenc, $priority, $address, $phone, $email, $webaddr, 
            $maintainwebaddr, $startservicedate, 
            $expiration, $tmp1, $tmp2, $tmp3, $tmp4, 
            $aboutus, $aboutuspic, $service, $servicepic, $contact, $contactpic, $pg1button, $pg1title, 
            $pg1text, $pg1pic, $pg2button, $pg2title, $pg2text, 
            $pg2pic, $pg3button, 
            $pg3title, $pg3text, $pg3pic,           
            $hmpgpic, $save2, $save3, $save4, $save5, $save6, 
            $save7, $save8, $save9, $save10, $save11, $save12, $save13, $save14, 
            $save15, $lograndom, $enterdate, $layout, 
            $record6, $record7, $record8, $record9, $record10, $record11, 
            $record12, $record13) ;

$dlpasswordencp = $input{'dlpasswordenc'};
$dlpasswordencp =~ s/ /+/g; 
 
#      if(($input{'city'} eq "hangzhou") && $_[0] eq "home" && -f "$opimageprefix/allcity/allshop/common/market/html/filled/b1topleft.pl")
#      {
#	   require  "$opimageprefix/allcity/allshop/common/market/html/filled/b1topleft.pl";
#           &TopLeft($_[0], $_[1], $_[2], $_[3]);
#           return;
#      }
     

&Language(*lang, "b1topleftnew");


      $indexsel = $_[0];
      
     

       open(DEALERDB, "$opprefix/allcity/allshop/common/db/dealerdb");


         $/ ="\000\n";

         $line =<DEALERDB>;

           ($dealername, $dllogin, $dlpasswordenc, $priority, $address, $phone, $email, $webaddr, 
            $maintainwebaddr, $startservicedate, 
            $expiration, $tmp1, $tmp2, $tmp3, $tmp4, 
            $aboutus, $aboutuspic, $service, $servicepic, $contact, $contactpic, $pg1button, $pg1title, 
            $pg1text, $pg1pic, $pg2button, $pg2title, $pg2text, 
            $pg2pic, $pg3button, 
            $pg3title, $pg3text, $pg3pic,           
            $hmpgpic, $save2, $save3, $save4, $save5, $save6, 
            $save7, $save8, $save9, $save10, $save11, $save12, $save13, $save14, 
            $save15, $lograndom, $enterdate, $layout, 
            $record6, $record7, $record8, $record9, $record10, $record11, 
            $record12, $record13) = split(/#/, $line); 

               @layouttmp=split(/;/, $layout);
                for($layoutindex=0; $layoutindex<=$#layouttmp; $layoutindex=$layoutindex+2)
               {    $layoutp{"$layouttmp[$layoutindex]"}=$layouttmp[$layoutindex+1];
               }
               if($layoutp{"welcomey"}) { $welcomey=$layoutp{"welcomey"}; }
               else {$welcomey=150;};



        close(DEALERDB);

$welcome =glob("$opimageprefix/$input{'city'}/$input{'shop'}/common/welcome.*");

$welcome =~ /\/(welcome.*)$/;
$welcome=$1;

if($_[3]) {$bg="$_[3].jpg"}
else {$bg="bg.jpg";}



$city = $input{"city"};
$classify = $input{"classify"}; 
$category = $input{"category"};

if($input{'user'} eq "staff") # Staff maintaining.
{

       $/="\000\n";
       open(DEALER, "$opprefix/$input{'city'}/$input{'shop'}/common/db/dealerdb");

       $dealerline=<DEALER>;

       close(DEALER);

($dealername, $dllogin, $dlpasswordenc, $priority, $address, $phone, $email, $webaddr, 
            $maintainwebaddr, $startservicedate, 
            $expiration, $credit, $tmp2, $tmp3, $tmp4, 
            $aboutus, $aboutuspic, $service, $servicepic, $contact, $contactpic, $pg1button, $pg1title, 
            $pg1text, $pg1pic, $pg2button, $pg2title, $pg2text, 
            $pg2pic, $pg3button, 
            $pg3title, $pg3text, $pg3pic,           
            $hmpgpic, $save2, $save3, $save4, $save5, $save6, 
            $save7, $save8, $save9, $save10, $save11, $save12, $save13, $save14, 
            $save15, $lograndom, $enterdate, $layout, 
            $record6, $record7, $record8, $record9, $record10, $record11, 
            $record12, $record13) = split(/#/, $dealerline); 

         $dealername =~ s/\\\?(?!\?)/#/g;
         $dealername =~ s/\\\?\?/\?/g;
         $dealername =~ s/\\\\/\\/g; 

         $dealerphone = $phone;
         $dealerphone=~ s/\\\?(?!\?)/#/g;
         $dealerphone =~ s/\\\?\?/\?/g;
         $dealerphone =~ s/\\\\/\\/g;

         $dealeremail =$email;
         $dealeremail =~ s/\\\?(?!\?)/#/g;
         $dealeremail =~ s/\\\?\?/\?/g;
         $dealeremail =~ s/\\\\/\\/g;

         @layouttmp = split(/;/, $layout);
 
         for($i=0; $i<=$#layouttmp; $i=$i+2)
         {    $layoutp{"$layouttmp[$i]"} = $layouttmp[$i+1];
         }

 }

  print<<ENDOFTEXT;
<meta charset=utf-8>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
       #nav_menu1 div { position: relative; }
       #nav_menu1 ul { list-style-type: none;
                       display: none;
                       position: absolute;
		       left: 0;
		       top: 20%;
		     }
       #nav_menu1 div:hover > ul {display: block;
                                   background: white;
				   top: 0;
                                  }		     
       #nav_menu1 > div::after { content: "";
		               display: block;
			       clear: both;}
       #nav_menu1 div ul li {float: none;
                             }
       #nav_menu1 div ul li:hover > ul { display: block; 
	                                left: 100%;
					top: 0;
	                             background: white; }
       
       #nav_menu ul {
	     list-style: none;
	     position: relative;  }
       #nav_menu ul li { float: left;}
       #nav_menu ul ul {
                 display: none;
		 position: absolute;
		 left: 0;
		 top: 100%; 
	}
	#nav_menu ul ul li {float: none;}
	#nav_menu ul li:hover > ul { display: block; 
	                             background: white; }
	#nav_menu > ul::after { content: "";
		               display: block;
			       clear: both;}
		       
		       .shop.fixed{ position: fixed;
                                        top: 0px;
                                       left: 0px;
				    z-index: 1000;
                                 } 
.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body $_[2]>
<script>
window.automatedInsertItem = ((category, title, sku, brand, price) => {
    const myEles = document.querySelector(`[value="\${category}"]`);
    (myEles ? myEles.click() : undefined);
    const setValue = (name, value) => {
        const input = document.querySelector(`[name="\${name}"]`);
        (input ? input.value = value : undefined);
    }
    setValue('title', title);
    setValue('stocknum', 1);
    setValue('stockquantity', 1);
    setValue('upc', sku);
    setValue('_sku', sku);
    setValue('content', `\${title}\n\${brand}`);
    for (let i = 1; i <= 5; i++) {
        setValue(`price\${i}title`, `Price of \${i} \${title}`);
        setValue(`price\${i}`, (price * i).toFixed(2));
        setValue(`quantity\${i}`, i);
    }
    const btnSubmit = document.querySelector('[value="Submit"]');
    btnSubmit.click();
});
</script>
<script language="Javascript" src="$opimageprefix/allcity/allshop/common/a1utility.js"></script>
<script language=javascript>
ENDOFTEXT
  
  $availclassifynum=$#classifyarray+1;

print "availclassifyarr =new Array($availclassifynum);\n";

print "availclassifynamearr =new Array($availclassifynum);\n";


#print "availclassifyarr[0]=\"all\";\n";
print "availclassifyarr[0]=\"\";\n";
#print "availclassifynamearr[0]=\"$lang{'All Classifications'}\";\n";
print "availclassifynamearr[0]=\"\";\n";

$defaultclassifyindex=0;
for($i=0; $i<=$#classifyarray; $i++)
{

$iplus=$i+1;
$availclassify=$classifyarray[$i];
$availclassifyname=$classifyarrayname[$i];
print "availclassifyarr[$iplus]=\"$availclassify\";\n";
print "availclassifynamearr[$iplus]=\"$availclassifyname\";\n";


if($defaultclassifyarray eq $classifyarray[$i]) { $defaultclassifyindex=$iplus;}
}

print "\ndefaultclassifyIndex=$defaultclassifyindex;\n\n";


$classifynum = $#classifyarray +2;

print "classifynum=$classifynum;\n";

print "categoryArray = new Array($classifynum);\n";
print "defaultcategoryIndex = new Array($classifynum);\n";
#print "categoryArray[0]= new Array(\"all\", \"$lang{'All Categories'}                        \");\n";
print "categoryArray[0]= new Array(\"all\", \"\");\n";
for ($j=1; $j<$classifynum; $j++)
{
      $classify =$classifyarray[$j-1]; 

      
      print "categoryArray[$j]=new Array(";
   #   $first = "True";
    print "\"all\", \"$lang{'All Categories'}                    \"";  #added
      for($k=0; $k<=$#{$categoryarray{"$classify"}}; $k++)
      {

         #     if($first eq "True") {$first = "False";} 
        #      else { print ", ";}
              print ", ";   # added

              $file =$categoryarray{"$classify"}[$k];
              $name = $categoryarrayname{"$classify"}[$k];


             print "\"$file\", \"$name\"";
      }
       print ");\n";
}


print "defaultcategoryIndex[0]=0;\n";

for ($j=1; $j<$classifynum; $j++)
{
       $classify =$classifyarray[$j-1]; 

       $index=0;
       for($k=0; $k<=$#{$categoryarray{"$classify"}}; $k++)
      {
           if($categoryarray{"$classify"}[$k] eq $defaultcategoryarray{"$classify"}[0]) { $index=$k+1;}
      }
      print "defaultcategoryIndex[$j]=$index;\n";
}



print <<ENDOFTEXT;
</script>
$_[6]

<input type="hidden" name="country" value="$input{'country'}">
<input type="hidden" name="language" value="$input{'language'}">
<input type="hidden" name="city" value="$input{'city'}">
<input type="hidden" name="shop" value="$input{'shop'}">
<input type="hidden" name="user" value="$input{'user'}">
<input type="hidden" name="tblnum" value="$input{'tblnum'}">
<input type="hidden" name="adnum" value="$input{'adnum'}">
<input type="hidden" name="division" value="$input{'division'}">
<input type="hidden" name="classify" value="$input{'classify'}">
<input type="hidden" name="category" value="$input{'category'}">
<input type="hidden" name="browser" value="$input{'browser'}">
<input type="hidden" name="browsere" value="$input{'browsere'}">

<input type="hidden" name="cart" value="$input{'cart'}">
<input type="hidden" name="viewer" value="$input{'viewer'}">
<input type="hidden" name="dllogin" value="$input{'dllogin'}">
<input type="hidden" name="dlpassword" value="$input{'dlpassword'}">
<input type="hidden" name="dlpasswordenc" value="$input{'dlpasswordenc'}">


<input type="hidden" name="sortby" value="$input{'sortby'}">

<input type="hidden" name="page" value="$input{'page'}">
<input type="hidden" name="select" value="$input{'select'}">
<input type="hidden" name="selectedads" value="$input{'selectedads'}">
<input type="hidden" name="action" value="$input{'action'}">
<input type="hidden" name="topleft" value="$input{'topleft'}">
<input type="hidden" name="backpage">
<input type="hidden" name="password" value="$input{'password'}">

<input type="hidden" name="lograndom" value="$input{'lograndom'}">
<input type="hidden" name="logad" value="$input{'logad'}">
<input type="hidden" name="lograndenc" value="$input{'lograndenc'}">

<input type="hidden" name="operator" value="$input{'operator'}" >
<input type="hidden" name="oppasswordenc" value="$input{'oppasswordenc'}">



<!--<div width=1300>
    <div class="shop fixed">-->
<!--<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">About</a>
  <a href="#">Services</a>
  <a href="#">Clients</a>
  <a href="#">Contact</a>
</div>-->
ENDOFTEXT

# https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_sidenav

print<<ENDOFTEXT;
<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>

ENDOFTEXT
 
        if("$input{'user'}" eq "staff") 
       {

$dlpasswordencp=$input{'dlpasswordenc'};
$dlpasswordencp =~ s/ /+/g;

print "<a href=\"b0home.pl?country=$input{'country'}&classify=all&language=$input{'language'}&user=staff&city=$input{'city'}&shop=$input{'shop'}&cart=$input{'cart'}&dllogin=$input{'dllogin'}&dlpasswordenc=$dlpasswordencp\" class=\"Button\"> $lang{'Home'} </a>";
        }
        else
        {
        print "<a href=\"b0home.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&classify=all&language=$input{'language'}\" class=\"Button\"> $lang{'Home'} </a>";
        }   

 if($input{'user'} eq "staff")
     {
$dlpasswordencp = $input{'dlpasswordenc'};
$dlpasswordencp =~ s/ /+/g;

print <<ENDOFTEXT;
              <a href="b0choose.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&&user=staff&dllogin=$input{'dllogin'}&dlpasswordenc=$dlpasswordencp&action=b1search.pl&topleft=browse&language=$input{'language'}&cart=$input{'cart'}" class="Button"> $lang{'Browse Items'} </a> 
ENDOFTEXT
      }
      else
      {
print <<ENDOFTEXT;
              <a href="b0choose.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&action=b1search.pl&topleft=browse&language=$input{'language'}&cart=$input{'cart'}" class="Button"> $lang{'Browse Items'} </a> 
ENDOFTEXT
      }

if($input{'user'} ne "staff")
{
print "<a href=\"b0invoice.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&classify=$input{'classify'}&cart=$input{'cart'}&language=$input{'language'}\" class=\"Button\"> $lang{'Invoice'} </a>";

}

if($input{'user'} eq "staff")
{


      print "<a  href=\"b0choose.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&classify=$input{'classify'}&category=$input{'category'}&cart=$input{'cart'}&language=$input{'language'}&user=staff&dllogin=$input{'dllogin'}&dlpasswordenc=$dlpasswordencp&action=b0insert.pl\" class=\"Button\"> $lang{'Place an Item'} </a>"; 


}

=begin comment
# Use search first to update, do not need update.


=end comment
=cut

if($input{'user'} eq "staff") 
{
      $dlpasswordenc=$input{'dlpasswordenc'};
      $dlpasswordenc =~ s/ /+/g;
     
      print "<a  href=\"b1dlinvoice.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&classify=$input{'classify'}&category=$input{'category'}&cart=$input{'cart'}&language=$input{'language'}&user=staff&dllogin=$input{'dllogin'}&dlpasswordenc=$dlpasswordencp\" class=\"Button\">";

     print "$lang{'Invoice'}</center></a>"; 


      print "<a  href=\"b1access.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&user=$input{'user'}&language=$input{'language'}&dllogin=$input{'dllogin'}&dlpasswordenc=$dlpasswordenc&access=download\" class=\"Button\">";

     print "$lang{'Access Number File'}</center>"; 

     
      print "<a  href=\"b0dlmaintain.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&classify=$input{'classify'}&category=$input{'category'}&cart=$input{'cart'}&language=$input{'language'}&user=staff&dllogin=$input{'dllogin'}&dlpasswordenc=$dlpasswordencp\" class=\"Button\">";

     print "$lang{'Maintain Account'}</center></a>"; 

}


print<<ENDOFTEXT;
<a href="#"> Contact Us &nbsp; &nbsp; &nbsp; &nbsp;</a>
</div>
ENDOFTEXT

print<<ENDOFTEXT;
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "300px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
        <div width=2200 height=90 border=0 cellspacing=0 cellpadding=0>
        <div class="row" style="background-color:#AAAAAA;">
            <nav class="col-1" id="nav_menu">
			<ul>
			   <li>
               <span class="material-icons" style="font-size:40px;cursor:pointer" onclick="openNav()">menu</span>
ENDOFTEXT

print<<ENDOFTEXT;
			   </li>
		        </ul>
                  </nav>
ENDOFTEXT

    if($_[0] eq "b1search.pl")
    {
print <<ENDOFTEXT;    
<div class="col-5">
            <font color=white size=3> $lang{'Sort by:'}</font>



<select name="sortbyoptions" onChange="SortBy()" $select_class>
ENDOFTEXT

if($input{'sortby'} eq "postdate") { $option ="selected";}
    else { $option=""; }

$name="$lang{'Post date:'}";
$name =~ s/://g;

$value="postdate";

    print "<option $option value=\"$value\">$name </option>\n";


if($input{'sortby'} eq "stocknum") { $option ="selected";}
    else { $option=""; }

$name="$lang{'Stock Number:'}";
$name =~ s/://g;

$value="stocknum";

    print "<option $option value=\"$value\">$name </option>\n";


if($input{'sortby'} eq "upc") { $option ="selected";}
    else { $option=""; }

$name="$lang{'UPC:'}";
$name =~ s/://g;

$value="upc";

    print "<option $option value=\"$value\">$name </option>\n";

if($input{'classify'} ne "all" && $input{'category'} ne "all")
{
for($i=0; $i<=$#{$categoryarrayattri{"$input{'classify'}"}{"$input{'category'}"}}; $i++)
{
    if($input{'sortby'} eq $categoryarrayattri{"$input{'classify'}"}{"$input{'category'}"}[$i]) { $option ="selected";}
    else { $option=""; }

$name=$categoryarrayattriname{"$input{'classify'}"}{"$input{'category'}"}[$i];
$name =~ /(.*)\|(.*)\|(.*)/;
$name=$1;

$name =~ s/://g;
$value=$categoryarrayattri{"$input{'classify'}"}{"$input{'category'}"}[$i];
    print "<option $option value=\"$value\">$name</option>\n";

}
}
print<<ENDOFTEXT;
</select>
<input type="button" onClick="SearchSubmit('1', 'yes')"  value="$lang{'View Selected'}">
<select name=sortorder onChange="SortBy()" $select_class>
ENDOFTEXT
if($input{'sortorder'} eq "descend") 
 { print "<option value=ascend>$lang{'Ascend'}</option>\n<option value=descend selected>$lang{'Descend'}</option>\n";}
else 
 { print "<option value=ascend selected>$lang{'Ascend'}</option>\n<option value=descend>$lang{'Descend'}</option>\n";}

print <<ENDOFTEXT;
</select>
<input type="button" onClick="Unselect()" value="$lang{'Unselect'}">
</div>
  <div class="col-3">
		     <nav id="nav_menu1" style="z=index:100">
		       <div class="mx-4">
		        <font color=white size=2><span class="material-icons">category</span>&nbsp;Category</font>
                        <ul>
ENDOFTEXT

    for($i=0; $i<=$#cities; $i++) { if($input{'city'} eq $cities[$i]) { $thiscity=$cityname[$i];}}
$thisclassify="$lang{'All Classifications'}";
for($i=0; $i<=$#classifyarray; $i++) { if($input{'classify'} eq $classifyarray[$i]) { $thisclassify = $classifyarrayname[$i];}}
$thiscategory ="$lang{'All Categories'}";
for($i=0; $i <=$#{$categoryarray{"$input{'classify'}"}}; $i++) 
{  if($categoryarray{"$input{'classify'}"}[$i] eq $input{'category'}) 
    { $thiscategory = $categoryarrayname{"$input{'classify'}"}[$i]; 
    }
}

$ClassifyCategory="&nbsp; &nbsp; $thiscity > $thisclassify > $thiscategory";



for($j=0; $j<=$#classifyarray; $j++)
{

       $display=$classifyarrayname[$j];
       $display =~ s/ /&nbsp;/g;
            
       print "<li><font size=2>$display&nbsp;&nbsp;</font>\n";
          
       $optionname=$lang{'All Categories'};
       $optionname =~ s/ /&nbsp;/g;
       print <<ENDOFTEXT;
      <ul> <li><a href=\# onClick="document.$_[7].category.value='all'; document.$_[7].classify.value='$classifyarray[$j]'; document.getElementById('categorydisplay').innerHTML='&nbsp; <font size=2>$display</font>';"><font size=2>$optionname</font></a></li>
ENDOFTEXT

      for($k=0; $k<=$#{$categoryarray{"$classifyarray[$j]"}};  $k++)
      {
            $value=$categoryarray{"$classifyarray[$j]"}[$k];
            $optionname=$categoryarrayname{"$classifyarray[$j]"}[$k];

	    $optionname =~ s/ /&nbsp;/g;
            print <<ENDOFTEXT;
	       <li><a href=\# onClick="document.$_[7].category.value='$value'; document.$_[7].classify.value='$classifyarray[$j]'; document.getElementById('categorydisplay').innerHTML='&nbsp; <font size=2>$optionname</font>';"><font size=2>$optionname&nbsp;&nbsp;</font></a></li>
ENDOFTEXT
      }
      while($k<$#classifyarray)
      {
            print "<li><font size=2>&nbsp;&nbsp;</font></font></li>\n";
	    $k++;
      }
      print "</ul>\n";
      print "</li>\n";

}

	  print<<ENDOFTEXT; 
		        </ul>
			</div>
                      </nav>
                      </div>
ENDOFTEXT

print <<ENDOFTEXT;
     <div class="col-3">
ENDOFTEXT

	  if($input{'user'} ne "staff")
	  {
		  print <<ENDOFTEXT;
          
<button type="button" class="btn btn-outline-dark" onClick="window.location.href='b1cart.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&language=$input{'language'}&browser=$input{'browser'}&browsere=$input{'browsere'}&cart='+document.$_[7].cart.value">
    <span class="material-icons">shopping_cart</span>
    <span>$lang{'Shopping Cart'}</span>
</button>
ENDOFTEXT
          }
 
     print <<ENDOFTEXT;
     </div>
<div class="col-2">&nbsp;</div>
ENDOFTEXT

    }

                for($i=0; $i<=$#{$categoryarray{"$input{'classify'}"}}; $i++)
		{
		    if($input{'category'} eq $categoryarray{"$input{'classify'}"}[$i])
	            {
		         $categorydisplay=$categoryarrayname{"$input{'classify'}"}[$i];	    
                    }
		}
		print <<ENDOFTEXT;
                         <div class="col-4">
                 <div class="row pb-4">
    <div class="col-12" id=categorydisplay style="color:white;">
        &nbsp;
        <font size=2>
            $categorydisplay
        </font>
    </div>
    <input class="col-8" name=search value="$input{'search'}" placeholder="Search . . ." aria-label="Search">
    <button class="col-4 btn btn-outline-success my-2 my-sm-0" type="button" onClick="window.location.href='b1search.pl?country='+document.$_[7].country.value+'&city='+document.$_[7].city.value+'&shop='+document.$_[7].shop.value+'&user='+document.$_[7].user.value+'&dllogin='+document.$_[7].dllogin.value+'&dlpasswordenc='+document.$_[7].dlpasswordenc.value+'&classify='+document.$_[7].classify.value+'&category='+document.$_[7].category.value+'&cart='+document.$_[7].cart.value+'&language='+document.$_[7].language.value+'&topleft='+document.$_[7].topleft.value+'&page=1&sortby=postdate&sortorder=descend&browser='+document.$_[7].browser.value+'&browsere='+document.$_[7].browsere.value">
        <span class="material-icons">search</span>
        <span>$lang{'Search'}</span>
    </button>
  </div>
  </div>
ENDOFTEXT

    print<<ENDOFTEXT;
                      <div class="col-3"></div><div class="col-3">
ENDOFTEXT
	  
#	  <input type="button" value="$lang{'Search'}" onClick="window.location.href='b1search.pl?country='+document.$_[7].country.value+'&city='+document.$_[7].city.value+'&shop='+document.$_[7].shop.value+'&user='+document.$_[7].user.value+'&dllogin='+document.$_[7].dllogin.value+'&dlpasswordenc='+document.$_[7].dlpasswordenc.value+'&classify='+document.$_[7].classify.value+'&category='+document.$_[7].category.value+'&cart='+document.$_[7].cart.value+'&language='+document.$_[7].language.value+'&topleft='+document.$_[7].topleft.value+'&page='+document.$_[7].page.value+'&sortby='+document.$_[7].sortby.value+'&sortorder='+document.$_[7].sortorder.value+'&browser='+document.$_[7].browser.value+'&browsere='+document.$_[7].browsere.value">

	  if($input{'user'} ne "staff")
	  {
		  print <<ENDOFTEXT;
&nbsp;&nbsp;<font color=white>$lang{'Access:'}</font>&nbsp;&nbsp;<input name=access size=5>&nbsp;&nbsp;<button type=button class="btn btn-outline-dark" onClick="window.location.href='b1access.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&language=$input{'language'}&browser=$input{'browser'}&browsere=$input{'browsere'}&access='+document.$_[7].access.value"><span class="material-icons">trending_flat</span>&nbsp;$lang{'Find item'}</button>
ENDOFTEXT
          }
	  elsif($input{'user'} eq "staff")
	  {
		  print <<ENDOFTEXT;
&nbsp;&nbsp;<font color=white>$lang{'Access:'}</font>&nbsp;&nbsp;<input name=access size=5>&nbsp;&nbsp;<button type=button class="btn btn-outline-dark" onClick="window.location.href='b1access.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&user=$input{'user'}&language=$input{'language'}&dllogin=$input{'dllogin'}&dlpasswordenc=$dlpasswordenc&browser=$input{'browser'}&browsere=$input{'browsere'}&access='+document.$_[7].access.value"><span class="material-icons">trending_flat</span>&nbsp;$lang{'Find item'}</button>
ENDOFTEXT
          }

	 print<<ENDOFTEXT;
     </div>
ENDOFTEXT
     print <<ENDOFTEXT;
        <div width=2200 bgcolor=#c4ff0e border=0 cellspacing=0 cellsep=0>
<div id=ClassifyCategory></div></div>
        </div>
        </div>
    <!--</div>
    </div>-->

<script language="JavaScript">
<!--
function LinkTo(link, division)
{


if(link == "inventory") document.location.href="a1search.pl?country=$input{'country'}&city=$input{'city'}&shop=$input{'shop'}&classify=$input{'classify'}&division="+division+"&language=$input{'language'}&cart=$input{'cart'}&model=all&myear=all&saleprice=all&page=1&search=&make=&viewer=$input{'viewer'}&action=inventory&browser="+ navigator.appName+"&browsere="+parseFloat(navigator.appVersion);

}
document.getElementById('pageoutput').innerHTML="$pageoutput";
document.getElementById('ClassifyCategory').innerHTML="$ClassifyCategory";
//-->
</script> 

ENDOFTEXT

}



1; #return true
