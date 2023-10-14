library(janitor)
library(readxl)
library(dplyr)
library(lettervalue)
library(KbMvtSkew)
library(e1071)


## n = 1000
## 
##        amostra                     
##        ----------------------------
## M 500.5|          50.195          |
## F 250.5| 42.1               57.08 |
## 1 1    | 18.94              78.64 |

# O coeficiente de bowley é calculado da seguinte forma: 
# Sb= (Q3+Q1−2Q2 / Q3−Q1)

# Trimédia:

trimedia <- (42.1 + 2 * 50.195 + 57.08) / 4

# f-spread (diferença de quartis):

f_spread <- (57.08 - 42.1)

# f-sigma:

f_pseudo_sigma <- f_spread / 1.349

# f-pseudo variancia:

f_pseudo_variance <- f_pseudo_sigma^2

# Limite inferior: Q1 – 1,5 (Q3 - Q1)
# 
# Limite superior: Q3 + 1,5 (Q3 - Q1)

LI <- 42.1  - 1.5*(57.08 - 42.1)

LS <- 57.08 - 1.5*(57.08 - 42.1)

# segunda questão ---------------------------------------------------------

f_spread <- (98.2625 - 91.5425)

# f-sigma:

f_sigma <- f_spread / 1.359

# pseudo variance:

f_pseudo_variance <- f_sigma^2

# trimédia:

trimedia <- (91.5425 + 2 * 95.7850 + 98.2625) / 4


LI <- 91.5425 - 1.5*(98.2625 - 91.5425)

LS <- 98.2625 - 1.5*(98.2625 - 91.5425)
