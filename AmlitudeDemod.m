z = ((0.7*Y) + 1).*carrier;
zDmod = z.* carrier;

x = resample(zDmod, 48000, Fs);
Fc = 48000/Fs;
b = fir1(1000, 2*Fc);
demodulated = filtfilt(b,1,x);
demodulated = demodulated';
FinalDemodulate = (demodulated - mean( demodulated ))/0.7;

plot(FinalDemodulate)

%final step the demonstate the initial phase of carrier

nBins = Fs/100;
pass = fir1(nBins, 2*[99900 100100]/Fs);
carr = filtfilt(pass, 1, z);

%this is what you would use if you did not know the carrier's offset and
%then continue demodulation with zDmod = z.*carr