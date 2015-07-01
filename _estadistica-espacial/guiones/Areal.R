## R programs for BCG Second Edition, pages 88--94.
##set.seed(1234)
library(spdep)
library(maps)
library(maptools)
library(classInt)
library(RColorBrewer)

##Create an adjacency matrix for the states in the US
usa.state = map(database="state", fill=TRUE, plot=FALSE)
state.ID <- sapply(strsplit(usa.state$names, ":"), function(x) x[1])
usa.poly = map2SpatialPolygons(usa.state, IDs=state.ID)
usa.nb = poly2nb(usa.poly)
usa.adj.mat = nb2mat(usa.nb, style="B")

##Write the 0-1 adjacency matrix (not really needed for Moran's I)
W = usa.adj.mat
W[(W>0)] = 1

## Constructing a county neighborhood matrix for the state of Minnesota
##Step1: Create county ID
mn.county = map("county","minnesota", fill=TRUE, plot=FALSE)
county.ID <- sapply(strsplit(mn.county$names, ","), function(x) x[2])
mn.poly = map2SpatialPolygons(mn.county, IDs=county.ID)
##Convert polygon to nb object
mn.nb = poly2nb(mn.poly)
mn.adj.mat = nb2mat(mn.nb, style="B")
## The option style="B" produces the binary adjacency matrix
## Write the 0-1 adjacency matrix 
##W <- mn.adj.mat
##W[(W>0)] <- 1

##Finding neighbors of a county
mn.region.id <- attr(mn.nb, "region.id")
winona.neighbors.index = mn.nb[[match("winona", mn.region.id)]]
winona.neighbors = rownames(mn.adj.mat[winona.neighbors.index,])

## (Optional )Exporting to WinBUGS
sp2WB(mn.poly, "mn_bugs_testing.txt")

## Now create adjacency matrices from shapefiles
## Read shapefile and create polygonal list of the map
mn.map.shp = readShapeSpatial("minnesota.shp")
## Convert the polygonal representation into a neighborhood list 
mn.nb.shp = poly2nb(mn.map.shp)
mn.adj.mat.shp = nb2mat(mn.nb.shp, style="B")

## Write the 0-1 adjacency matrix 
##W2 <- mn.adj.mat.shp
##W2[(W2>0)] <- 1

#Now notice that W and W2 are not in the same order!
adj.with.names.no.match = cbind(rownames(mn.adj.mat), as.character(mn.map.shp$NAME))

##o4W2 <-  order(as.character(mn.map$NAME))
ordered.index =  order(as.character(mn.map.shp$NAME))

##W2 <- W2[o4W2, o4W2]
mn.adj.mat.shp = mn.adj.mat.shp[ordered.index, ordered.index]

#now they are in the same order
##adj.with.names.match = cbind(as.character(mn.map.shp$NAME)[as.numeric(rownames(mn.map.shp))+1], rownames(mn.adj.mat))


## Computing Moran's I and Geary's C ##
##Read the SAT scores
state.sat.scores = read.table("state-sat.dat", header=T)
##Extract the SAT scores from the 48 contiguous states
##x = ((state.sat.scores$STATE=="alaska") | (state.sat.scores$STATE=="d.c.") | (state.sat.scores$STATE=="hawaii") | (state.sat.scores$STATE=="us"))
x = ((state.sat.scores$STATE=="alaska") | (state.sat.scores$STATE=="hawaii") | (state.sat.scores$STATE=="us"))
index = c(1:nrow(state.sat.scores))[x]
state.sat.scores.contig = state.sat.scores[-index,]

##Create a listw object to be passed to the "moran" and "geary" functions
usa.listw = nb2listw(usa.nb, style="W")
moran.out = moran.test(state.sat.scores.contig$VERBAL, listw=usa.listw, randomisation=TRUE)
moran.I = moran.out$estimate[1]
moran.I.se = sqrt(moran.out$estimate[3])

geary.out = geary.test(state.sat.scores.contig$VERBAL, listw=usa.listw, randomisation=TRUE)
geary.C = geary.out$estimate[1]
geary.C.se = sqrt(geary.out$estimate[3])


##SAR and CAR modeling using spdep package  

nc.sids <- readShapePoly(system.file("etc/shapes/sids.shp", package="spdep")[1],ID="FIPSNO", proj4string=CRS("+proj=longlat +ellps=clrk66"))

rn <- sapply(slot(nc.sids, "polygons"), function(x) slot(x, "ID"))

ncCC89.nb <- read.gal(system.file("etc/weights/ncCC89.gal", package="spdep")[1],
region.id=rn)

