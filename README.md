# pyo
pyo is a Python module containing classes for a wide variety of audio signal processing types. With pyo, user will be able to include signal processing chains directly in Python scripts or projects, and to manipulate them in real time through the interpreter. Tools in pyo module offer primitives, like mathematical operations on audio signal, basic signal processing (filters, delays, synthesis generators, etc.), but also complex algorithms to create sound granulation and others creative audio manipulations. pyo supports OSC protocol (Open Sound Control), to ease communications between softwares, and MIDI protocol, for generating sound events and controlling process parameters. pyo allows creation of sophisticated signal processing chains with all the benefits of a mature, and widely used, general programming language.

Systems : OS X (10.5 -> 10.10), linux, Windows (XP, Vista, 7, 8)
Python versions : 2.6, 2.7
Pyo was awarded second prize in the Lomus 2012 Free Software Competition.

* Radio Pyo
If you want to listen to scripts rendered in real-time, just connect to Radio Pyo !

You want to have your script played on the radio ? Follow the rules !

Softwares using pyo as audio engine
* Zyne : A modular soft synthesizer.
* Soundgrain : A graphical interface where users can draw and edit trajectories to control granular sound synthesis.
* Cecilia 5 : An audio signal processing environment.
* PsychoPy : An open-source application to allow the presentation of stimuli and collection of data for a wide range of neuroscience, psychology and psychophysics experiments.

##Examples
pyo is fully integrated to Python and very simple to use.

* Play a sound:
```
>>> from pyo import *
>>> s = Server().boot()
>>> s.start()
>>> sf = SfPlayer("path/to/your/sound.aif", speed=1, loop=True).out()
```

* Granulate an audio buffer:
```
>>> s = Server().boot()
>>> s.start()
>>> snd = SndTable("path/to/your/sound.aif")
>>> env = HannTable()
>>> pos = Phasor(freq=snd.getRate()*.25, mul=snd.getSize())
>>> dur = Noise(mul=.001, add=.1)
>>> g = Granulator(snd, env, [1, 1.001], pos, dur, 24, mul=.1).out()
```

* Generate melodies:
```
>>> s = Server().boot()
>>> s.start()
>>> wav = SquareTable()
>>> env = CosTable([(0,0), (100,1), (500,.3), (8191,0)])
>>> met = Metro(.125, 12).play()
>>> amp = TrigEnv(met, table=env, mul=.1)
>>> pit = TrigXnoiseMidi(met, dist='loopseg', x1=20, scale=1, mrange=(48,84))
>>> out = Osc(table=wav, freq=pit, mul=amp).out()
```
