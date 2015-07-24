      // connect sine oscillator to D/A convertor (sound card)
      SinOsc s => dac;

      // allow 2 seconds to pass
while( true ) {
      80::ms => now;
          Std.rand2f(30.0, 1000.0) => s.freq;
}
