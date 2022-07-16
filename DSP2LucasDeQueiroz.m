%1
b = fir1(66, 0.25);
%freqz(b,1);
%zplane(b,1);

%2
[voiceY, voiceFs]   = audioread('WhatsApp-Audio-2022-06-13-at-18.31.51.wav');
voice_5seconds_sample   = voiceY(1:240000);
resampled_10khz_voice = resample(voice_5seconds_sample, 5, 24);
%spectrogram(resampled_10khz_voice, 256, 128, 10000, 'yaxis');
y = filter(b, 1, resampled_10khz_voice);
%spectrogram(y, 256, 128, 10000,'yaxis');
%soundsc(y, 10000);

[saxY, saxFs]   = audioread('code_100475__iluppai__saxophone-weep.wav');
sax_5seconds_sample   = saxY(1:240000);
resampled_10khz_sax = resample(sax_5seconds_sample, 5, 24);
%spectrogram(resampled_10khz_sax, 256, 128, 10000, 'yaxis');
yy = filter(b, 1, resampled_10khz_sax);
%spectrogram(yy, 256, 128, 10000,'yaxis');
%soundsc(yy, 10000);

%3
voice_variance  = var(resampled_10khz_voice);
voice_with_noise_10db = resampled_10khz_voice + sqrt(voice_variance/10)*randn(size(resampled_10khz_voice));
%spectrogram(voice_with_noise_10db, 256, 128, 10000, 'yaxis');
y2 = filter(b, 1, voice_with_noise_10db);
%spectrogram(y2, 256, 128, 10000, 'yaxis');
%soundsc(voice_with_noise_10db, 10000);
%soundsc(y2, 10000);

sax_variance  = var(resampled_10khz_sax);
sax_with_noise_10db = resampled_10khz_sax + sqrt(sax_variance/10)*randn(size(resampled_10khz_sax));
%spectrogram(sax_with_noise_10db, 256, 128, 10000, 'yaxis');
yy2 = filter(b, 1, sax_with_noise_10db);
%spectrogram(yy2, 256, 128, 10000, 'yaxis');
%soundsc(sax_with_noise_10db, 10000);
%soundsc(yy2, 10000);

%4
b2 = fir1(66,[0.25 0.55]);
%freqz(b2,1,512);
%zplane(b2,1);

y3 = filter(b2, 1 , resampled_10khz_voice);
%spectrogram(y3, 256, 128, 10000, 'yaxis');
%soundsc(y3, 10000);

y4 = filter(b2, 1, voice_with_noise_10db);
%spectrogram(y4, 256, 128, 10000, 'yaxis');
%soundsc(y4, 10000);

yy3 = filter(b2, 1 , resampled_10khz_sax);
%spectrogram(yy3, 256, 128, 10000, 'yaxis');
%soundsc(yy3, 10000);

yy4 = filter(b2, 1, sax_with_noise_10db);
%spectrogram(yy4, 256, 128, 10000, 'yaxis');
%soundsc(yy4, 10000);

%5
[n,fo,ao,w] = firpmord([1000 1500],[1 0],[0.0022 0.0022],10000);
b3 = firpm(n,fo,ao,w);
%freqz(b3,1);
%zplane(b3,1);

y5 = filter(b3, 1, resampled_10khz_voice);
%spectrogram(y5, 256, 128, 10000, 'yaxis');
%soundsc(y5, 10000);

y6 = filter(b3, 1, voice_with_noise_10db);
%spectrogram(y6, 256, 128, 10000, 'yaxis');
%soundsc(y6, 10000);

yy5 = filter(b3, 1, resampled_10khz_sax);
%spectrogram(yy5, 256, 128, 10000, 'yaxis');
%soundsc(yy5, 10000);

yy6 = filter(b3, 1, sax_with_noise_10db);
%spectrogram(yy6, 256, 128, 10000, 'yaxis');
%soundsc(yy6, 10000);


%6
[n2,fo2,ao2,w2] = firpmord([1000 1500 2500 3000],[0 1 0],[0.0022 0.0022 0.0022],10000);
b4 = firpm(n2,fo2,ao2,w2);
%freqz(b4,1);
%zplane(b4,1);

y7 = filter(b4, 1, resampled_10khz_voice);
%spectrogram(y7, 256, 128, 10000, 'yaxis');
%soundsc(y7, 10000);

y8 = filter(b4, 1, voice_with_noise_10db);
%spectrogram(y8, 256, 128, 10000, 'yaxis');
%soundsc(y8, 10000);

yy7 = filter(b4, 1, resampled_10khz_sax);
%spectrogram(yy7, 256, 128, 10000, 'yaxis');
%soundsc(yy7, 10000);

yy8 = filter(b4, 1, sax_with_noise_10db);
%spectrogram(yy8, 256, 128, 10000, 'yaxis');
%soundsc(yy8, 10000);