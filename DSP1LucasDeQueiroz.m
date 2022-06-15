% Lucas de Queiroz dos Reis

[saxY, saxFs]       = audioread('code_100475__iluppai__saxophone-weep.wav');
[voiceY, voiceFs]   = audioread('WhatsApp-Audio-2022-06-13-at-18.31.51.wav');

sax_5seconds_sample     = saxY(1:220500);
voice_5seconds_sample   = voiceY(1:240000);

resampled_16khz_sax   = resample(sax_5seconds_sample, 160, 441);
resampled_16khz_voice = resample(voice_5seconds_sample, 1, 3);

resampled_8khz_sax   = resample(sax_5seconds_sample, 80, 441);
resampled_8khz_voice = resample(voice_5seconds_sample, 1, 6);

%soundsc(voice_5seconds_sample, voiceFs);
%soundsc(resampled_16khz_voice, 16000);
%soundsc(resampled_8khz_voice, 8000);

%soundsc(sax_5seconds_sample, saxFs);
%soundsc(resampled_16khz_sax, 16000);
%soundsc(resampled_8khz_sax, 8000);

resampled_4khz_sax   = resample(sax_5seconds_sample, 40, 441);
resampled_4khz_voice = resample(voice_5seconds_sample, 1, 12);

%soundsc(voice_5seconds_sample, voiceFs);
%soundsc(resampled_4khz_voice, 4000);

%soundsc(sax_5seconds_sample, saxFs);
%soundsc(resampled_4khz_sax, 4000);

% voice plots

t_voice_16k = linspace(0, length(resampled_16khz_voice)/16000, length(resampled_16khz_voice) );
figure;
plot(t_voice_16k,resampled_16khz_voice);
title('time domain');
xlabel('time');
ylabel('amplitude');

t_voice_8k = linspace(0, length(resampled_8khz_voice)/8000, length(resampled_8khz_voice) );
figure;
plot(t_voice_8k,resampled_8khz_voice);
title('time domain');
xlabel('time');
ylabel('amplitude');

t_voice_4k = linspace(0, length(resampled_4khz_voice)/4000, length(resampled_4khz_voice) );
figure;
plot(t_voice_4k,resampled_4khz_voice);
title('time domain');
xlabel('time');
ylabel('amplitude');

% sax plots

t_sax_16k = linspace(0, length(resampled_16khz_sax)/16000, length(resampled_16khz_sax) );
figure;
plot(t_sax_16k, resampled_16khz_sax);
title('time domain');
xlabel('time');
ylabel('amplitude');

t_sax_8k = linspace(0, length(resampled_8khz_sax)/8000, length(resampled_8khz_sax) );
figure;
plot(t_sax_8k,resampled_8khz_sax);
title('time domain');
xlabel('time');
ylabel('amplitude');

t_sax_4k = linspace(0, length(resampled_4khz_sax)/4000, length(resampled_4khz_sax) );
figure;
plot(t_voice_4k,resampled_4khz_sax);
title('time domain');
xlabel('time');
ylabel('amplitude');

% spectogram

S = spectrogram(resampled_16khz_sax, 512);
figure,mesh(abs(S));

K = spectrogram(resampled_16khz_voice, 512);
figure,mesh(abs(K));

% SNR

voice_variance  = var(resampled_16khz_voice);
sax_variance    = var(resampled_16khz_sax);

voice_with_noise_0db = resampled_16khz_voice + sqrt(voice_variance)*randn(size(resampled_16khz_voice));
sax_with_noise_0db   = resampled_16khz_sax + sqrt(sax_variance)*randn(size(resampled_16khz_sax));

%soundsc(voice_with_noise_0db, 16000);
%soundsc(sax_with_noise_0db , 16000);

voice_with_noise_10db = resampled_16khz_voice + sqrt(voice_variance/10)*randn(size(resampled_16khz_voice));
sax_with_noise_10db   = resampled_16khz_sax + sqrt(sax_variance/10)*randn(size(resampled_16khz_sax));

%soundsc(voice_with_noise_10db, 16000);
%soundsc(sax_with_noise_10db , 16000);

t_voice_noise_0db = linspace(0, length(resampled_16khz_voice)/16000, length(resampled_16khz_voice) );
figure;
plot(t_voice_noise_0db,voice_with_noise_0db);
title('voice with noise 0db time domain');
xlabel('time');
ylabel('amplitude');

t_voice_noise_10db = linspace(0, length(resampled_16khz_voice)/16000, length(resampled_16khz_voice) );
figure;
plot(t_voice_noise_10db,voice_with_noise_10db);
title('voice with noise 10db time domain');
xlabel('time');
ylabel('amplitude');

t_sax_noise_0db = linspace(0, length(resampled_16khz_voice)/16000, length(resampled_16khz_voice) );
figure;
plot(t_sax_noise_0db,sax_with_noise_0db);
title('sax with noise 0db time domain');
xlabel('time');
ylabel('amplitude');

t_sax_noise_10db = linspace(0, length(resampled_16khz_voice)/16000, length(resampled_16khz_voice) );
figure;
plot(t_sax_noise_10db,sax_with_noise_10db);
title('sax with noise 10db time domain');
xlabel('time');
ylabel('amplitude');

voice0db = spectrogram(voice_with_noise_0db, 512);
figure,mesh(abs(voice0db));

voice10db = spectrogram(voice_with_noise_10db, 512);
figure,mesh(abs(voice10db));

sax0db = spectrogram(sax_with_noise_0db, 512);
figure,mesh(abs(sax0db));

sax10db = spectrogram(sax_with_noise_10db, 512);
figure,mesh(abs(sax10db));