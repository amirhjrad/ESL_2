open_system('gm_FFTHDLOptimizedExample_Burst');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'lightblue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_FFTHDLOptimizedExample_Burst/FFT Burst/FFT', 'user2');
annotate_port('gm_FFTHDLOptimizedExample_Burst/FFT Burst/FFT', 0, 1, 'cp : 1.695 ns');
