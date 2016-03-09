 r = audiorecorder(48000, 16, 1);
      record(r);     % speak into microphone... no time limit
     % pause(r);
     % p = play(r);   % listen
    %  resume(r);     % speak again
     % stop(r);
    %  p = play(r);   % listen to complete recording
      mySpeech = getaudiodata(r); % get data as int16 array
      
   
        recordblocking(r, 2);     % speak into microphone... with a time limit
        p = play(r);   % listen to complete recording
      
      
Fs = 500000;
t = [0:2*Fs-1]/Fs; 
carrier = cos(2*pi*100000*t);

Y = resample(mySpeech, Fs, 48000);
Y = Y';
z = ((0.7*Y) + 1).*carrier; %index modulation changes how much the amplitude is modulated
plot(abs(fft(z)))

fooz = z([1:100000] + 90000); %grab on part of the signal in the middle
plot(fooz)
frange = ([0:100000-1]/100000)*Fs;
plot(frange, abs(fft(fooz)))

%as index modulation goes towards zero, the side bands get closer to the
%actual frequency and their amplitude gets smaller

%if index modulation becomes one or greater than one, the side bands have
%greater amplitudes ...but its not recommended because an index greater
%than one creates distortion