##Create a map of raw SIDS rates
##First create a vector of rates from counts
nc.sids.rates.raw = probmap(nc.sids$SID79, nc.sids$BIR79)$raw
##Alternatvely, one may want to use Freeman-Tukey transformations
nc.sids.rates.FT = sqrt(1000) * (sqrt(nc.sids$SID79/nc.sids$BIR79) + sqrt((nc.sids$SID79 + 1)/nc.sids$BIR79))

##Append the rates we want to plot to the nc.sids data frame
nc.sids$rates.FT = nc.sids.rates.FT

brks = c(0, 2.0, 3.0, 3.5, 6.0)
spplot(nc.sids, "rates.FT", at = brks, col.regions = rev(brewer.pal(4,"RdBu")))

##Compute Moran's I and Geary's C
ncCC89.listw = nb2listw(ncCC89.nb, style="B", zero.policy=TRUE)
##ncCR85.listw = nb2listw(ncCR85.nb, style="W", zero.policy=TRUE)
nc.sids.moran.out = moran.test(nc.sids.rates.FT, listw=ncCC89.listw, zero.policy=TRUE)
nc.sids.geary.out = geary.test(nc.sids.rates.FT, listw=ncCC89.listw, zero.policy=TRUE)

##SAR model regressing rates.FT on NWBIR79.FT
##Begin with a Freeman-Tukey transformation on non-white birth rates
nc.sids.nwbir.FT = sqrt(1000) * (sqrt(nc.sids$NWBIR79/nc.sids$BIR79) + sqrt((nc.sids$NWBIR79 + 1)/nc.sids$BIR79))
nc.sids$nwbir.FT = nc.sids.nwbir.FT
## Use errorsarlm and lagsarlm 
##nc.sids.sar.out = errorsarlm(rates.FT~ nwbir.FT, data=nc.sids, listw=ncCC89.listw, zero.policy=TRUE)
nc.sids.sar.out = spautolm(rates.FT~ nwbir.FT, data=nc.sids, family="SAR", listw=ncCC89.listw, zero.policy=TRUE)
nc.sids.lagsar.out = lagsarlm(rates.FT~ nwbir.FT, data=nc.sids, listw=ncCC89.listw, zero.policy=TRUE)
nc.sids.sar.fitted = fitted(nc.sids.sar.out)
nc.sids$fitted.sar = nc.sids.sar.fitted

##CAR model regressing rates.FT on NWBIR79.FT
nc.sids.car.out = spautolm(rates.FT~ nwbir.FT, data=nc.sids, family="CAR", listw=ncCC89.listw, zero.policy=TRUE)
nc.sids.car.fitted = fitted(nc.sids.car.out)
nc.sids$fitted.car = nc.sids.car.fitted

##Draw the maps using the spplot (trellis) graphics function
##postscript(file="nc_sids_sar_actual.eps")
##print(spplot(nc.sids, "rates.FT", at = brks, col.regions = rev(brewer.pal(4,"RdBu")), main="a) Actual SIDS rates"))
##dev.off()
##postscript(file="nc_sids_sar_fitted.eps")
##print(spplot(nc.sids, "fitted.sar", at = brks, col.regions = rev(brewer.pal(4,"RdBu")), main="b) Fitted SIDS rates from SAR model"))
##dev.off()

##Draw the maps using the maps function
library(maps)
library(classInt)
color.pallete = rev(brewer.pal(4,"RdBu"))
class.raw = classIntervals(var=nc.sids$rates.FT, n=4, style="fixed", fixedBreaks=brks, dataPrecision=4)
color.code.raw = findColours(class.raw, color.pallete)
class.fitted = classIntervals(var=nc.sids$fitted.sar, n=4, style="fixed", fixedBreaks=brks, dataPrecision=4)
color.code.fitted = findColours(class.fitted, color.pallete)

leg.txt = c("<2.0", "2.0-3.0", "3.0-3.5",">3.5")

postscript(file="SidsSar.ps", horizontal=FALSE)
par(mfrow=c(2,1), oma = c(0,0,4,0) + 0.1, mar = c(0,0,1,0) + 0.1)
plot(nc.sids, col=color.code.raw)
title("a) Raw Freeman-Tukey transformed SIDS rates" )
legend("bottomleft", legend=leg.txt, cex=1.25, bty="n", horiz = FALSE, fill = color.pallete)
plot(nc.sids, col=color.code.fitted)
title("b) Fitted SIDS rates from SAR model")
dev.off()


## Constructing neighbors using distances: Columbus example

columbus.poly <- readShapePoly(system.file("etc/shapes/columbus.shp", package="spdep")[1])

