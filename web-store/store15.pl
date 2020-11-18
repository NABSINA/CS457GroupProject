

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



@classifyarrayname=("$lang{'Appliances'}", "$lang{'Bath'}", "$lang{'Building Materials'}", 
"$lang{'Door & Windows'}", "$lang{'Electrical'}",  
"$lang{'Flooring'}",  "$lang{'Heating & Cooling'}", "$lang{'Kitchen'}", "$lang{'Lighting & Ceiling Fans'}", "$lang{'Lumber & Composites'}", "$lang{'Outdoors'}", "$lang{'Paint'}", "$lang{'Plumbing'}", 
"$lang{'Storage & Organization'}", "$lang{'Tools'}");


@classifyarray=("appliances", "bath", "buildingmaterials", "doorandwindows", "electrical", "flooring", "heatingandcooling",  "kitchen", "lightingandceilingfans", 
"lumberandcomposites", "outdoors", "paint", "plumbing", "storageandorganization", "tools");

$defaultclassifyarrayname="$lang{'Appliances'}";
$defaultclassifyarray="appliances";

%categoryarray=("appliances" => ["appliancespartsandaccessories", 
                                       "dishwashers",
                                       "freezers",
                                       "garbagedisposals",
                                       "microwaves",
                                       "rangehoods",
                                       "ranges",
                                       "smallappliances",
                                       "vacuums",
                                       "ovens",
                                       "washersanddryers",
                                       "watercoolers"],

                "bath" =>  ["bathroomcabinets", 
                                "bathroomfans",
                                "faucets",
                                "mirrors",
                                "sinks",
                                "bathtubs",
                                "showersandshoweraccessories",
                                "toiletsandtoiletseats"],

                "buildingmaterials" => ["ceilings", 
                                                   "concretecementandmasonry", 
                                                   "decking", 
                                                   "drywall", 
                                                   "fireplaceaccessories",
                                                   "glassandacrylic",
                                                   "insulationandaccessories",
                                                   "ladders",
                                                   "lumber",
                                                   "mouldingandwallpanels",
                                                   "roofingandgutters",
                                                   "sidingandstoneveneer",
                                                   "stairsandrailings",
                                                   "ventilation"],

                "doorandwindows" => ["awningsandaccessories",
                            "doors", 
                            "exteriorshuttersandaccessories", 
                            "garagedoorsandopeners", 
                            "windows"], 

       "electrical"=> ["batteries", "cableandwireconnectors", 
                       "circuitbreakers",
                       "conduitandconduitfittings", 
                            "dimmersandswitches", "doorbells",
                            "electricalboxesandcovers",
                            "electricaloutlesandadapters",
                            "electricaltools",
                            "extensioncords",
                            "generators",
                            "lightsockets",
                            "wallplates"
],

          "flooring" => ["carpet", 
                            "floormoulding", 
                            "flooringtools",
                            "hardwoodflooring",
                            "rugs",
                            "tileandstone",
                            "vinylflooring"],

          "heatingandcooling" => ["airconditioners", 
                            "airfilters",
                            "airpurifiers",
                            "atticventilation",
                            "fireplaces",
                            "heaters", 
                            "humidifiersanddehumidifiers",
                            "thermostats"],

          "kitchen"=> ["kitchenfaucets", "kitchensinks",
                       "kitchencabinets",
                       "kitchencountertops",
                       "kitchenwalltiles"] ,


          "lightingandceilingfans" => ["bathroomlighting",
                                       "ceilingfans",
                                       "ceilinglights",
                                       "chandeliersandpendantlighting",
                                       "kitchenlighting",
                                       "lampsandlampshades",
                                       "landscapelighting",
                                       "lightingbulbs",
                                       "timers"
                                    ],
 
          "lumberandcomposites" => ["boards",
                                    "decking",
                                    "fencing",
                                    "paneling",
                                    "plywoodandsheathing",
                                    "shimsandwoodshingles",
                                    "timber"],

          "outdoors" => ["animalandpetcare", "birdcare",
                         "grills",
                         "hottubs",
                         "patiofurniture",
                         "playsetsandswingsets",
                         "pools"],

               "paint"  =>  ["caulking", "cleaners", "dropclothsandsheeting", "gluesandtapes", "paintandprimer", "paintbrushesrollersandkits", "paintcleanup", 
                               "paintsprayers", "patching", "sanding",  
                               "scrapersbladesandtools", "stainsandsealers", "thinnersandremovers"],

        "plumbing"  => ["augersplungersdrainopeners", "laudrytubsandfaucets", "pipes", "plumbingtools", "pumpsandtanks", "valves", "waterfiltrationandwatersoftners", "waterheaters"],
 
  "storageandorganization"  => ["closetstorage", "foldingtablesandchairs", "garagestorage", "hooksandracks",  "laudrystorage", "movingboxesandsupplies", 
"officestorage", "shelves", "storagetotesandbaskets"],

        "tools"  => ["airtoolsandcompressors", "drillanddrillbits", "greaseguns", "grindersandpolishers", "handtools", "joinersandplaners", "measuringtools", "nailersandstaplers", "powersawsandsawblades", "pressesandlathes", 
"rotarytoolsandoscillatingtools", "routersandrouterbits", "sandersandsandpaper",
"toolbatteriesandchargers", "weldingandcutting"],

);

