#
# Build the data sets used in the package
#
#############################################################

require(openWAR)

# Get the data from a single game
MetsBraves = gameday()
save(MetsBraves, file = "data/MetsBraves.rda")

# Get the data for the first half of 2013
MLBAM2013 = getData(start = "03-31-2013", end = "07-14-2013")
save(MLBAM2013, file = "data/MLBAM2013.rda")

# Use the data from 2013 to compute WAR
openWAR.2013 = getWAR(MLBAM2013)
save(openWAR.2013, file="data/openWAR.2013.rda")

# Generated the uncertainty estimates
openWAR.2013.sim = shakeWAR(ds, N = 1000)
save(openWAR.2013.sim, file="data/openWAR.2013.sim.rda")