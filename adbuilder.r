#############################################
#                                           #
# Ad Builder Code for Google AdWords Ads    #
# Created by BrainTrust Insights, 2018      #
# Licensed under the GNU General Public     #
# License, Version 3.0 US. Full license is  #
# in the LICENSE file. Downloading or using #
# this software constitutes acceptance of   #
# the license in whole.                     #
#                                           #
# This software is provided as-is with      #
# absolutely no warranty or promise of...   #
# well, anything. Use at your own risk. No  #
# support of any kind is included.          #
#                                           #
# Author: Christopher S. Penn               #
# https://braintrustinsights.com/           #
#                                           #
#############################################

## Housekeeping - set the basics

# Time Zone
Sys.setenv(TZ = "America/New_York")
today <- Sys.Date()
unixtime <- as.character(as.numeric(as.POSIXct(today)))

# Set working directory
wd <- "/users/cspenn/desktop/"
setwd(wd)

# Specify output files
output.file.keywords <-
  paste(wd, "keywords-", unixtime, ".csv", sep = "")
output.file.ads <- paste(wd, "ads-", unixtime, ".csv", sep = "")

## Keywords
# keywords are binary, two word permutations - the starting word and the ending word
# There's no limit to how long each list can be other than compute time, so go wild.

startlist <-
  c(
    "Facebook",
    "Google",
    "Twitter",
    "Instagram"
  )
endlist <-
  c(
    "influencers",
    "marketers",
    "marketing",
    "advice"
  )

# Mix the lists
keyworddf <- expand.grid(startlist, endlist)
keyworddf$final <- paste(keyworddf$Var1, keyworddf$Var2)

# Write the result to disk
write.csv(keyworddf$final, output.file.keywords)

## Ads

# As with the keywords, there's no limit to how many you combine. This will create
# permutations with each of the headlines and descriptions.

# headline1 is 30 characters max per line
headline1 <-
  c(
    "Not hitting your goals?",
    "Missing your goals?",
    "Missed your goals?"
  )

# headline2 is 30 characters max per line
headline2 <-
  c("Let us help!",
    "We can help!",
    "Ask us for help!")

# description is 80 characters total
description  <-
  c(
    "ACME Ads are better - learn more.",
    "ACME Ads do better - learn more.",
    "ACME Ads are better - click here.",
    "ACME Ads do better - click here."
  )

# permute
addf <- expand.grid(headline1, headline2, description)

# rename columns
names(addf)[1]<- "Headline 1"
names(addf)[2]<- "Headline 2"
names(addf)[3]<- "Description"

# write to disk
write.csv(addf, output.file.ads)
