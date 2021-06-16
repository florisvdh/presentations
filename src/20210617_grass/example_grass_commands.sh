# grass -c EPSG:31370 --tmp-location

g.gui 2> /dev/null &
g.manual -i
v.in.ogr input='https://geoservices.informatievlaanderen.be/overdrachtdiensten/BWK/wfs?service=WFS&request=GetFeature&typename=BWK%3ABwkhab&bbox=130000%2C184000%2C138000%2C194000' output=habbox -c -o
v.info map=habbox
v.in.ogr input='https://geoservices.informatievlaanderen.be/overdrachtdiensten/BWK/wfs?service=WFS&request=GetFeature&typename=BWK%3ABwkhab&bbox=130000%2C184000%2C138000%2C194000' output=habbox -o --overwrite
v.info -c habbox

g.proj -w

# v.category habbox option=report
# v.db.connect -p habbox

# v.reclass input=habbox output=habeval column=EVAL

v.dissolve input=habbox output=habeval column=EVAL
v.db.select map=habeval

g.region -p
g.region vector=habeval res=1 -sa
g.region -p

v.to.rast input=habeval output=reval use=cat label_column=EVAL memory=2048
r.report reval units=h sort=desc -n
r.stats reval -anl sep=tab sort=desc


