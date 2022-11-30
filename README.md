# crashes-hawkes-process
This repository contains the RStudio functions used for the thesis "[Modelling Crashes as Self-Exciting Point Process: A Study in Dhaka Metropolitan Area](https://engrxiv.org/preprint/view/2656/5006)"

## About the Thesis
The thesis investigates whether the crashes in Dhaka Metropolitan Area (DMA) are self-exciting or not. A univariate exponentially decaying model is selected considering the crashes as a Hawkes Process with four parameters.
- Background intensity 𝜇;
- Parameter 𝛼 denoting an increase in crash intensity once a crash takes place;
- Intensity decay rate 𝛽; and
- The time of influence of a crash on the system 𝜏.

The Most Likely Estimate of the parameters are calculated using the Likelihood Equation. The negative of log of likelihood equation is minimized using the optim function in RStudio, which is analogous to maximizing the Likelihood Equation.

## About the Repository
The repository contains two functions used in RStudios for the study.
- `neg_loglikelihood`
- `generate_mle_table`

### RStudio Version
The version of RStudio used for the function is:
- 2022.02.3+492 "Prairie Trillium" Release (1db809b8323ba0a87c148d16eb84efe39a8e7785, 2022-05-20) for Windows Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.12.8 Chrome/69.0.3497.128 Safari/537.36

### `neg_loglikelihood`
The `neg_loglikelihood` function is the function of interest that needs to be optimized for the study. The function takes two inputs: `params` and `data`.
- `params` is a vector containing the initial guesses of the parameters mu, alpha, beta and gamma in the order. 
- `data` is a vector containing the timestamps of the crashes for which the likelihood is optimized

The function processes the value of the variable `loglik` using the formula provided in the [study](https://engrxiv.org/preprint/view/2656/5006) and returns `-loglik`. 

### `generate_mle_table`
The `generate_mle_table` function is used to generate an excel file containing the optimized values of the parameters along with the provided intial guesses and the likelihood value. `writexl` library is required for the function to create the excel file.

### How to install / use
A user can copy the contents of the code and paste them directly in RStudios to replicate the functions. They may make certain modifications as deemed necessary.

### Required libraries
The `writexl` library is required for the `generate_mle_table` function.

## Acknowledgments
The thesis is conducted under the supervision of Dr. Md. Mizanur Rahman, Professor, Department of Civil Engineering, Bangladesh University of Engineering and Technology and the guidance of Dr. Md. Asif Raihan, Assistant Professor, Accident Research Institute, Bangladesh University of Engineering and Technology.

The codes are developed with the help of studies conducted by Li. et al. ([link](https://doi.org/10.1016/j.ress.2018.07.035)) and the comments on a StackExchange post created by Dave Anderson ([link](https://stats.stackexchange.com/q/24685)).

## Contact
For any further query related to the code, contact: `rahman.fahimur21@gmail.com`
