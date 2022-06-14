% Lucas de Queiroz dos Reis

[saxY, saxFs]       = audioread('code_100475__iluppai__saxophone-weep.wav');
[voiceY, voiceFs]   = audioread('WhatsApp-Audio-2022-06-13-at-18.31.51.wav');

sax_5seconds_sample     = saxY(1:220500);
voice_5seconds_sample   = voiceY(1:240000);

resampled_8khz_sax   = resample(sax_5seconds_sample, 80, 441);
resampled_8khz_voice = resample(voice_5seconds_sample, 1, 6);

%soundsc(voice_5seconds_sample, voiceFs);
%soundsc(resampled_8khz_voice, 8000);

%soundsc(sax_5seconds_sample, saxFs);
%soundsc(resampled_8khz_sax, 8000);

resampled_4khz_sax   = resample(sax_5seconds_sample, 40, 441);
resampled_4khz_voice = resample(voice_5seconds_sample, 1, 12);

%soundsc(voice_5seconds_sample, voiceFs);
%soundsc(resampled_4khz_voice, 4000);

%soundsc(sax_5seconds_sample, saxFs);
%soundsc(resampled_4khz_sax, 4000);

% voice plots

t_voice_5s = linspace(0, length(voice_5seconds_sample)/voiceFs, length(voice_5seconds_sample) );
figure;
plot(t_voice_5s,voice_5seconds_sample);
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

t_sax_5s = linspace(0, length(sax_5seconds_sample)/saxFs, length(sax_5seconds_sample) );
figure;
plot(t_sax_5s, sax_5seconds_sample);
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

