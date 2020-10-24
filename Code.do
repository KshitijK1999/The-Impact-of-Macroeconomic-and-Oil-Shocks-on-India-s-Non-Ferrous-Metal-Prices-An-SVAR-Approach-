*Line Plots
twoway (line LMI datem)
twoway (line LRI datem)
twoway (line LREX datem)
twoway (line LPCO datem)
twoway (line LPCM datem)
twoway (line LPZM datem)
twoway (line LPLM datem)
twoway (line LPAM datem)
*Scatter Plots (LRI)
twoway (scatter LPCM LRI)
twoway (scatter LPZM LRI, mcolor(green))
twoway (scatter LPLM LRI, mcolor(red))
twoway (scatter LPAM LRI, mcolor(blue))
*Scatter Plots (LREX)
twoway (scatter LPCM LREX)
twoway (scatter LPZM LREX, mcolor(green))
twoway (scatter LPLM LREX, mcolor(red))
twoway (scatter LPAM LREX, mcolor(blue))
*Descriptive Statistics (Levels)
tabstat MI RI REX PCO PCM PZM PLM PAM, statistics( mean count var cv sd skewness kurtosis )
*Descriptive Statistics (Logs)
tabstat LMI LRI LREX LPCO LPCM LPZM LPLM LPAM, statistics( mean count var cv sd skewness kurtosis )
*Unit Root tests (DF test)
dfuller LMI, lags(2)
dfuller LRI , lags(2)
dfuller LREX , lags(2)
dfuller LPCO , lags(2)
dfuller LPCM , lags(2)
dfuller LPZM , lags(2)
dfuller LPLM , lags(2)
dfuller LPAM , lags(2)
dfuller DLMI, lags(2)
dfuller DLRI , lags(2)
dfuller DLREX , lags(2)
dfuller DLPCO , lags(2)
dfuller DLPCM , lags(2)
dfuller DLPZM , lags(2)
dfuller DLPLM , lags(2)
dfuller DLPAM , lags(2)
*Unit Root tests (PP test)
pperron LMI, lags(2)
pperron LRI, lags(2)
pperron LREX, lags(2)
pperron LPCO, lags(2)
pperron LPCM, lags(2)
pperron LPZM, lags(2)
pperron LPLM, lags(2)
pperron LPAM, lags(2)
pperron DLMI, lags(2)
pperron DLRI, lags(2)
pperron DLREX, lags(2)
pperron DLPCO, lags(2)
pperron DLPCM, lags(2)
pperron DLPZM, lags(2)
pperron DLPLM, lags(2)
pperron DLPAM, lags(2)
*Unit Root tests (DF-GLS test)
dfgls LMI, maxlag(2) notrend
dfgls LRI, maxlag(2) notrend
dfgls LREX, maxlag(2) notrend
dfgls LPCO, maxlag(2) notrend
dfgls LPCM, maxlag(2) notrend
dfgls LPZM, maxlag(2) notrend
dfgls LPLM, maxlag(2) notrend
dfgls LPAM, maxlag(2) notrend
dfgls DLMI, maxlag(2) notrend
dfgls DLRI, maxlag(2) notrend
dfgls DLREX, maxlag(2) notrend
dfgls DLPCO, maxlag(2) notrend
dfgls DLPCM, maxlag(2) notrend
dfgls DLPZM, maxlag(2) notrend
dfgls DLPLM, maxlag(2) notrend
dfgls DLPAM, maxlag(2) notrend
*Cointegration tests
vecrank LMI LRI LREX LPCO LPCM, trend(none) max
vecrank LMI LRI LREX LPCO LPZM, trend(none) max
vecrank LMI LRI LREX LPCO LPLM, trend(none) max
vecrank LMI LRI LREX LPCO LPAM, trend(none) max
*Lag lenght Selection
varsoc DLMI DLREX DLPCO DLPCM DLRI, maxlag(12)
varsoc DLMI DLREX DLPCO DLPZM DLRI, maxlag(12)
varsoc DLMI DLREX DLPCO DLPLM DLRI, maxlag(12)
varsoc DLMI DLREX DLPCO DLPAM DLRI, maxlag(12)
*SVAR model for Copper
matrix A = [.,0,0,0,0\.,.,0,0,0\.,.,.,0,0\.,.,.,.,0\.,.,.,.,.]
matrix list A
svar DLRI DLREX DLMI DLPCO DLPCM , lags(1)  beq(A)
varstable
varlmar,mlag(1)
irf create Impulse_of,set(Impulse_of,replace) step(12)
irf set "Impulse_of.irf"
irf graph oirf, set(Impulse_of) impulse(  DLMI   ) response (   DLPCM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLREX   ) response (   DLPCM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLRI   ) response (   DLPCM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLPCO   ) response (   DLPCM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLPCM   ) response (   DLPCM  ) yline(0)
irf table fevd, irf(Impulse_of) impulse(DLRI DLREX DLMI DLPCO DLPCM) response(DLPCM)
*SVAR model for Zinc
svar DLRI DLREX DLMI DLPCO DLPZM , lags(1)  beq(A)
varstable
varlmar,mlag(1)
irf create Impulse_of,set(Impulse_of,replace) step(12)
irf set "Impulse_of.irf"
irf graph oirf, set(Impulse_of) impulse(  DLMI   ) response (   DLPZM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLREX   ) response (   DLPZM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLRI   ) response (   DLPZM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLPCO   ) response (   DLPZM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLPZM   ) response (   DLPZM  ) yline(0)
irf table fevd, irf(Impulse_of) impulse(DLRI DLREX DLMI DLPCO DLPZM) response(DLPZM)
*SVAR model for Lead
svar DLRI DLREX DLMI DLPCO DLPLM , lags(1)  beq(A)
varstable
varlmar,mlag(1)
irf create Impulse_of,set(Impulse_of,replace) step(12)
irf set "Impulse_of.irf"
irf graph oirf, set(Impulse_of) impulse(  DLMI   ) response (   DLPLM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLREX   ) response (   DLPLM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLRI   ) response (   DLPLM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLPCO   ) response (   DLPLM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLPLM   ) response (   DLPLM  ) yline(0)
irf table fevd, irf(Impulse_of) impulse(DLRI DLREX DLMI DLPCO DLPLM) response(DLPLM)
*SVAR model for Aluminium
svar DLRI DLREX DLMI DLPCO DLPAM , lags(1)  beq(A)
varstable
varlmar,mlag(1)
irf create Impulse_of,set(Impulse_of,replace) step(12)
irf set "Impulse_of.irf"
irf graph oirf, set(Impulse_of) impulse(  DLMI   ) response (   DLPAM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLREX   ) response (   DLPAM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLRI   ) response (   DLPAM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLPCO   ) response (   DLPAM  ) yline(0)
irf graph oirf, set(Impulse_of) impulse(  DLPAM   ) response (   DLPAM  ) yline(0)
irf table fevd, irf(Impulse_of) impulse(DLRI DLREX DLMI DLPCO DLPAM) response(DLPAM)
