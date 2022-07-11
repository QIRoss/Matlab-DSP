b = fir1(66, 0.25);

freqz(b,1);

zplane(b,1);

[voiceY, voiceFs]   = audioread('WhatsApp-Audio-2022-06-13-at-18.31.51.wav');

voice_5seconds_sample   = voiceY(1:240000);

resampled_10khz_voice = resample(voice_5seconds_sample, 5, 24);

y = filter(b, 1, resampled_10khz_voice);

S = spectrogram(y, 512);
figure,mesh(abs(S));

voice_variance  = var(resampled_10khz_voice);

voice_with_noise_10db = resampled_10khz_voice + sqrt(voice_variance/10)*randn(size(resampled_10khz_voice));

y0 = filter(b, 1, voice_with_noise_10db);

S1 = spectrogram(y0, 512);
figure,mesh(abs(S1));

%soundsc(voice_with_noise_10db, 10000);