%defaultcategoryarray=(
                       "appliances" => ["appliancespartsandaccessories"],
                       "bath" =>  ["faucets"],
                       "buildingmaterials" => ["concretecementandmasonry"],
                       "doorandwindows" => ["windows"],
                       "electrical"=> ["electricalboxesandcovers"],
                       "flooring" => ["carpet"],
                       "heatingandcooling" => ["airfilters"],
                       "kitchen"=> ["kitchenfaucets"],
                       "lightingandceilingfans" => ["lightingbulbs"],
                       "lumberandcomposites" => ["timber"],
                       "outdoors" => ["patiofurniture"],
                       "paint"  =>  ["caulking"],
                       "plumbing"  => ["waterheaters"],
                       "storageandorganization"  => ["closetstorage"],
                       "tools"  => ["airtoolsandcompressors"],
                        
);

%categoryarrayname=("appliances" => ["$lang{'Appliances Parts & Accessories'}", 
                                       "$lang{'Dishwashers'}",
                                       "$lang{'Freezers'}",
                                       "$lang{'Garbage Disposals'}",
                                       "$lang{'Microwaves'}",
                                       "$lang{'Range Hoods'}",
                                       "$lang{'Ranges'}",
                                       "$lang{'Small Appliances'}",
                                       "$lang{'Vacuums'}",
                                       "$lang{'Ovens'}",
                                       "$lang{'Washers & Dryers'}",
                                       "$lang{'Water Coolers'}"],

                "bath" =>  ["$lang{'Bathroom Cabinets'}", 
                                "$lang{'Bathroom Fans'}",
                                "$lang{'Faucets'}",
                                "$lang{'Mirrors'}",
                                "$lang{'Sinks'}",
                                "$lang{'Bathtubs'}",
                                "$lang{'Showers & Shower Accessories'}",
                                "$lang{'Toilets & Toilet Seats'}"],

                "buildingmaterials" => ["$lang{'Ceilings'}", 
                                                   "$lang{'Concrete Cement & Masonry'}", 
                                                   "$lang{'Decking'}", 
                                                   "$lang{'Drywall'}", 
                                                   "$lang{'Fireplace Accessories'}",
                                                   "$lang{'Glass & Acrylic'}",
                                                   "$lang{'Insulation & Accessories'}",
                                                   "$lang{'Ladders'}",
                                                   "$lang{'Lumber'}",
                                                   "$lang{'Moulding & Wallpanels'}",
                                                   "$lang{'Roofing & Gutters'}",
                                                   "$lang{'Siding & Stone Veneer'}",
                                                   "$lang{'Stairs & Ailings'}",
                                                   "$lang{'Ventilation'}"],

                "doorandwindows" => ["$lang{'Awnings & Accessories'}",
                            "$lang{'Doors'}", 
                            "$lang{'Exterior Shutters & Accessories'}", 
                            "$lang{'Garage Doors & Openers'}", 
                            "$lang{'Windows'}"], 

       "electrical"=> ["$lang{'Batteries'}", "$lang{'Cable & Wire Connectors'}", 
                       "$lang{'Circuit Breakers'}",
                       "$lang{'Conduit & Conduit Fittings'}", 
                            "$lang{'Dimmers & Switches'}", "$lang{'Door Bells'}",
                            "$lang{'Electrical Boxes & Covers'}",
                            "$lang{'Electrical Outles & Adapters'}",
                            "$lang{'Electrical Tools'}",
                            "$lang{'Extension Cords'}",
                            "$lang{'Generators'}",
                            "$lang{'Light Sockets'}",
                            "$lang{'Wall Plates'}"
],

          "flooring" => ["$lang{'Carpet'}", 
                            "$lang{'Floor Moulding'}", 
                            "$lang{'Flooring Tools'}",
                            "$lang{'Hardwood Flooring'}",
                            "$lang{'Rugs'}",
                            "$lang{'Tile & Stone'}",
                            "$lang{'Vinyl Flooring'}"],

          "heatingandcooling" => ["$lang{'Air Conditioners'}", 
                            "$lang{'Air Filters'}",
                            "$lang{'Air Purifiers'}",
                            "$lang{'Attic Ventilation'}",
                            "$lang{'Fireplaces'}",
                            "$lang{'Heaters'}", 
                            "$lang{'Humidifiers & Dehumidifiers'}",
                            "$lang{'Thermostats'}"],

          "kitchen"=> ["$lang{'Kitchen Faucets'}", "$lang{'Kitchen Sinks'}",
                       "$lang{'Kitchen Cabinets'}",
                       "$lang{'Kitchen Countertops'}",
                       "$lang{'Kitchen Wall Tiles'}"] ,


          "lightingandceilingfans" => ["$lang{'Bathroom Lighting'}",
                                       "$lang{'Ceiling Fans'}",
                                       "$lang{'Ceiling Lights'}",
                                       "$lang{'Chandeliers & Pendant Lighting'}",
                                       "$lang{'Kitchen Lighting'}",
                                       "$lang{'Lamps & Lamp Shades'}",
                                       "$lang{'Landscape Lighting'}",
                                       "$lang{'Lighting Bulbs'}",
                                       "$lang{'Timers'}"
                                    ],
 
          "lumberandcomposites" => ["$lang{'Boards'}",
                                    "$lang{'Decking'}",
                                    "$lang{'Fencing'}",
                                    "$lang{'Paneling'}",
                                    "$lang{'Plywood & Sheathing'}",
                                    "$lang{'Shims & Wood Shingles'}",
                                    "$lang{'Timber'}"],

          "outdoors" => ["$lang{'Animal & Pet Care'}", "$lang{'Bird Care'}",
                         "$lang{'Grills'}",
                         "$lang{'Hot Tubs'}",
                         "$lang{'Patio Furniture'}",
                         "$lang{'Play Sets & Swing Sets'}",
                         "$lang{'Pools'}"],

               "paint"  =>  ["$lang{'Caulking'}", "$lang{'Cleaners'}", "$lang{'Drop Cloths & Sheeting'}", "$lang{'Glues & Tapes'}", "$lang{'Paint & Primer'}", "$lang{'Paint Brushes, Rollers & Kits'}", "$lang{'Paint Cleanup'}", 
                               "$lang{'Paint Sprayers'}", "$lang{'Patching'}", "$lang{'Sanding'}",  
                               "$lang{'Scrapers, Blades & Tools'}", "$lang{'Stains & Sealers'}", "$lang{'Thinners & Removers'}"],

        "plumbing"  => ["$lang{'Augers, Plungers, Drain Openers'}", "$lang{'Laudry Tubs & Faucets'}", "$lang{'Pipes'}", "$lang{'Plumbing Tools'}", "$lang{'Pumps & Tanks'}", "$lang{'Valves'}", "$lang{'Water Filtration & Water Softners'}", "$lang{'Water Heaters'}"],
 
  "storageandorganization"  => ["$lang{'Closet Storage'}", "$lang{'Folding Tables & Chairs'}", "$lang{'Garage Storage'}", "$lang{'Hooks & Racks'}",  "$lang{'Laudry Storage'}", "$lang{'Moving Boxes & Supplies'}", 
"$lang{'Office Storage'}", "$lang{'Shelves'}", "$lang{'Storage Totes & Baskets'}"],

        "tools"  => ["$lang{'Air Tools & Compressors'}", "$lang{'Drill & Drill Bits'}", "$lang{'Grease Guns'}", "$lang{'Grinders & Polishers'}", "$lang{'Hand Tools'}", "$lang{'Joiners & Planers'}", "$lang{'Measuring Tools'}", "$lang{'Nailers & Staplers'}", "$lang{'Power Saws & Saw Blades'}", "$lang{'Presses & Lathes'}", 
"$lang{'Rotary Tools & Oscillating Tools'}", "$lang{'Routers & Router Bits'}", "$lang{'Sanders & Sand Paper'}",
"$lang{'Tool Batteries & Chargers'}", "$lang{'Welding & Cutting'}"],

);