##There are two different ways to create a neighbor object for columbus
##Method 1a: Use poly2nb with queen type neighbors
columbus.queen.nb = poly2nb(columbus.poly, queen=TRUE)
##Method 1b: Use poly2nb with rook type neighbors
columbus.rook.nb = poly2nb(columbus.poly, queen =FALSE)
##Method 2: Use the read.gal file to read a GAL file 
columbus.gal.nb <- read.gal(system.file("etc/weights/columbus.gal", package="spdep")[1])

##Compute Moran's I and Geary's C
##We make two distinct listw objects for the rook and gal neighbors
columbus.gal.listw = nb2listw(columbus.gal.nb, style="B", zero.policy=TRUE)
columbus.rook.listw = nb2listw(columbus.rook.nb, style="B", zero.policy=TRUE)
##We now compute Moran's I and Geary's C for each of these neighbors
columbus.gal.moran.out = moran.test(columbus.poly$CRIME, listw=columbus.gal.listw, zero.policy=TRUE)
columbus.rook.moran.out = moran.test(columbus.poly$CRIME, listw=columbus.rook.listw, zero.policy=TRUE)
columbus.gal.geary.out = geary.test(columbus.poly$CRIME, listw=columbus.gal.listw, zero.policy=TRUE)
columbus.rook.geary.out = geary.test(columbus.poly$CRIME, listw=columbus.rook.listw, zero.policy=TRUE)


##SAR model regressing HOVAL+INC
columbus.gal.sar.out = spautolm(CRIME~HOVAL+INC, data=columbus.poly, family="SAR", listw=columbus.gal.listw, zero.policy=TRUE)
columbus.gal.sar.fitted = fitted(columbus.gal.sar.out)
columbus.poly$fitted.gal.sar = columbus.gal.sar.fitted

columbus.rook.sar.out = spautolm(CRIME~HOVAL+INC, data=columbus.poly, family="SAR", listw=columbus.rook.listw, zero.policy=TRUE)
columbus.rook.sar.fitted = fitted(columbus.rook.sar.out)
columbus.poly$fitted.rook.sar = columbus.rook.sar.fitted

##CAR model regressing CRIME on HOVAL + INCOME
columbus.car.out = spautolm(CRIME~HOVAL+INC, data=columbus.poly, family="CAR", listw=columbus.rook.listw, zero.policy=TRUE)
columbus.car.fitted = fitted(columbus.car.out)
columbus.poly$fitted.car = columbus.car.fitted

##Distance based neighbors in spdep
columbus.coords = coordinates(columbus.poly)
columbus.knn = knearneigh(columbus.coords)
columbus.knn2nb = knn2nb(columbus.knn)
columbus.dist.list = nbdists(columbus.knn2nb, columbus.coords)
columbus.dist.vec = unlist(columbus.dist.list)
columbus.dist.max = max(columbus.dist.vec)
columbus.dnn.nb = dnearneigh(columbus.coords, 0, 0.25*columbus.dist.max)

##Form a listw object using the distance-based nearest neighbors 
columbus.dnn.listw = nb2listw(columbus.dnn.nb, style="B", zero.policy=TRUE)

##SAR model regressing HOUSE_VAL+INCOME using distance-based nearest neighbors
columbus.dnn.sar.out = spautolm(CRIME~HOVAL+INC, data=columbus.poly, family="SAR", listw=columbus.dnn.listw, zero.policy=TRUE)
columbus.dnn.sar.fitted = fitted(columbus.dnn.sar.out)
columbus.poly$fitted.dnn.sar = columbus.dnn.sar.fitted

##CAR model regressing HOUSE_VAL+INCOME using distance-based nearest neighbors
columbus.dnn.car.out = spautolm(CRIME~HOVAL+INC, data=columbus.poly, family="CAR", listw=columbus.dnn.listw, zero.policy=TRUE)
columbus.dnn.car.fitted = fitted(columbus.dnn.car.out)
columbus.poly$fitted.dnn.car = columbus.dnn.car.fitted

##Draw the maps using the spplot (trellis) graphics function
##postscript(file="nc_sids_sar_actual.eps")
##print(spplot(nc.sids, "rates.FT", at = brks, col.regions = rev(brewer.pal(4,"RdBu")), main="a) Actual SIDS rates"))
##dev.off()
##postscript(file="nc_sids_sar_fitted.eps")
##print(spplot(nc.sids, "fitted.sar", at = brks, col.regions = rev(brewer.pal(4,"RdBu")), main="b) Fitted SIDS rates from SAR model"))
##dev.off()

##detach(package:spdep)
##detach(package:maptools)
##detach(package:RColorBrewer)
