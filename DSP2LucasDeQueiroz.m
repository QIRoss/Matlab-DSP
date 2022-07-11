%1
b = fir1(66, 0.25);
freqz(b,1);
%zplane(b,1);

%2
[voiceY, voiceFs]   = audioread('WhatsApp-Audio-2022-06-13-at-18.31.51.wav');
voice_5seconds_sample   = voiceY(1:240000);
resampled_10khz_voice = resample(voice_5seconds_sample, 5, 24);
y = filter(b, 1, resampled_10khz_voice);
S = spectrogram(y, 512);
figure,mesh(abs(S));

%3
voice_variance  = var(resampled_10khz_voice);
voice_with_noise_10db = resampled_10khz_voice + sqrt(voice_variance/10)*randn(size(resampled_10khz_voice));
y2 = filter(b, 1, voice_with_noise_10db);
S2 = spectrogram(y2, 512);
figure,mesh(abs(S2));
%soundsc(voice_with_noise_10db, 10000);

%4
b2 = fir1(66,[0.25 0.55]);
freqz(b2,1,512);

y3 = filter(b2, 1 , resampled_10khz_voice);
S3 = spectrogram(y3, 512);
figure,mesh(abs(S3));

y4 = filter(b2, 1, voice_with_noise_10db);
S4 = spectrogram(y4, 512);
figure,mesh(abs(S4));

%5
[n,fo,ao,w] = firpmord([1000 1500],[1 0],[0.001 0.01],10000);
b3 = firpm(n,fo,ao,w);
fvtool(b3,1)

y5 = filter(b3, 1, resampled_10khz_voice);
S5 = spectrogram(y5, 512);
figure,mesh(abs(S5));

y6 = filter(b3, 1, voice_with_noise_10db);
S6 = spectrogram(y6, 512);
figure,mesh(abs(S6));

%6