%categoryarrayattri=("appliances" => {"appliancespartsandaccessories" => [],
                                       "dishwashers" => [],
                                       "freezers" => [],
                                       "garbagedisposals"=>[],
                                       "microwaves"=>[],
                                       "rangehoods"=>[],
                                       "ranges"=>[],
                                       "smallappliances"=>[],
                                       "vacuums"=>[],
                                       "ovens"=>[],
                                       "washersanddryers" => [],
                                       "watercoolers"=>[]},

                "bath" =>  { "bathroomcabinets"=>[], 
                                "bathroomfans"=>[],
                                "faucets"=>[],
                                "mirrors"=>[],
                                "sinks"=>[],
                                "bathtubs"=>[],
                                "showersandshoweraccessories"=>[],
                                "toiletsandtoiletseats"=>[]},

                "buildingmaterials" => {"ceilings"=>[], 
                                                   "concretecementandmasonry"=>[], 
                                                   "decking"=>[], 
                                                   "drywall"=>[], 
                                                   "fireplaceaccessories"=>[],
                                                   "glassandacrylic"=>[],
                                                   "insulationandaccessories"=>[],
                                                   "ladders"=>[],
                                                   "lumber"=>[],
                                                   "mouldingandwallpanels" =>[],
                                                   "roofingandgutters"=>[],
                                                   "sidingandstoneveneer"=>[],
                                                   "stairsandrailings"=>[],
                                                   "ventilation"=>[]},

                "doorandwindows" => { "awningsandaccessories"=>[],
                            "doors"=>[], 
                            "exteriorshuttersandaccessories"=>[], 
                            "garagedoorsandopeners"=>[], 
                            "windows"=>[]}, 

       "electrical"=> {"batteries"=>[], "cableandwireconnectors"=>[], 
                       "circuitbreakers"=>[],
                       "conduitandconduitfittings"=>[], 
                            "dimmersandswitches"=>[], "doorbells"=>[],
                            "electricalboxesandcovers"=>[],
                            "electricaloutlesandadapters"=>[],
                            "electricaltools"=>[],
                            "extensioncords"=>[],
                            "generators"=>[],
                            "lightsockets"=>[],
                            "wallplates"
=>[]},

          "flooring" => {"carpet"=>[], 
                            "floormoulding"=>[], 
                            "flooringtools"=>[],
                            "hardwoodflooring"=>[],
                            "rugs"=>[],
                            "tileandstone"=>[],
                            "vinylflooring"=>[]},

          "heatingandcooling" => {"airconditioners"=>[], 
                            "airfilters"=>[],
                            "airpurifiers"=>[],
                            "atticventilation"=>[],
                            "fireplaces"=>[],
                            "heaters"=>[], 
                            "humidifiersanddehumidifiers"=>[],
                            "thermostats"=>[]},

          "kitchen"=> {"kitchenfaucets"=>[], "kitchensinks"=>[],
                       "kitchencabinets"=>[],
                       "kitchencountertops"=>[],
                       "kitchenwalltiles" =>[]},


          "lightingandceilingfans" => {"bathroomlighting"=>[],
                                       "ceilingfans"=>[],
                                       "ceilinglights"=>[],
                                       "chandeliersandpendantlighting"=>[],
                                       "kitchenlighting"=>[],
                                       "lampsandlampshades"=>[],
                                       "landscapelighting"=>[],
                                       "lightingbulbs"=>[],
                                       "timers" =>[]},
 
          "lumberandcomposites" => {"boards"=>[],
                                    "decking"=>[],
                                    "fencing"=>[],
                                    "paneling"=>[],
                                    "plywoodandsheathing"=>[],
                                    "shimsandwoodshingles"=>[],
                                    "timber"=>[]},

          "outdoors" => {"animalandpetcare"=>[], "birdcare"=>[],
                         "grills"=>[],
                         "hottubs"=>[],
                         "patiofurniture"=>[],
                         "playsetsandswingsets"=>[],
                         "pools"=>[]},

               "paint"  =>  {"caulking"=>[], "cleaners"=>[], "dropclothsandsheeting"=>[], "gluesandtapes"=>[], "paintandprimer"=>[], "paintbrushesrollersandkits"=>[], "paintcleanup"=>[], 
                               "paintsprayers"=>[], "patching"=>[], "sanding"=>[],  
                               "scrapersbladesandtools"=>[], "stainsandsealers"=>[], "thinnersandremovers"=>[]},

        "plumbing"  => {"augersplungersdrainopeners"=>[], "laudrytubsandfaucets"=>[], "pipes"=>[], "plumbingtools"=>[], "pumpsandtanks"=>[], "valves"=>[], "waterfiltrationandwatersoftners"=>[], "waterheaters"=>[]},
 
  "storageandorganization"  => {"closetstorage"=>[], "foldingtablesandchairs"=>[], "garagestorage"=>[], "hooksandracks"=>[],  "laudrystorage"=>[], "movingboxesandsupplies"=>[], 
"officestorage"=>[], "shelves"=>[], "storagetotesandbaskets"=>[]},

        "tools"  => {"airtoolsandcompressors"=>[], "drillanddrillbits"=>[], "greaseguns"=>[], "grindersandpolishers"=>[], "handtools"=>[], "joinersandplaners"=>[], "measuringtools"=>[], "nailersandstaplers"=>[], "powersawsandsawblades"=>[], "pressesandlathes"=>[], 
"rotarytoolsandoscillatingtools"=>[], "routersandrouterbits"=>[], "sandersandsandpaper"=>[],
"toolbatteriesandchargers"=>[], "weldingandcutting"=>[]},

);


