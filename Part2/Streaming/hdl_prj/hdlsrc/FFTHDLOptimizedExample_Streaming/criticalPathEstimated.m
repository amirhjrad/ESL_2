open_system('gm_FFTHDLOptimizedExample_Streaming');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'lightblue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_FFTHDLOptimizedExample_Streaming/FFT Streaming/FFT', 'user2');
annotate_port('gm_FFTHDLOptimizedExample_Streaming/FFT Streaming/FFT', 0, 1, 'cp : 3.51 ns');
