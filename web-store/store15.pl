

sub More_Country_Initialize
{


=begin comment
%hosts=("base" => "http://localhost/server/market",
               "kc" => "http://localhost/server/market",
   );


%cookiedomains= ("base" =>"",
               "kc" =>"",
);

%cookiepaths= ( "base" =>"",
               "kc" =>"",
);


=end comment
=cut


%hosts=( "base" => "http://www.auto-grade.org/server/market",
               "kc" => "http://www.auto-grade.org/server/market",
);



%cookiedomains=("base" => ";domain=www.auto-grade.org",
               "kc" => ";domain=www.auto-grade.org",
 );


%cookiepaths= ("base"  =>  ";path=/",
               "kc" =>  ";path=/",
   );


#$fileprefix: product files, $httpprefix: common include, $dbprefix: db files.
#imageprefix: product images, $codeprefix: cgi-bin.

$fileprefix =  "../../../serverdata/market/classify";
$imageprefix = "../image";
$opprefix = "../../../serverdata/market/marketop";
$opimageprefix = "../marketop";
$codeprefix="/cgi-bin/";

$customerdirectory = "cusdata";
$purchasedirectory = "invoice";
$purchasefiledeletetimedif=604800;

$dateformat="mm/dd/yy";
}


sub Country_Initialize
{
local (*in) = shift if @_;    # CGI input


#@cities=("albuquerque", "altanta", "austin", "baltimore", "boston", "charlotte", "chicago", "cincinnati", 
#"cleveland", "columbus", "dallasftworth", "denverboulder", "detroit", "houston", 
#"indianapolis", "kc", "lasvegas", "littlerock", "losangeles", "memphis", "miami",
#"milwaukee", "minneapolisstpaul", "montreal", "nashville", "newhaven", "newyork", "oklahomacity", #"orlando", 
#"ottawa", "philadelphia", "phoenix", "pittsburgh", "portland", "puertorico", "raleighdurhamchapelhill", #"renotahoe", "rochester", "sacramento", "saltlakecity", "sanantonio", "sandiego", "sanfrancisco", "sanjose", #"santafe", "seattle", "spokane", "stlouis", "tampa", "toronto", "tucson", 
#"vancouver", "washingtondc", "wilmington");

@cities=("kc");

#@cityname=("Albuquerque", "Atlanta", "Austin", "Baltimore", "Boston", "Charlotte", "Chicago", #"Cincinnati", "Cleveland", "Columbus", "Dallas/Ft. Worth", "Denver/Boulder", "Detroit", "Houston", 
#"Indianapolis", "Kansas City", "Las Vegas", "Little Rock", "Los Angeles", "Memphis", "Miami",
#"Milwaukee", "Minneapolis/St Paul", "Montreal", "Nashville", "New Haven", "New York", "Oklahoma #City", "Orlando", "Ottawa", "Philadelphia", "Phoenix", "Pittsburgh", "Portland", "Puerto Rico", "Raleigh-#Durham-Chapel Hill", "Reno/Tahoe", "Rochester", "Sacramento", "Salt Lake City", "San Antonio", "San #Diego", "San Francisco", "San Jose", "Santa Fe", "Seattle", "Spokane", "St. Louis", "Tampa", "Toronto", #"Tucson", 
#"Vancouver", "Washington DC", "Wilmington");

@cityname=("$lang{'Kansas City'}");

######End Auto Work Section, Start Common Section

@provincesstates=(
                   "$lang{'North America'}", 
                   "$lang{'Washington DC'}",
                   "$lang{'Alberta'}",
                   "$lang{'Alabama'}", 
                   "$lang{'Alaska'}",
                   "$lang{'Arkansas'}", 
                   "$lang{'Arizona'}", 
                   "$lang{'British Columbia'}", 
                   "$lang{'California'}", 
                   "$lang{'Colorado'}", 
                   "$lang{'Connecticut'}",
                   "$lang{'Delaware'}",
                   "$lang{'Florida'}", 
                   "$lang{'Georgia'}", 
                   "$lang{'Hawaii'}", 
                   "$lang{'Iowa'}", 
                   "$lang{'Idaho'}", 
                   "$lang{'Illinois'}", 
                   "$lang{'Indiana'}", 
                   "$lang{'Kansas'}",  
                   "$lang{'Kentucky'}", 
                   "$lang{'Louisiana'}", 
                   "$lang{'Massachusetts'}", 
                   "$lang{'Manitoba'}", 
                   "$lang{'Maryland'}", 
                   "$lang{'Maine'}",
                   "$lang{'Michigan'}", 
                   "$lang{'Minnesota'}", 
                   "$lang{'Missouri'}", 
                   "$lang{'Mississippi'}", 
                   "$lang{'Montana'}", 
                   "$lang{'New Brunswick'}",
                   "$lang{'North Carolina'}", 
                   "$lang{'North Dakota'}", 
                   "$lang{'Nebraska'}",  
                   "$lang{'Newfoundland'}", 
                   "$lang{'New Hampshire'}",
                   "$lang{'New Jersy'}", 
                   "$lang{'New Mexico'}", 
                   "$lang{'Northwest Territories'}", 
                   "$lang{'Nova Scotia'}",
                   "$lang{'Nevada'}", 
                   "$lang{'New York'}", 
                   "$lang{'Ohio'}", 
                   "$lang{'Oklahoma'}",  
                   "$lang{'Ontario'}", 
                   "$lang{'Oregan'}", 
                   "$lang{'Pennsylvania'}",  
                   "$lang{'Prince Edward Island'}", 
                   "$lang{'Quebec'}", 
                   "$lang{'Rhode Island'}", 
                   "$lang{'South Carolina'}", 
                   "$lang{'South Dakota'}", 
                   "$lang{'Saskatchewan'}",
                   "$lang{'Tennessee'}", 
                   "$lang{'Texas'}", 
                   "$lang{'Utah'}", 
                   "$lang{'Virginia'}", 
                   "$lang{'Vermont'}", 
                   "$lang{'Washington'}",
                   "$lang{'Wisconsin'}",
                   "$lang{'West Virginia'}",
                   "$lang{'Wyoming'}",
                   "$lang{'Yukon'}", 
                   "$lang{'Other'}",

);

@provincestatearr =("NA", 
                   "Washington DC",
                   "AB",                          #  <!-- Alberta -->
                   "AL",                          #  <!-- Alabama -->
                   "AK",                          #  <!-- Alaska -->
                   "AR",                           #  <!-- Arkansas -->
                   "AZ",                           #  <!-- Arizona -->
                   "BC",                           #  <!-- British Columbia -->
                   "CA",                           #  <!-- California -->
                   "CO",                           #  <!-- Colorado -->
                   "CT",                           #  <!-- Connecticut -->
                   "DE",                           #  <!-- Delaware -->
                   "FL",                            # <!-- Florida -->
                   "GA",                           #  <!-- Georgia -->
                   "HI",                            #  <!--Hawaii -->
                   "IA",                            #   <!-- Iowa -->
                   "ID",                            #   <!-- Idaho -->
                   "IL",                             #   <!-- Illinois -->
                   "IN",                             # <!-- Indiana -->
                   "KS",                            # <!-- Kansas --> 
                   "KY",                           # <!-- Kentucky -->
                   "LA",                            #  <!-- Louisiana -->
                   "MA",                           #  <!-- Massachusetts -->
                   "MB",                           #  <!-- Manitoba -->
                    "MD",                          #  <!-- Maryland -->
                    "ME",                          #   <!-- Maine -->
                    "MI",                           #    <!-- Michigan -->
                    "MN",                         #  <!-- Minnesota -->
                    "MO",                         #   <!-- Missouri -->
                    "MS",                          #   <!-- Mississippi -->
                    "MT",                          #  <!-- Montana  -->
                    "NB",                          #   <!-- New Brunswick -->
                    "NC",                          #   <!-- North Carolina -->
                    "ND",                          #  <!-- North Dakota -->
                    "NE",                          #  <!-- Nebraska --> 
                    "NF",                          #  <!-- Newfoundland -->
                    "NH",                         # <!-- New Hampshire -->
                    "NJ",                          #   <!-- New Jersy -->
                    "NM",                        #  <!-- New Mexico -->
                    "NT",                         #   <!-- Northwest Territories -->
                    "NS",                         #   <!-- Nova Scotia -->
                    "NV",                         #  <!-- Nevada -->
                    "NY",                         #  <!-- New York -->
                    "OH",                         #  <!-- Ohio -->
                    "OK",                         # <!-- Oklahoma --> 
                    "ON",                         # <!-- Ontario -->
                    "OR",                         #  <!-- Oregan -->
                    "PA",                         #   <!-- Pennsylvania --> 
                    "PE",                          #  <!-- Prince Edward Island -->
                    "PQ",                         #   <!-- Quebec -->
                    "RI",                          #   <!-- Rhode Island -->
                    "SC",                         #   <!-- South Carolina --> 
                    "SD",                         #   <!-- South Dakota -->
                    "SK",                         #   <!-- Saskatchewan -->
                    "TN",                         #   <!-- Tennessee -->
                    "TX",                         #   <!-- Texas -->
                    "UT",                         #  <!-- Utah -->
                    "VA",                        #   <!-- Virginia -->
                    "VT",                         #   <!-- Vermont -->
                    "WA",                        #  <!-- Washington -->
                    "WI",                         #   <!-- Wisconsin -->
                    "WV",                       #  <!-- West Virginia -->
                    "WY",                       #  <!-- Wyoming -->
                    "YK",                         #  <!-- Yukon -->
                    "Other",
);



@classifyarrayname=(
        "$lang{'peripherals'}",
        "$lang{'accessories'}",
        "$lang{'hardware'}",
        "$lang{'devices'}",
);

@classifyarray=(
        "peripherals",
        "accessories",
        "hardware",
        "devices",
);

$defaultclassifyarrayname="$lang{'devices'}";
$defaultclassifyarray="devices";

%categoryarray=(
        "peripherals" => [
                "mice",
                "keyboards",
                "speakers",
                "headphones",
        ],
        "accessories" => [
                "adapters",
                "chargers",
                "cables",
                "mousepads",
                "powerstrips",
        ],
        "hardware" => [
                "graphicscards",
                "powersupplies",
                "memory",
                "CPUs",
                "motherboards",
        ],
        "devices" => [
                "laptops",
                "phones",
                "monitors",
                "routers",
        ],
);

%defaultcategoryarray=(
        "peripherals" => [ "mice" ],
        "accessories" => [ "adapters" ],
        "hardware" => [ "graphicscards" ],
        "devices" => [ "laptops" ],
);

%categoryarrayname=(
        "peripherals" => [
                "$lang{'mice'}",
                "$lang{'keyboards'}",
                "$lang{'speakers'}",
                "$lang{'headphones'}",
        ],
        "accessories" => [
                "$lang{'adapters'}",
                "$lang{'chargers'}",
                "$lang{'cables'}",
                "$lang{'mousepads'}",
                "$lang{'powerstrips'}",
        ],
        "hardware" => [
                "$lang{'graphicscards'}",
                "$lang{'powersupplies'}",
                "$lang{'memory'}",
                "$lang{'CPUs'}",
                "$lang{'motherboards'}",
        ],
        "devices" => [
                "$lang{'laptops'}",
                "$lang{'phones'}",
                "$lang{'monitors'}",
                "$lang{'routers'}",
        ],
);

%categoryarrayattri=(
        "peripherals" => {
                "mice" => ["_sku"],
                "keyboards" => ["_sku"],
                "speakers" => ["_sku"],
                "headphones" => ["_sku"],
        },
        "accessories" => {
                "adapters" => ["_sku"],
                "chargers" => ["_sku"],
                "cables" => ["_sku"],
                "mousepads" => ["_sku"],
                "powerstrips" => ["_sku"],
        },
        "hardware" => {
                "graphicscards" => ["_sku"],
                "powersupplies" => ["_sku"],
                "memory" => ["_sku"],
                "CPUs" => ["_sku"],
                "motherboards" => ["_sku"],
        },
        "devices" => {
                "laptops" => ["_sku"],
                "phones" => ["_sku"],
                "monitors" => ["_sku"],
                "routers" => ["_sku"],
        },
);

%categoryarrayattriname=(
        "peripherals" => {
                "mice" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "keyboards" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "speakers" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "headphones" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
        },
        "accessories" => {
                "adapters" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "chargers" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "cables" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "mousepads" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "powerstrips" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
        },
        "hardware" => {
                "graphicscards" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "powersupplies" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "memory" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "CPUs" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "motherboards" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
        },
        "devices" => {
                "laptops" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "phones" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "monitors" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
                "routers" => ["$lang{'sku'}|8|&nbsp;&nbsp;"],
        },
);


@postdurationarray=("$lang{'One Week'}", "$lang{'Two Weeks'}", "$lang{'One Month'}", "$lang{'Two Months'}", "$lang{'Three Months'}" , "$lang{'Six Months'}",  
                                        "$lang{'One Year'}", "$lang{'Two Years'}", "$lang{'Three Years'}",
                                        "$lang{'Nonexpire'}");

@postdurationday=("7", "14", "0", "0", "0", "0", "0", "0", "0", "0" );

$defaultpostdurationday= ("0");                 


@postdurationmonth=("0", "0", "1", "2", "3", "6", "0", "0", "0", "0" ),


$defaultpostdurationmonth="0";

@postdurationyear=("0", "0", "0", "0", "0", "0", "1", "2", "3", "20");
                               

$defaultpostdurationyear = "20";


@postdurationname=("oneweek", "twoweeks", "onemonth", "twomonths", "threemonths",
                                                       "sixmonths", "oneyear", "twoyear", "threeyear",
                                                       "nonexpire");

$defaultpostdurationname = "nonexpire";


@adpricearray=("0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00", "0.00");

$defaultadprice = ("0.00");


@picpricearray=("1.00", "1.00", "1.00", "1.00", "1.00", "1.00", "1.00", "1.00", "1.00", "1.00");
                        

$defaultpicprice= "1.00";

#$taxrate{"kc"} = ("0.07525");
$taxrate{"kc"} = ("0.0825");

}


1; #return true
