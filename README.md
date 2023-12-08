# Tone-Truckin
This is the archive of measurements and scripts I wrote in order to simulate the effects of reading out a resonator with the BLAST frequency-domain multiplexed MKID firmware and the inclusion of my tone tracking algorithm.

## resonator_py_playground
Inside the resonator_py_playground folder you can find a number of python scripts and s2p scattering parameter files measured from an L-C resonator I built by hand in our lab.

### S2P Files
My test resonator was measured in multiple states starting with its rest state, where the resonant frequency is directly proportional to the inverse of its reactive lumped circuit elements (1/sqrt(L*C)). Then, using my thumb, I placed different amounts of pressure on the lumped capacitor in order to interatively include a higher and higher overall capacitance. The effect of this is a shift in resonant frequency perfectly analogous to that which is seen from an MKID experiencing incident power. Scattering parameters were measured at different added capacitances until 8 states were recorded, including the initial rest state. These scattering parameters are stored in the s2p files within the folder resonator_py_playground and represent the frequency and phase responses of a 155MHz resonator in different states. 

### Python Scripts
There are a number of Python scripts in this folder which all do similar tasks, but the main focus should be on Multiple Resonators.ipynb. This is a Jupyter Notebook, so you may need to convert it to Python 3 if you do not have a Jupyter installation (or just download it for free!!!). Within this script, by inserting the file names of the desired s2p files, a user can plot an aribitrary number of resonator measurements and qualitatively examine how the tone-tracking algorithm is able to guess the resonant frequency. Functions for simulating different aspects of the algorithm are found within the script that can be used for finer analysis of the tone-tracking method.

## Jon_Hoh_Cracks_the_SLAC.pptx
This is a powerpoint presentation given to a number of FPGA experts in sub-mm astronomy on the subject of my tone-tracking design and how it compares to the tone-tracking done at SLAC. SLAC is notoriously tight-lipped about their work, and the one paper published on their tone-tracking method for TES bolometers was barely comprehensible and clearly made to confuse others trying to replicate their lucrative proprietary algorithm. Unfortunately for them, I think I managed to use what I knew from my design and decrypt their nebulous explanation. 

