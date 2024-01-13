# **Communication Systems I - CA3 - Rayleigh Distribution, WSS Random Proccess, Introduction to Digital Communication**

## Introduction:
In this project, we plan to implement some of the contents of the telecommunication systems course. For this purpose, in the first part, we will learn about the Rayleigh distribution in order to implement the basics of statistics and probabilities. Then, in the second part, we get acquainted with a random process and try to examine it and make the necessary implementations on it. Finally, in the last part, we will examine a digital communication system with MPAM modulation and try to get to know the performance of its transmitter and receiver in the presence of noise.


### Statistics and probability (Rayleigh distribution) -> (P1.m):

In the first part, we examined the Rayleigh distribution and we saw that in the numerical space (not theory) with the increase of samples, the results are closer to the theory and we can achieve the Rayleigh distribution.

The summary of the outputs is as follows:
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/01afe4f0-e479-4144-b6e1-dd77eeae2091)
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/9d21ef18-b58a-478b-a807-29edc5c793ec)




### WSS Random Process -> (P2.m):

In the second part, we examined a random process. We investigated the theoretical and practical aspects of stationarity, comparing the results. It was concluded that the process is Wide-Sense Stationary (WSS).
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/8266ab1b-bdc1-4dcd-800f-6789b32e4b95)
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/474f7d0c-7ab9-4abe-91c7-b32f079db0de)
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/65847ec4-212a-46fa-8bbe-486934152a21)




### Introduction to Digital Communication (Quantization) -> (P3.m):

In the third part, we discussed the digital transmission of an analog signal and its decoding.
First, we sampled the analog signal, then quantized it and mapped it to 32 digital levels. Then, we sent those digits in a noisy channel using the gray code method, the received SNR of which was 2 dB. Then we tried to recover the quantized signal and concluded that this low power modulation method is an effective and low error method.

![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/9400004c-5684-4328-8840-2445a052400e)
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/f47da82b-af25-4803-9b5e-4332f0e9a29d)
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/e47dfd66-6131-44e2-9ad3-2ef2fe1779d4)
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/9adaff4c-ef51-47a1-8a9b-548ed2093c35)
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/6b3d555b-fe77-4617-b8df-94add1eb97c0)
![image](https://github.com/A-Magpie/Communication-Systems---CA3/assets/124941071/bb7f655d-32ab-4ff5-a054-45e38d20222e)


