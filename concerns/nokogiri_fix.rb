# Srape list of Latest headlines articles from main page
#   Goal: Inspecting & revising Scrape code by Beth
#   Reason is that code has problems:
#     1.  it pulls *short* headline from diff place in HTML, not same as full headlines shown on webpage or in RSS feed
#     2.  it doesn't output all 10 headlines; recent try showed 6; 
#         when I inspect HTML in page, this section does some weird update every few seconds which seems to reorder the "li" items

  site = "https://www.sciencedaily.com/news/top/science/"
  page = Nokogiri::HTML(open(site))
  headlines = page.css("ul#featured_shorts li") 
# return value from headlines var in prior line =>

[
#<Nokogiri::XML::Element:0x3ffff7d8886c name="li" 
  children=
  [
  #<Nokogiri::XML::Element:0x3ffff7d8dfc4 name="a" attributes=
    [
    #<Nokogiri::XML::Attr:0x3ffff7d8df10 name="href" value="/releases/2019/07/190724104010.htm"
    >, 
    #<Nokogiri::XML::Attr:0x3ffff7d8defc name="data-tab" value="#featured_tab_1"
    >
    ] 
      children=
        [
        #<Nokogiri::XML::Text:0x3ffff7d97ed4 "Saving Lives by Cutting Air Pollution Levels"
        >
        ]
  >
  ]
>, 
#<Nokogiri::XML::Element:0x3ffff7d99ae0 name="li" 
  children=
      [#<Nokogiri::XML::Element:0x3ffff7d9943c name="a" attributes=
        [#<Nokogiri::XML::Attr:0x3ffff7d992ac name="href" value="/releases/2019/07/190723182249.htm">, #<Nokogiri::XML::Attr:0x3ffff7d99284 name="data-tab" value="#featured_tab_2">
          ] 
          children=[#<Nokogiri::XML::Text:0x3ffff7d9808c "Gene Causes Autism-Like Behavioral Change in ...">]>]>, #<Nokogiri::XML::Element:0x3ffff7da3cd4
name="li" children=[#<Nokogiri::XML::Element:0x3ffff7da3298 name="a" attributes=[#<Nokogiri::XML::Attr:0x3ffff7da3108 name="href" value="/releases/2019/07/190722182136.htm">, #<Nokogiri::XML::Attr:0x3ffff7da30e0 name="data-tab" value="#featured_tab_3">] children=[#<Nokogiri::XML::Text:0x3ffff7da25c8 "Vast Void in Our Cosmic Neighborhood">]>]>, #<Nokogiri::XML::Element:0x3ffff7db5e5c name="li" children=[#<Nokogiri::XML::Element:0x3ffff7db5b3c name="a" attributes=[#<Nokogiri::XML::Attr:0x3ffff7db5ab0 name="href" value="/releases/2019/07/190722182130.htm">, #<Nokogiri::XML::Attr:0x3ffff7db5a9c name="data-tab" value="#featured_tab_4">] children=[#<Nokogiri::XML::Text:0x3ffff7db5150 "Super-Parasitic Plants Steal Relevant Genes">]>]>, #<Nokogiri::XML::Element:0x3ffff7db49f8 name="li" children=[#<Nokogiri::XML::Element:0x3ffff7db4390 name="a" attributes=[#<Nokogiri::XML::Attr:0x3ffff7db42a0 name="href" value="/releases/2019/07/190722182126.htm">, #<Nokogiri::XML::Attr:0x3ffff7db423c name="data-tab" value="#featured_tab_5">] children=[#<Nokogiri::XML::Text:0x3ffff7dbb21c "Widespread Aspirin Use Despite Few Benefits">]>]>, #<Nokogiri::XML::Element:0x3ffff7dbab8c name="li" children=[#<Nokogiri::XML::Element:0x3ffff7dba7b8 name="a" attributes=[#<Nokogiri::XML::Attr:0x3ffff7dba6b4 name="href" value="/releases/2019/07/190722182123.htm">, #<Nokogiri::XML::Attr:0x3ffff7dba68c name="data-tab" value="#featured_tab_6">] children=[#<Nokogiri::XML::Text:0x3ffff7dcb478 "Using Antibiotics Without a Prescription">]>]>, #<Nokogiri::XML::Element:0x3ffff7dcab68 name="li" children=[#<Nokogiri::XML::Element:0x3ffff7dca7d0 name="a" attributes=[#<Nokogiri::XML::Attr:0x3ffff7dca640 name="href" value="/releases/2019/07/190722155240.htm">, #<Nokogiri::XML::Attr:0x3ffff7dca5c8 name="data-tab" value="#featured_tab_7">] children=[#<Nokogiri::XML::Text:0x3ffff7d9a558 "Stone Tool Tradition in Southern Mesoamerica">]>]>, #<Nokogiri::XML::Element:0x3ffff7da7ab4 name="li" children=[#<Nokogiri::XML::Element:0x3ffff7da785c name="a" attributes=[#<Nokogiri::XML::Attr:0x3ffff7da77e4 name="href" value="/releases/2019/07/190722111917.htm">, #<Nokogiri::XML::Attr:0x3ffff7da77d0 name="data-tab" value="#featured_tab_8">] children=[#<Nokogiri::XML::Text:0x3ffff7da6628 "Magnetic Activity in 'Hot Jupiter' Exoplanets">]>]>, #<Nokogiri::XML::Element:0x3ffff7db1d34 name="li" children=[#<Nokogiri::XML::Element:0x3ffff7db1a14 name="a" attributes=[#<Nokogiri::XML::Attr:0x3ffff7db199c name="href" value="/releases/2019/07/190722132520.htm">, #<Nokogiri::XML::Attr:0x3ffff7db1974 name="data-tab" value="#featured_tab_9">] children=[#<Nokogiri::XML::Text:0x3ffff7db0e84 "Fossil Clams and Evidence of Ancient Meteorite">]>]>, #<Nokogiri::XML::Element:0x3ffff7db0ac4 name="li" children=[#<Nokogiri::XML::Element:0x3ffff7db0718 name="a" attributes=[#<Nokogiri::XML::Attr:0x3ffff7db04d4 name="href" value="/releases/2019/07/190722132448.htm">, #<Nokogiri::XML::Attr:0x3ffff7db0498 name="data-tab"
value="#featured_tab_10">] children=[#<Nokogiri::XML::Text:0x3ffff7da8e78 "Exosomes and Developmental Brain Disorders">]>]>]