%categoryarrayattriname=("appliances" => {"appliancespartsandaccessories" => [],
                                       "dishwashers" => [],
                                       "freezers" => [],
                                       "garbagedisposals"=>[],
                                       "microwaves"=>[],
                                       "rangehoods"=>[],
                                       "ranges"=>[],
                                       "smallappliances"=>[],
                                       "vacuums"=>[],
                                       "ovens"=>[],
                                       "washersanddryers" =>[],
                                       "watercoolers"=>[]},

                "bath" =>  { "bathroomcabinets"=>[], 
                                "bathroomfans"=>[],
                                "faucets"=>[],
                                "mirrors"=>[],
                                "sinks"=>[],
                                "bathtubs"=>[],
                                "showersandshoweraccessories"=>[],
                                "toiletsandtoiletseats"=>[]},

                "buildingmaterials" => {"ceilings"=>[], 
                                                   "concretecementandmasonry"=>[], 
                                                   "decking"=>[], 
                                                   "drywall"=>[], 
                                                   "fireplaceaccessories"=>[],
                                                   "glassandacrylic"=>[],
                                                   "insulationandaccessories"=>[],
                                                   "ladders"=>[],
                                                   "lumber"=>[],
                                                   "mouldingandwallpanels"=>[],
                                                   "roofingandgutters"=>[],
                                                   "sidingandstoneveneer"=>[],
                                                   "stairsandrailings"=>[],
                                                   "ventilation"=>[]},

                "doorandwindows" => { "awningsandaccessories"=>[],
                            "doors"=>[], 
                            "exteriorshuttersandaccessories"=>[], 
                            "garagedoorsandopeners"=>[], 
                            "windows"=>[]}, 

       "electrical"=> {"batteries"=>[], "cableandwireconnectors"=>[], 
                       "circuitbreakers"=>[],
                       "conduitandconduitfittings"=>[], 
                            "dimmersandswitches"=>[], "doorbells"=>[],
                            "electricalboxesandcovers"=>[],
                            "electricaloutlesandadapters"=>[],
                            "electricaltools"=>[],
                            "extensioncords"=>[],
                            "generators"=>[],
                            "lightsockets"=>[],
                            "wallplates"
=>[]},

          "flooring" => {"carpet"=>[], 
                            "floormoulding"=>[], 
                            "flooringtools"=>[],
                            "hardwoodflooring"=>[],
                            "rugs"=>[],
                            "tileandstone"=>[],
                            "vinylflooring"=>[]},

          "heatingandcooling" => {"airconditioners"=>[], 
                            "airfilters"=>[],
                            "airpurifiers"=>[],
                            "atticventilation"=>[],
                            "fireplaces"=>[],
                            "heaters"=>[], 
                            "humidifiersanddehumidifiers"=>[],
                            "thermostats"=>[]},

          "kitchen"=> {"kitchenfaucets"=>[], "kitchensinks"=>[],
                       "kitchencabinets"=>[],
                       "kitchencountertops"=>[],
                       "kitchenwalltiles" =>[]},


          "lightingandceilingfans" => {"bathroomlighting"=>[],
                                       "ceilingfans"=>[],
                                       "ceilinglights"=>[],
                                       "chandeliersandpendantlighting"=>[],
                                       "kitchenlighting"=>[],
                                       "lampsandlampshades"=>[],
                                       "landscapelighting"=>[],
                                       "lightingbulbs"=>[],
                                       "timers" =>[]},
 
          "lumberandcomposites" => {"boards"=>[],
                                    "decking"=>[],
                                    "fencing"=>[],
                                    "paneling"=>[],
                                    "plywoodandsheathing"=>[],
                                    "shimsandwoodshingles"=>[],
                                    "timber"=>[]},

          "outdoors" => {"animalandpetcare"=>[], "birdcare"=>[],
                         "grills"=>[],
                         "hottubs"=>[],
                         "patiofurniture"=>[],
                         "playsetsandswingsets"=>[],
                         "pools"=>[]},

               "paint"  =>  {"caulking"=>[], "cleaners"=>[], "dropclothsandsheeting"=>[], "gluesandtapes"=>[], "paintandprimer"=>[], "paintbrushesrollersandkits"=>[], "paintcleanup"=>[], 
                               "paintsprayers"=>[], "patching"=>[], "sanding"=>[],  
                               "scrapersbladesandtools"=>[], "stainsandsealers"=>[], "thinnersandremovers"=>[]},

        "plumbing"  => {"augersplungersdrainopeners"=>[], "laudrytubsandfaucets"=>[], "pipes"=>[], "plumbingtools"=>[], "pumpsandtanks"=>[], "valves"=>[], "waterfiltrationandwatersoftners"=>[], "waterheaters"=>[]},
 
  "storageandorganization"  => {"closetstorage"=>[], "foldingtablesandchairs"=>[], "garagestorage"=>[], "hooksandracks"=>[],  "laudrystorage"=>[], "movingboxesandsupplies"=>[], 
"officestorage"=>[], "shelves"=>[], "storagetotesandbaskets"=>[]},

        "tools"  => {"airtoolsandcompressors"=>[], "drillanddrillbits"=>[], "greaseguns"=>[], "grindersandpolishers"=>[], "handtools"=>[], "joinersandplaners"=>[], "measuringtools"=>[], "nailersandstaplers"=>[], "powersawsandsawblades"=>[], "pressesandlathes"=>[], 
"rotarytoolsandoscillatingtools"=>[], "routersandrouterbits"=>[], "sandersandsandpaper"=>[],
"toolbatteriesandchargers"=>[], "weldingandcutting"=>[]},

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
